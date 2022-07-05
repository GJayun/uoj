<?php
	$blogs = DB::selectAll("select blogs.id, title, poster, post_time from important_blogs, blogs where is_hidden = 0 and important_blogs.blog_id = blogs.id order by level desc, important_blogs.blog_id desc limit 5");
?>
<?php echoUOJPageHeader(UOJConfig::$data['profile']['oj-name-short'], array("jayun_type" => "home")) ?>
<div class="ui three column padded grid">
        <div class="four wide column">
            <div class="ui card">
                <div class="image">
                    <img src="/images/logo.png" alt="Logo" />
                </div>
            </div>
        </div>
        <div class="twelve wide column">
            <div class="ui segment" style="height: 100%;">
                <?php
                    $username = UOJConfig::$data['profile']['administrator'];
                    $user = queryUser($username);
                ?>
                <div class="ui three column grid">
                    <div class="eleven wide column">
                        <p>
                            <span style="font-size: 28px;">
                                <span class="uoj-username" data-rating="<?= $user['rating'] ?>" data-link="0"><?= $username ?></span>
                            </span>
                        </p>
                        <p>
                            <i class="chart line icon"></i><?= UOJLocale::get('rating') ?>:
                            <span class="uoj-honor" data-rating="<?= $user['rating'] ?>"><?= $user['rating'] ?></span>
                        </p>
                        <p>
                            <i class="user icon"></i><?= UOJLocale::get('user profile') ?>:
                            <a href="<?= HTML::url('/user/profile/' . $username) ?>">详细信息</a>
                        </p>
                        <p>
                            <i class="check icon"></i><?= UOJLocale::get('accepted problems') ?>:
                            <?= count(array_filter($blogs, function ($value) {
                                return ($value['jayun_type'] == 'P');
                            })) ?>
                        </p>
                        <p>
                            <i class="edit icon"></i><?= UOJLocale::get('motto') ?>:
                            <?= HTML::escape($user['motto']) ?>
                        </p>
                        <p>
                            <i class="calendar outline icon"></i><?= UOJLocale::get('recent task') ?>:
                            <a href="<?= HTML::url('/todo') ?>"><?= HTML::escape($user['motto']) ?></a>
                        </p>
                    </div>
                    <div class="five wide column">

                    </div>
                </div>
            </div>
        </div>
</div>


<div class="card card-default">
	<div class="card-body">
		<div class="row">
			<div class="col-sm-12 col-md-9">
				<table class="table table-sm">
					<thead>
						<tr>
							<th style="width:60%"><?= UOJLocale::get('announcements') ?></th>
							<th style="width:20%"></th>
							<th style="width:20%"></th>
						</tr>
					</thead>
				  	<tbody>
					<?php $now_cnt = 0; ?>
					<?php foreach ($blogs as $blog): ?>
						<?php
							$now_cnt++;
							$new_tag = '';
							if ((time() - strtotime($blog['post_time'])) / 3600 / 24 <= 7) {
								$new_tag = '<sup style="color:red">&nbsp;new</sup>';
							}
						?>
						<tr>
							<td><a href="/blogs/<?= $blog['id'] ?>"><?= $blog['title'] ?></a><?= $new_tag ?></td>
							<td>by <?= getUserLink($blog['poster']) ?></td>
							<td><small><?= $blog['post_time'] ?></small></td>
						</tr>
					<?php endforeach ?>
					<?php for ($i = $now_cnt + 1; $i <= 5; $i++): ?>
						<tr><td colspan="233">&nbsp;</td></tr>
					<?php endfor ?>
						<tr><td class="text-right" colspan="233"><a href="/announcements"><?= UOJLocale::get('all the announcements') ?></a></td></tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<?php echoUOJPageFooter() ?>
