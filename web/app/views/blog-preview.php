<?php
	if ($is_preview) {
		$readmore_pos = strpos($blog['content'], '<!-- readmore -->');
		if ($readmore_pos !== false) {
			$content = substr($blog['content'], 0, $readmore_pos).'<p><a href="'.HTML::blog_url(UOJContext::userid(), '/post/'.$blog['id']).'">阅读更多……</a></p>';
		} else {
			$content = $blog['content'];
		}
	} else {
		$content = $blog['content'];
	}

	$extra_text = $blog['is_hidden'] ? '<span class="text-muted">[已隐藏]</span> ' : '';

	$blog_type = $blog['type'] == 'B' ? 'post' : 'slide';
?>
<?php if($readmore_pos !== false && $blog_type == 'post'): ?>
<div class="ui vertical menu fixed borderless blog_toc" style="right: 0; display: none;">
    <strong class="header item">目录</strong>
</div>
<script>
    function ModifyTOCPostion() {
        var container = $(".ui.container[role=main]").get(0);
        var conPosition = getElementViewPosition(container);

        var TOC = $(".blog_toc");
        var TOCx = container.offsetWidth + conPosition.x + 10;
        if (document.body.offsetWidth - (TOCx + 320) < -50) {
            TOC.css("display", "none");
        } else {
            TOC.css("display", "block");
            TOC.css("right", document.body.offsetWidth - (TOCx + 320));
        }
    }
    function TOCscrollTo(text) {
        var element = $();
        $(`#article :contains(${text})`).each(function() {
            if (this.tagName.search(/H[0-9]/i) !== -1) {
                element.push(this)
            }
        });
        var top = 0;
        if (element.length === 1) {
            top = getElementPagePosition(element.get(0)).y - 48;
            document.location.hash = text;
        }
        window.scrollTo({
            top: top,
            behavior: "smooth"
        });
    }
    ModifyTOCPostion();
    window.onresize=function(){
        ModifyTOCPostion()
    }
</script>
<?php endif ?>
<div <?php if($readmore_pos !== false) echo 'class="blog_header"'; ?>>
    <span class="blog_title"><?= $extra_text ?><a class="header-a" href="<?= HTML::blog_url(UOJContext::userid(), '/post/'.$blog['id']) ?>"><?= $blog['title'] ?></a></span>
    <div>
        <?php foreach (queryBlogTags($blog['id']) as $tag): ?>
            <?php echoBlogTag($tag) ?>
        <?php endforeach ?>
    </div>
    <div><?= $blog['post_time'] ?> <strong>By</strong> <?= getUserLink($blog['poster']) ?></div>
</div>
<?php if (!$show_title_only): ?>
<div class="ui segment" <?php if($readmore_pos !== false) echo 'id="article"'; ?>>
    <?php if ($blog_type == 'post'): ?>
    <?= $content ?>
    <?php elseif ($blog_type == 'slide'): ?>
        <div class="embed-responsive embed-responsive-16by9">
            <iframe class="embed-responsive-item" src="<?= HTML::blog_url(UOJContext::userid(), '/slide/'.$blog['id']) ?>"></iframe>
        </div>
        <div class="text-right top-buffer-sm">
            <a class="btn btn-secondary btn-md" href="<?= HTML::blog_url(UOJContext::userid(), '/slide/'.$blog['id']) ?>"><span class="glyphicon glyphicon-fullscreen"></span> 全屏</a>
        </div>
    <?php endif ?>
    <div class="ui horizontal divider">
        EOF
    </div>
    <div class="ui grid">
        <div class="row">
            <div class="right aligned sixteen wide column">
                <?php if ($is_preview): ?>
                    <a href="<?= HTML::blog_url(UOJContext::userid(), '/post/'.$blog['id']) ?>" style="margin: 0 5px;">阅读全文</a>
                <?php endif ?>
                <?php if (Auth::check() && (isSuperUser(Auth::user()) || Auth::id() == $blog['poster'])): ?>
                    <a href="<?=HTML::blog_url(UOJContext::userid(), '/'.$blog_type.'/'.$blog['id'].'/write')?>" style="margin: 0 5px;">修改</a>
                    <a href="<?=HTML::blog_url(UOJContext::userid(), '/post/'.$blog['id'].'/delete')?>" style="margin: 0 5px;">删除</a>
                <?php endif ?>
                <?= getClickZanBlock('B', $blog['id'], $blog['zan']) ?>
            </div>
        </div>
    </div>
</div>
<?php if($readmore_pos !== false && $blog_type == 'post'): ?>
    <script>
        TOCscrollTo(decodeURI(document.location.hash.slice(1)));
        function GetTOC() {
            $("#article").children().each(function () {
                if (this.tagName.search(/H[0-9]/i) !== -1) {
                    $(".blog_toc").append(`<a class="item" href="javascript:TOCscrollTo('${this.innerHTML}')"><div class="toc_${this.tagName.toLowerCase()}">${this.innerHTML}</div></a>`);
                }
            });
        }
        GetTOC();
    </script>
<?php endif; ?>
<?php endif ?>
