tyrano.plugin.kag.menu.snapSave = function(title, call_back,flag_thumb) {
	
	var that = this;
	
	//◆設定呼び出し
	var thumb_saving = this.kag.variable.sf.save_conf;

	//画面のキャプチャも取るよ
	var _current_order_index = that.kag.ftag.current_order_index - 1;
	var _stat = $.extend(true, {}, $.cloneObject(that.kag.stat));
        
	if(typeof flag_thumb =="undefined"){
		flag_thumb = this.kag.config.configThumbnail;
	}
	
	if (flag_thumb == "false") {
		
		//サムネデータを保存しない
		var img_code = "";
		var data = {};
		
		data.title = title;
		data.stat = _stat;
		data.current_order_index = _current_order_index;
		//１つ前
		data.save_date = $.getNowDate() + "　" + $.getNowTime();
		data.img_data = img_code;
		
		//レイヤ部分のHTMLを取得
		var layer_obj = that.kag.layer.getLayeyHtml();
		data.layer = layer_obj;
		
		that.snap = $.extend(true, {}, $.cloneObject(data));
		
		if (call_back) {
			call_back();
		}
	} else {
		
		setTimeout(function() {
			html2canvas($("#tyrano_base").get(0), {
				onrendered : function(canvas) {
					
					//◆変更 キャプチャ画像をjpeg＋圧縮。
					img_code = canvas.toDataURL("image/"+thumb_saving.format,thumb_saving.quality);
					
					var data = {};
					data.title = title;
					data.stat = _stat;
					data.current_order_index = _current_order_index;
					//１つ前
					data.save_date = $.getNowDate() + "　" + $.getNowTime();
					data.img_data = img_code;
					
					//レイヤ部分のHTMLを取得
					var layer_obj = that.kag.layer.getLayeyHtml();
					data.layer = layer_obj;
					that.snap = $.extend(true, {}, $.cloneObject(data));
					
					if (call_back) {
						call_back();
					}
				}
			});
		}, 20);
	}
};
