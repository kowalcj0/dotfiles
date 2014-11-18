// how to use
// phantomjs phantomjs_capture_html.js http://www.URL.to.render > test.html
var args = require('system').args;
var page = require('webpage').create();
var url = args[1];
page.open(url, function (status) {
    var js = page.evaluate(function () {
    return document;
});
console.log(js.all[0].outerHTML);
phantom.exit();
});
