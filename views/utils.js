function $ (selector) {
  return document.querySelector(selector);
};

function $$ (selector) {
  return document.querySelectorAll(selector);
};

$('.sorting').addEventListener('change', function(e) {
  var clean_path = (window.location + '').replace(/(\?|&)sort=[^=]*/, '');
  clean_path += (clean_path.indexOf('?') == -1 ? '?' : '&') + 'sort=' + e.target.value
  window.location = clean_path;
}, false);