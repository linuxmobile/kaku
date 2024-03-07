// ==UserScript==
// @name          Dark Mode
// @namespace     DarkReader
// @description	  Inverts the brightness of pages to reduce eye strain
// @version       4.9.79
// @author        https://github.com/darkreader/darkreader#contributors
// @homepageURL   https://darkreader.org/ | https://github.com/darkreader/darkreader
// @run-at        document-end
// @grant         none
// @include       http*
// @require       https://cdn.jsdelivr.net/npm/darkreader/darkreader.min.js
// @noframes
// ==/UserScript==

DarkReader.enable({
	brightness: 100,
	contrast: 100,
	sepia: 0,
});
