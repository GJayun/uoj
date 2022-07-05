<?php
	requirePHPLib('form');
	
	if (!isset($_GET['id']) || !validateUInt($_GET['id']) || !($blog = queryBlog($_GET['id'])) || !UOJContext::isHis($blog)) {
		become404Page();
	}
	if ($blog['is_hidden'] && !UOJContext::hasBlogPermission()) {
		become403Page();
	}

    $v8 = new V8Js('PHP');
    $v8->executeString(file_get_contents($_SERVER['DOCUMENT_ROOT'] . '/js/marked.js'), 'marked.js');
    $purifier = HTML::pruifier();
    $marked = function($md) use ($v8, $purifier) {
        try {
            $v8->md = $md;
            return $purifier->purify($v8->executeString('marked(PHP.md)'));
        } catch (V8JsException $e) {
            die(json_encode(array('content_md' => '未知错误')));
        }
    };

    $delete_form = new UOJForm('delete');
    $delete_form->addHidden('delete_id', '0',
        function($delete_id, &$vdata) {
            global $blog;
            if (!validateUInt($delete_id) || $delete_id == 0) {
                return '您要删除的对象不存在';
            }
            $comment = queryBlogComment($delete_id);
            if (!$comment || $comment['blog_id'] != $blog['id']) {
                return '您要删除的对象不存在';
            }
            $vdata['parent'] = $comment;
            return '';
        },
        null
    );
    $delete_form->handle = function() {
        $id = $_POST['id'];
        deleteComment($id);
        $delete_form->succ_href = getLongTablePageRawUri(1);
    };

    $delete_form->submit_button_config['class_str'] = 'ui submit button red';
    $delete_form->submit_button_config['text'] = '确认删除';
    $delete_form->runAtServer();

	$comment_form = new UOJForm('comment');
	$comment_form->addVTextArea('comment', '内容', '',
		function($comment) {
			global $myUser;
			if ($myUser == null) {
				return '请先登录';
			}
			if (!$comment) {
				return '评论不能为空';
			}
			if (strlen($comment) > 1000) {
				return '不能超过1000个字节';
			}
			return '';
		},
		null
	);
	$comment_form->handle = function() {
		global $myUser, $blog, $comment_form, $marked;
		$comment = $marked($_POST['comment']);

		list($comment, $referrers) = uojHandleAtSign($comment, "/post/{$blog['id']}");

		$esc_comment = DB::escape($comment);
		DB::insert("insert into blogs_comments (poster, blog_id, content, reply_id, post_time, zan) values ('{$myUser['username']}', '{$blog['id']}', '$esc_comment', 0, now(), 0)");
		$comment_id = DB::insert_id();

		$rank = DB::selectCount("select count(*) from blogs_comments where blog_id = {$blog['id']} and reply_id = 0 and id < {$comment_id}");
		$page = floor($rank / 20) + 1;

		$uri = getLongTablePageUri($page) . '#' . "comment-{$comment_id}";

		foreach ($referrers as $referrer) {
			$content = '有人在博客 ' . $blog['title'] . ' 的评论里提到你：<a href="' . $uri . '">点击此处查看</a>';
			sendSystemMsg($referrer, '有人提到你', $content);
		}

		if ($blog['poster'] !== $myUser['username']) {
			$content = '有人回复了您的博客 ' . $blog['title'] . ' ：<a href="' . $uri . '">点击此处查看</a>';
			sendSystemMsg($blog['poster'], '博客新回复通知', $content);
		}

		$comment_form->succ_href = getLongTablePageRawUri($page);
	};
	$comment_form->ctrl_enter_submit = true;
	
	$comment_form->runAtServer();
	
	$reply_form = new UOJForm('reply');
	$reply_form->addHidden('reply_id', '0',
		function($reply_id, &$vdata) {
			global $blog;
			if (!validateUInt($reply_id) || $reply_id == 0) {
				return '您要回复的对象不存在';
			}
			$comment = queryBlogComment($reply_id);
			if (!$comment || $comment['blog_id'] != $blog['id']) {
				return '您要回复的对象不存在';
			}
			$vdata['parent'] = $comment;
			return '';
		},
		null
	);
	$reply_form->addVTextArea('reply_comment', '内容', '',
		function($comment) {
			global $myUser;
			if ($myUser == null) {
				return '请先登录';
			}
			if (!$comment) {
				return '评论不能为空';
			}
			if (strlen($comment) > 140) {
				return '不能超过140个字节';
			}
			return '';
		},
		null
	);
	$reply_form->handle = function(&$vdata) {
		global $myUser, $blog, $reply_form, $marked;
		$comment = $marked($_POST['reply_comment']);
		
		list($comment, $referrers) = uojHandleAtSign($comment, "/post/{$blog['id']}");
		
		$reply_id = $_POST['reply_id'];

		$esc_comment = DB::escape($comment);
		DB::insert("insert into blogs_comments (poster, blog_id, content, reply_id, post_time, zan) values ('{$myUser['username']}', '{$blog['id']}', '$esc_comment', $reply_id, now(), 0)");
		$comment_id = DB::insert_id();
		
		$rank = DB::selectCount("select count(*) from blogs_comments where blog_id = {$blog['id']} and reply_id = 0 and id < {$reply_id}");
		$page = floor($rank / 20) + 1;
		
		$uri = getLongTablePageUri($page) . '#' . "comment-{$reply_id}";
		
		foreach ($referrers as $referrer) {
			$content = '有人在博客 ' . $blog['title'] . ' 的评论里提到你：<a href="' . $uri . '">点击此处查看</a>';
			sendSystemMsg($referrer, '有人提到你', $content);
		}
		
		$parent = $vdata['parent'];
		$notified = array();
		if ($parent['poster'] !== $myUser['username']) {
			$notified[] = $parent['poster'];
			$content = '有人回复了您在博客 ' . $blog['title'] . ' 下的评论 ：<a href="' . $uri . '">点击此处查看</a>';
			sendSystemMsg($parent['poster'], '评论新回复通知', $content);
		}
		if ($blog['poster'] !== $myUser['username'] && !in_array($blog['poster'], $notified)) {
			$notified[] = $blog['poster'];
			$content = '有人回复了您的博客 ' . $blog['title'] . ' ：<a href="' . $uri . '">点击此处查看</a>';
			sendSystemMsg($blog['poster'], '博客新回复通知', $content);
		}
		
		$reply_form->succ_href = getLongTablePageRawUri($page);
	};
	$reply_form->ctrl_enter_submit = true;
	
	$reply_form->runAtServer();
	
	$comments_pag = new Paginator(array(
		'col_names' => array('*'),
		'table_name' => 'blogs_comments',
		'cond' => 'blog_id = ' . $blog['id'] . ' and reply_id = 0',
		'tail' => 'order by id asc',
		'page_len' => 20
	));
?>
<?php
	$REQUIRE_LIB['mathjax'] = '';
	$REQUIRE_LIB['shjs'] = '';
?>
<?php echoUOJPageHeader(HTML::stripTags($blog['title']) . ' - 博客', array("jayun_type" => "blogs")) ?>
<?php echoBlog($blog, array('show_title_only' => isset($_GET['page']) && $_GET['page'] != 1)) ?>
<h2>评论</h2>
<div class="_items_1dxav_49">
<?php if ($comments_pag->isEmpty()): ?>
	<div class="ui segment">暂无评论</div>
<?php else: ?>
	<?php foreach ($comments_pag->get() as $comment):
		$poster = queryUser($comment['poster']);
		$esc_email = HTML::escape($poster['email']);
		$asrc = HTML::avatar_addr($poster, 40);
		
		$replies = DB::selectAll("select id, poster, content, post_time from blogs_comments where reply_id = {$comment['id']} order by id");
		foreach ($replies as $idx => $reply) {
            $replies[$idx]['poster_rating'] = queryUser($reply['poster'])['rating'];
            $replies[$idx]['avatar'] = HTML::avatar_addr(queryUser($reply['poster']), 40);
		}
		$replies_json = json_encode($replies);
	?>
	<div id="comment-<?= $comment['id'] ?>" class="_item_1dxav_49">
        <div class="_avatar_1dxav_61">
            <a href="<?= HTML::url('/user/profile/'.$poster['username']) ?>">
                <img class="ui image" src="<?= $asrc ?>" alt="avatar" />
            </a>
        </div>
        <div id="comment-body-<?= $comment['id'] ?>" class="_bubble_1dxav_70">
            <div class="ui block top attached header _header_1dxav_21">
                <div class="_headerContents_1dxav_95">
                    <div class="_left_1dxav_100">
                        <div class="_triangle_1dxav_170"></div>
                        <div class="_username_1dxav_111"><span><?= getUserLink($poster['username']) ?></span></div>
                        <span class="_commentedOn_1dxav_115">@<?= $comment['post_time'] ?></span>
                    </div>
                    <div class="_right_1dxav_142">
                        <?php if (Auth::check() && (isSuperUser(Auth::user()) || Auth::id() == $blog['poster'])): ?>
                        <div class="ui dropdown" id="delete-<?= $comment['id'] ?>" tabindex="0" style="margin: 0 5px;">删除
                            <div class="menu transition hidden" tabindex="-1">
                                <a class="item" href="<?= HTML::url("". $comment['id']) ?>" style="color: red;">
                                    确认删除
                                </a>
                            </div>
                        </div>
                        <script>
                            $(function () {
                                $('#delete-<?= $comment['id'] ?>').dropdown();
                            });
                        </script>
                        <?php endif ?>
                        <a id="reply-to-<?= $comment['id'] ?>" href="#" style="margin: 0 5px;">回复</a>
                        <?= getClickZanBlock('BC', $comment['id'], $comment['zan']) ?>
                    </div>
                </div>
            </div>
            <div class="ui attached segment _content_1dxav_187">
                <div class="_markdownContent_8wubn_1 content-font">
                    <?= $comment['content'] ?>
                </div>
            </div>
<!--            <div class="comtbox1"></div>-->
            <?php if ($replies): ?>
            <div id="replies-<?= $comment['id'] ?>" class="_items_1dxav_49"></div>
            <?php endif ?>
            <script type="text/javascript">showCommentReplies('<?= $comment['id'] ?>', <?= $replies_json ?>);</script>
        </div>
	</div>
	<?php endforeach ?>
<?php endif ?>
</div>
<?= $comments_pag->pagination() ?>

<h3 class="mt-4">发表评论</h3>
<p>可以用@mike来提到mike这个用户，mike会被高亮显示。如果你真的想打“@”这个字符，请用“@@”。</p>
<?php $comment_form->printHTML() ?>

<div id="div-form-reply" style="display:none">
    <?php $reply_form->printHTML() ?>
</div>

<div id="div-form-delete" style="display:none">
    <?php $delete_form->printHTML() ?>
</div>

<?php echoUOJPageFooter() ?>
