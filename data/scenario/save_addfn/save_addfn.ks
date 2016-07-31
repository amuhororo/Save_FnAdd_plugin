;【セーブ機能追加プラグイン Ver.1.03】2016/7/31
; by hororo http://hororo.wp.xdomain.jp/
;
; ＜機能＞
;　　セーブ関係の機能を追加するプラグインです。
;　　
;　　・セーブ用キャプチャ画像をjpeg圧縮する。圧縮率も指定できます。
;　　・セーブ画面に「保護」「削除」ボタンが付きます。※消すことはできません。
;　　・セーブ失敗・成功時にアラートを出すか選択できます。
;　　・指定件数ごとにページ分けができます。
;　　・サンプルCSSを何種類か用意しましたので切り替え可能です。
;　　　　※使わないCSSファイルはリリース前に削除してください。
;
; ＜注意点＞
;　　ティラノスクリプトVer421 で動作確認。
;
;　　スクリプトのエンジン本体を改造していますので、Ver変更には対応できない可能性があります。
;　　ブラウザによっては反映されない可能性があります。
;
;　　他のsave用プラグインとの併用はできません。
;
; ＜使い方＞
;  　最初にsave_addfn.ksファイルを読み込んでください。
;  　[call storage="save_addfn/save_addfn.ks"]
;
;　　save.html、load.html ファイルは、デフォルトの tyrano/html/ 内にあるファイルではなく、
;　　data/other/save_addfn/ 内のものを使用してください。
;
;　　保護チェック・削除用画像は同じ名前で差し替える事で変更可能です。
;
;
[iscript]
var save_conf = {



//■ 設定 ■
// ◆ サムネイル画像のフォーマット。"jpeg" or "webp" 使わない場合は"none"。 
//　　※webpはGoogleChrome、Windows版のみ対応です。
"format" : "jpeg"
,
// ◆ サムネイル画像の圧縮率(0.0～1.0) 小さいほど画像が軽く粗くなります。
"quality" : 0.7
,
// ◆ セーブ失敗時にアラートを出す場合は true 出さない場合は false
//　　※ローカルストレージの容量オーバー時のみ。
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
var style = '<link rel="stylesheet" href="./data/others/save_addfn/save_style' + save_conf.style + '.css">';
if(save_conf.style != "none")$('head link:last').after(style);
sf.save_conf = save_conf;
[endscript]

[loadjs storage="save_addfn/save_addfn.js"]
[if exp="sf.save_conf['ngalert']==true"][loadjs storage="save_addfn/libs.js"][endif]
[if exp="sf.save_conf['format']!='none'"][loadjs storage="save_addfn/thumb_saving.js"][endif]

[preload storage="data/image/save_addfn/save_protect_on.png"]
[preload storage="data/image/save_addfn/save_protect_off.png"]
[preload storage="data/image/save_addfn/save_delete.png"]
[return]
