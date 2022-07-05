<form method="post" class="form-horizontal" id="form-<?= $editor->name ?>" enctype="multipart/form-data">
<?= HTML::hiddenToken() ?>
<div class="ui grid">
    <div class="row">
        <div class="eight wide column">
            <?= HTML::div_vinput("{$editor->name}_title", 'text', $editor->label_text['title'], html_entity_decode($editor->cur_data['title']), "width: 100%") ?>
        </div>
        <div class="eight wide column">
            <label for="input-<?=$editor->name?>_tags" class="control-label"><?=$editor->label_text['tags']?></label>
            <div class="ui search" id="search-<?=$editor->name?>_tags">
                <div class="ui icon input" style="width: 100%;">
                    <input class="prompt" type="text" placeholder="在此搜索标签">
                    <i class="search icon"></i>
                </div>
                <div class="results"></div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="sixteen wide column">
            <div id="Blog_tagsList" class="ui segment">
                <strong>已选标签</strong>
                <p id="select-<?=$editor->name?>_tags">
                    <?php
                    foreach($editor->cur_data['tags'] as $id) {
                        $tag = queryTag($id);
                        echo '<a class="ui label ' . $tag['color'] . ' jayun_tag" data-id="'. $tag['id'] .'">'. $tag[UOJLocale::mylocale()] .'<i class="delete icon"></i></a>';
                    }
                    ?>
                </p>
            </div>
        </div>
    </div>
    <div class="sixteen wide column">
        <?= HTML::div_vtextarea("{$editor->name}_content_md", $editor->label_text['content'], $editor->cur_data['content_md'], "height: 600px") ?>
    </div>
    <div class="row">
        <div class="eight wide column">
            <?php if ($editor->blog_url): ?>
                <a id="a-<?= $editor->name ?>_view_blog" class="ui primary button" href="<?= HTML::escape($editor->blog_url) ?>"><?= $editor->label_text['view blog'] ?></a>
            <?php else: ?>
                <a id="a-<?= $editor->name ?>_view_blog" class="ui primary button" style="display: none;"><?= $editor->label_text['view blog'] ?></a>
            <?php endif ?>
        </div>
        <div class="right aligned eight wide column">
            <div id="<?= $editor->name ?>_save_blog" class="ui button"><?= $editor->label_text['save blog'] ?></div>
            <div class="ui toggle checkbox">
                <?= HTML::checkbox("{$editor->name}_is_hidden", $editor->cur_data['is_hidden']) ?>
                <label>隐藏</label>
            </div>
        </div>
    </div>
</div>
</form>
<script type="text/javascript">
var selected_tags = <?= json_encode($editor->cur_data['tags'])?>, blogeditor;
blog_editor_init("<?= $editor->name ?>", <?= json_encode(array('type' => $editor->type)) ?>);
</script>
