function blog_editor_init(name, editor_config) {
	if (editor_config === undefined) {
		editor_config = {};
	}
	
	editor_config = $.extend({
		type: 'blog'
	}, editor_config);
	
	var input_title = $("#input-" + name + "_title");
	var input_tags = $("#input-" + name + "_tags");
	var input_content_md = $("#input-" + name + "_content_md");
	var input_is_hidden = $(".ui.checkbox");
	var search_tags = $("#search-" + name + "_tags");
	var select_tags = $("#select-" + name + "_tags");
	var this_form = input_content_md[0].form;

	var is_saved;
	var last_save_done = true;

	// init buttons
	// var save_btn = $('<button type="button" class="btn btn-sm"></button>');
	// var preview_btn = $('<button type="button" class="btn btn-secondary btn-sm"><span class="glyphicon glyphicon-eye-open"></span></button>');
	//
	// save_btn.tooltip({ container: 'body', title: '保存 (Ctrl-S)' });
	// preview_btn.tooltip({ container: 'body', title: '预览 (Ctrl-D)' 	});

	// var all_btn = [save_btn, preview_btn];

	// init toolbar
	// var toolbar = $('<div class="btn-toolbar"></div>');
	// toolbar.append($('<div class="btn-group"></div>')
	// 	.append(save_btn)
	// 	.append(preview_btn)
	// );
	function set_saved(val) {
		is_saved = val;
		if (val) {
			// save_btn.removeClass('btn-warning');
			// save_btn.addClass('btn-success');
			// save_btn.html('<span class="glyphicon glyphicon-saved"></span>');
			before_window_unload_message = null;
		} else {
			// save_btn.removeClass('btn-success');
			// save_btn.addClass('btn-warning');
			// save_btn.html('<span class="glyphicon glyphicon-save"></span>');
			before_window_unload_message = '您所编辑的内容尚未保存';
		}
	}
	// function set_preview_status(status) {
	// 	// 0: normal
	// 	// 1: loading
	// 	// 2: loaded
	// 	if (status == 0) {
	// 		preview_btn.removeClass('active');
	// 		for (var i = 0; i < all_btn.length; i++) {
	// 			if (all_btn[i] != preview_btn) {
	// 				all_btn[i].prop('disabled', false);
	// 			}
	// 		}
	// 	} else if (status == 1) {
	// 		for (var i = 0; i < all_btn.length; i++) {
	// 			if (all_btn[i] != preview_btn) {
	// 				all_btn[i].prop('disabled', true);
	// 			}
	// 		}
	// 		preview_btn.addClass('active');
	// 	}
	// }

	set_saved(true);
	
	// init codemirror
	// if (editor_config.type == 'slide') {
	// 	input_content_md.wrap('<div class="blog-content-md-editor"></div>');
		var blog_contend_md_editor = input_content_md.parent();
	// 	input_content_md.before($('<div class="blog-content-md-editor-toolbar"></div>')
	// 		.append(toolbar)
	// 	);
	// 	input_content_md.wrap('<div class="blog-content-md-editor-in"></div>');
	// }
	
	// var codeeditor;
	// if (editor_config.type == 'blog') {
	// 	codeeditor = CodeMirror.fromTextArea(input_content_md[0], {
	// 		mode: 'gfm',
	// 		lineNumbers: true,
	// 		matchBrackets: true,
	// 		lineWrapping: true,
	// 		styleActiveLine: true,
	// 		theme: 'default'
	// 	});
	// } else if (editor_config.type == 'slide') {
	// 	codeeditor = CodeMirror.fromTextArea(input_content_md[0], {
	// 		mode: 'plain',
	// 		lineNumbers: true,
	// 		matchBrackets: true,
	// 		lineWrapping: true,
	// 		styleActiveLine: true,
	// 		theme: 'default'
	// 	});
	// }

	// var blog_contend_md_editor = $(".markdown-body.editormd-preview-container.editormd-preview-active");
	function preview(html) {
		var iframe = $('<iframe frameborder="0"></iframe>');
		blog_contend_md_editor.append(
			$('<div class="blog-content-md-editor-preview" style="display: none;"></div>')
				.append(iframe)
		);
		// blog_contend_md_editor.append(iframe);
		var iframe_document = iframe[0].contentWindow.document;
		iframe_document.open();
		iframe_document.write(html);
		iframe_document.close();
		//
		// blog_contend_md_editor.find('.blog-content-md-editor-in').slideUp('fast');
		blog_contend_md_editor.find('.CodeMirror-wrap').slideUp('fast');
		blog_contend_md_editor.find('.blog-content-md-editor-preview').slideDown('fast', function() {
			// set_preview_status(2);
			iframe.focus();
			iframe.find('body').focus();
		});
	}
	function save(config) {
		if (config == undefined) {
			config = {};
		}
		config = $.extend({
			need_preview: false,
			fail: function() {
			},
			done: function() {
			}
		}, config);
		
		if (!last_save_done) {
			config.fail();
			config.done();
			return;
		}
		last_save_done = false;
		
		// if (config.need_preview) {
		// 	set_preview_status(1);
		// }
		
		var post_data = {};
		post_data[name + "_tags"] = selected_tags.toString();
		$($(this_form).serializeArray()).each(function() {
			post_data[this["name"]] = this["value"];
		});
		if (config.need_preview) {
			post_data['need_preview'] = 'on';
		}
		post_data["save-" + name] = '';

		if (editor_config.type === 'blog') {
			console.log("12")
			post_data[name + "_content_md"] = blogeditor.editor.getCode();
		}

		$.ajax({
			type : 'POST',
			data : post_data,
			url : window.location.href,
			success : function(data) {
				try {
					data = JSON.parse(data)
				} catch (e) {
					// alert(data);
					// if (config.need_preview) {
					// 	set_preview_status(0);
					// }
					config.fail();
					return;
				}
				var ok = true;
				$(['title', 'content_md', 'tags']).each(function() {
					ok &= showErrorHelp(name + '_' + this, data[this]);
				});
				if (data.extra !== undefined) {
					ok = false;
				}
				if (!ok) {
					if (config.need_preview) {
						preview(data);
					}
					config.fail();
					return;
				}

				if (config.btnClick) {
					Swal.fire({
						type: 'success',
						title: '已保存',
						showConfirmButton: false,
						timer: 1500
					})
				}

				set_saved(true);
				
				if (config.need_preview) {
					preview(data.html);
				}
				
				if (data.blog_write_url) {
					window.history.replaceState({}, document.title, data.blog_write_url);
				}
				if (data.blog_url) {
					$('#a-' + name + '_view_blog').attr('href', data.blog_url).show();
				}
			}
		}).fail(function() {
			if (config.need_preview) {
				set_preview_status(0);
			}
			config.fail();
		}).always(function() {
			last_save_done = true;
			config.done();
		});
	}
	// function add_around(sl, sr) {
	// 	codeeditor.replaceSelection(sl + codeeditor.getSelection() + sr);
	// }

	// event
	// codeeditor.on('change', function() {
	// 	codeeditor.save();
	// 	set_saved(false);
	// });

	search_tags.search({
		apiSettings: {
			url: '/tags/get?search={query}'
		},
		fields: {
			results : 'tags',
			title   : 'name'
		},
		onSelect: function (result, response) {
			if (selected_tags.indexOf(result['id']) === -1){
				$(`<a class="ui label ${result['color']} jayun_tag" data-id="${result['id']}">${result['name']}<i class="delete icon"></i></a>`).appendTo(select_tags);
				selected_tags.push(result['id']);
			}
			$(".results.transition").css("display", "").removeClass("visible").removeClass("transition");
			search_tags.find(".ui.icon.input > input").val("");
			return false;
		},
		verbose: true
	})

	select_tags.bind('DOMNodeInserted', function(){
		set_saved(false);
	});

	select_tags.on("click", ".jayun_tag > i", function () {
		let tag = $(this).parent();
		selected_tags.splice(selected_tags.indexOf(tag.attr('data-id')), 1);
		tag.remove();
	});

	input_title.on('input', function() {
		set_saved(false);
	});
	// save_btn.click(function() {
	// 	save();
	// });
	$('#' + name + '_save_blog').click(function () {
		save({btnClick: true});
	});
	// preview_btn.click(function() {
	// 	if (preview_btn.hasClass('active')) {
	// 		set_preview_status(0);
	// 		blog_contend_md_editor.find('.blog-content-md-editor-in').slideDown('fast');
	// 		blog_contend_md_editor.find('.blog-content-md-editor-preview').slideUp('fast', function() {
	// 			$(this).remove();
	// 		});
	// 		codeeditor.focus();
	// 	} else {
	// 		save({need_preview: true});
	// 	}
	// });
	input_is_hidden.checkbox({
		onChecked: function () {
			input_is_hidden.addClass('read-only');
			var succ = true;
			save({
				fail: function() {
					succ = false;
				},
				done: function() {
					input_is_hidden.removeClass('read-only');
					if (!succ) {
						input_is_hidden.checkbox('toggle');
					}
				}
			});
		},
		onUnchecked: function() {
			Swal.fire({
				title: '你确定要公开吗？',
				type: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '确定',
				cancelButtonText: '取消',
				allowOutsideClick: false
			}).then((result) => {
				if (!result.value) {
					input_is_hidden.checkbox('toggle');
				} else {
					input_is_hidden.addClass('read-only');
					var succ = true;
					save({
						fail: function() {
							succ = false;
						},
						done: function() {
							input_is_hidden.removeClass('read-only');
							if (!succ) {
								input_is_hidden.checkbox('toggle');
							}
						}
					});
				}
			})
		}
	})

	// init hot keys
	// codeeditor.setOption("extraKeys", {
	// 	"Ctrl-S": function(cm) {
	// 		save();
	// 	},
	// 	// "Ctrl-D": function(cm) {
	// 	// 	preview_btn.click();
	// 	// }
	// });
	// $(document).bind('keydown', 'ctrl+d', function() {
	// 	preview_btn.click();
	// 	return false;
	// });
	if (editor_config.type == 'blog') {
		// var blogeditor = editormd("text-" + name + "_content_md", {
		// 	width  : "100%",
		// 	height : "600px",
		// 	syncScrolling : "single",
		// 	htmlDecode : "style,script,iframe|on*",
		// 	tex : true,
		// 	toc: false,
		// 	toolbarIcons: "simple",
		// 	path   : "/cdn/editor.md/lib/",
		// 	onload : function() {
		// 		var keyMap = {
		// 			"Ctrl-S": function(cm) {
		// 				save();
		// 			}
		// 		};
		// 		this.addKeyMap(keyMap);
		// 	},
		// 	onchange : function() {
		// 		set_saved(false);
		// 	},
		// 	CodeMirror: blog_contend_md_editor
		// });
		var articleContent = $("#text-" + name + "_content_md > textarea").val();
		blogeditor = new MarkdownPalettes("#text-" + name + "_content_md > textarea");
		blogeditor.editor.setCode(articleContent);
		$("#text-" + name + "_content_md").bind('keydown', function(e) {
			if (e.keyCode === 83 && (e.ctrlKey || e.metaKey)) {
				save({btnClick: true});
				return false;
			} else {
				if (!(e.keyCode >= 112 && e.keyCode <= 123 || e.keyCode >= 16 && e.keyCode <= 20)) {
					set_saved(false);
				}
			}
		});
	}
	if (editor_config.type == 'slide') {
		blogeditor = editormd("text-" + name + "_content_md", {
			width  : "100%",
			height : "600px",
			toolbarIcons : function() {
				// Or return editormd.toolbarModes[name]; // full, simple, mini
				// Using "||" set icons align right.
				return ["undo", "redo", "|", "bold", "del", "italic", "quote", "|", "h1", "h2", "h3", "h4", "h5", "h6", "|", "list-ul", "list-ol", "hr", "|", "Jayunpreview"]
			},
			toolbarIconsClass : {
				Jayunpreview : "fa-desktop"
			},
			toolbarHandlers : {
				/**
				 * @param {Object}      cm         CodeMirror对象
				 * @param {Object}      icon       图标按钮jQuery元素对象
				 * @param {Object}      cursor     CodeMirror的光标对象，可获取光标所在行和位置
				 * @param {String}      selection  编辑器选中的文本
				 */
				Jayunpreview : function(cm, icon, cursor, selection) {
					// $.proxy(this.toolbarHandlers.preview, this)();
					if ($(".blog-content-md-editor-preview")[0] == undefined) {
						save({need_preview: true});
					} else {
						blog_contend_md_editor.find('.CodeMirror-wrap').slideDown('fast');
						blog_contend_md_editor.find('.blog-content-md-editor-preview').slideUp('fast', function() {
							$(this).remove();
						});
					}
				}
			},

			lang : {
				name: "zh-cn",
				tocTitle: "目录",
				toolbar: {
					Jayunpreview: "预览幻灯片"
				}
			},
			htmlDecode : "style,script,iframe|on*",
			watch : false,
			tex : true,
			toc: false,
			path   : "/cdn/editor.md/lib/",
			onload : function() {
				var keyMap = {
					"Ctrl-S": function(cm) {
						save();
					}
				};
				this.addKeyMap(keyMap);
			},
			onchange : function() {
				set_saved(false);
			}
		});
	}
	input_title.bind('keydown', 'ctrl+s', function() {
		save();
		return false;
	});

	
	if (this_form) {
		$(this_form).submit(function() {
			before_window_unload_message = null;
		});
	}
}
