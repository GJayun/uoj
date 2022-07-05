<?php
header('Content-type: application/json');
$tags['tags'] = queryTags($_GET['search']);
foreach ($tags['tags'] as &$tag) {
    $newtag = array('id' => $tag['id'], 'color' => $tag['color'], 'name' => $tag[UOJLocale::mylocale()]);
    $tag = $newtag;
}
die(json_encode($tags));
