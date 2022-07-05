		</div>
		<!-- /container -->
        <?php
        if (!isset($ShowPageFooter)) {
            $ShowPageFooter = true;
        }
        ?>
        </div>
        <?php if ($ShowPageFooter): ?>
            <div class="uoj-footer">
                <div class="ui vertical segment">
                    <div class="ui center aligned container">
                        <div class="ui mini">
                            <div class="inline fields" style="margin-bottom: 7px; white-space: nowrap; ">
                                <div class="ui icon labeled mini dropdown button" id="select_category" tabindex="0"><i class="globe icon"></i> <?= UOJLocale::get('_common_name') ?>
                                    <div class="menu transition hidden" tabindex="-1">
                                        <a class="item" href="<?= HTML::url(UOJContext::requestURI(), array('params' => array('locale' => 'zh-cn'))) ?>">
                                            <i class="cn flag"></i>
                                            中文
                                        </a>
                                        <a class="item" href="<?= HTML::url(UOJContext::requestURI(), array('params' => array('locale' => 'en'))) ?>">
                                            <i class="uk flag"></i>
                                            English
                                        </a>
                                    </div>
                                </div>
                                <script>
                                    $(function () {
                                        $('#select_category').dropdown();
                                    });
                                </script>
                            </div>
                        </div>
                        <div style="height: 1em;"><?= UOJConfig::$data['profile']['oj-name'] ?></div>
                        <?php if (UOJConfig::$data['profile']['ICP-license'] != '' && preg_match_all('/(\d+\.?\d+)/', UOJConfig::$data['profile']['ICP-license'], $ICP_number)): ?>
                            <div id="footerLicense"><a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=<?= $ICP_number[0][0] ?>" style="text-decoration:none;vertical-align: middle;display: inline-flex;align-items: center;"><img src="http://uoj.ac/pictures/beian.png" /> <?= UOJConfig::$data['profile']['ICP-license'] ?></a></div>
                        <?php endif ?>
                        <p>UOJ-System | <a href="https://github.com/UniversalOJ/UOJ-System" target="_blank"><?= UOJLocale::get('opensource project') ?></a></p>
                    </div>
                </div>
            </div>
        <?php endif ?>
	</body>
</html>
