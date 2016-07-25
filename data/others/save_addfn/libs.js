(function($) {
  $.setStorageWeb = function(key, val) {
    val = JSON.stringify(val);
		//localStorage.setItem(key, escape(val));
    try{
      localStorage.setItem(key, escape(val));
		}catch(domException) {
			if (domException.name === 'QuotaExceededError' || domException.name === 'NS_ERROR_DOM_QUOTA_REACHED') {
				alertify.alert( "セーブに失敗しました。", function () {});
			}
		}
  };

  $.setStorageCompress = function(key, val) {
    val = JSON.stringify(val);
    //localStorage.setItem(key, LZString.compress(escape(val)));
    try{
			localStorage.setItem(key, LZString.compress(escape(val)));
		}catch(domException) {
			if (domException.name === 'QuotaExceededError' || domException.name === 'NS_ERROR_DOM_QUOTA_REACHED') {
				alertify.alert( "セーブに失敗しました。", function () {});
			}
		}
  };

})(jQuery);
