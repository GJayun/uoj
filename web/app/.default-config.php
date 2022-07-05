<?php
return [
	'profile' => [
		'oj-name' => 'Jayun\'s Blog',
		'oj-name-short' => 'JBlog',
		'administrator' => 'Jayun',
		'admin-email' => 'admin@JBlog.ac',
		'QQ-group' => '',
		'ICP-license' => ''
	],
	'database' => [
		'database' => 'jayun',
		'username' => 'root',
		'password' => 'jxv00afjlxjvaioa2f31271',
		'host' => '127.0.0.1'
	],
	'web' => [
		'domain' => null,
		'main' => [
			'protocol' => 'http',
			'host' => '127.0.0.1',
			'port' => 80
		],
		'blog' => [
			'protocol' => 'http',
			'host' => '127.0.0.1',
			'port' => 80
		]
	],
	'security' => [
		'user' => [
			'client_salt' => 'jayunakioi!!!'
		],
		'cookie' => [
			'checksum_salt' => ['WEqydRQ8SFIEgIfc', 'swiiiBKza9R6PFrY', 'gWJ3hsGpdeutrceK']
		],
	],
	'mail' => [
		'noreply' => [
			'username' => 'noreply@local_uoj.ac',
			'password' => '_mail_noreply_password_',
			'host' => 'smtp.local_uoj.ac',
			'secure' => 'tls',
			'port' => 587
		]
	],
	'judger' => [
		'socket' => [
			'port' => '233',
			'password' => 'juderpasswd&_Jayun'
		]
	],
	'switch' => [
		'web-analytics' => false,
		'blog-domain-mode' => 3
	]
];
