;【セーブ機能追加プラグイン】
; by hororo http://hororo.wp.xdomain.jp/
;
; ＜機能＞
;　　セーブ回りの機能を追加するプラグインです。
;　　
;　　・セーブ用キャプチャ画像をjpeg圧縮する。圧縮率も指定できます。
;　　・セーブ画面に「保護」「削除」ボタンが付きます。
;　　・セーブ画面のページ分けができます。
;　　・サンプルCSSを何種類か用意しました。
;
; ＜注意点＞
;　　スクリプトのエンジン本体を改造していますので、Ver変更には対応できない可能性があります。
;　　ブラウザによっては反映されない可能性があります。
;
;　　ティラノスクリプトVer421 で動作確認。
;
; ＜使い方＞
;  　最初にsave_addfn.ksファイルを読み込んでください。
;  　[call storage="save_save_addfn/save_save_addfn.ks"]
;
;　　save.html、load.html ファイルは、デフォルトの tyrano/html/ 内ではなく、
;　　data/other/save_addfn/ のものを使用してください。
;
;　　保護チェック用画像は同じ名前で差し替える事で変更可能です。
;
;　　他のsave用プラグインとの併用はできません。ごめんなさい（＞＜）
;
[iscript]
var save_conf = {



//■ 設定 ■
// ◆ サムネイル画像のフォーマット。"jpeg" or "webp" ※webpはGoogleChrome、Windows版のみ対応です。
"format" : "jpeg"
,
// ◆ サムネイル画像の圧縮率(0.0～1.0) 小さいほど画像が軽く粗くなります。
"quality" : 0.7
,
// ◆ セーブ失敗時にアラートを出す場合は true 出さない場合は false
//　　※ローカルストレージの容量オーバー時のみです）
"ngalert" : true
,
// ◆ セーブ成功時にアラートを出す場合は true 出さない場合は false
"okalert" : false
,
// ◆ セーブを数件毎にページ分けする場合は true 分けない場合は false
//　　※セーブ件数変更は、製作wiki等を参照してください。
"pagefeed" : false
,
// ◆ 1ページ当たりの表示件数。半角数値。"auto"で自動ページ送り。
//　　※"auto"は、CSSの指定によっては期待通りの動作になりません。
"pagenum" : 5
,
// ◆ スタイル。背景、色合いはデフォルトです。変更の参考にでも。
//　　・"none" … 使わない。
//　　・"default" … 標準の縦並び。
//　　・"3x2" … 横3×縦2 サムネ大きめ
//　　・"2x5" … 横2×縦5
//　　・"5x2" … 横5×縦2
"style" : "default"



};
if(save_conf.style == "default") save_conf.style = "";
var style = '<link rel="stylesheet" href="./data/others/save_addfn/save_config' + save_conf.style + '.css">';
if(save_conf.style != "none")$('head link:last').after(style);
if(save_conf.ngalert)$('head script:last').after('<script type="text/javascript" src="./data/others/save_addfn/libs.js"></script>');
sf.save_conf = save_conf;
[endscript]

[loadjs storage="save_addfn/save_addfn.js"]
[loadjs storage="save_addfn/thumb_saving.js"]
[preload storage="data/image/save_addfn/save_protect_on.png"]
[preload storage="data/image/save_addfn/save_protect_off.png"]
[preload storage="data/image/save_addfn/save_delete.png"]
[return]
