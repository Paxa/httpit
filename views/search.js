Xhr = function (url, data, callback) {
  var xhr = new XMLHttpRequest();
  
  xhr.open("GET", url + '?' + data, true);

  xhr.onreadystatechange = function() {
    if (xhr.readyState == 4 && xhr.status == 200) {
      callback(xhr.responseText);
    }
  };
  
  xhr.send();
};

// get forms data for xhr request
Xhr.formData = function (form) {
  var results = [];
  var elements = form.querySelectorAll('input, select, textarea');
  
  for(k in elements)
    if (elements.hasOwnProperty(k) && elements[k].name)
      results.push(elements[k].name + '=' + encodeURIComponent(elements[k].value))
  
  return results.join('&')
};

function $ (selector) {
  return document.querySelector(selector);
};

function $$ (selector) {
  return document.querySelectorAll(selector);
};

$('#files_search').addEventListener('submit', function (e) {
  var form = e.target;
  e.preventDefault();
  
  form.querySelector('.results').innerHTML = 'Finding...';
  form.className = 'loading';
  
  new Xhr(form.action, Xhr.formData(form), function(data) {
    form.querySelector('.results').innerHTML = data;
  });
}, true);

// hide results when erase search field
function hideResults (e) {
  if (e.target.value == '') $('#files_search').className = '';
}
$('input[type=search]').addEventListener('change', hideResults, false);
$('input[type=search]').addEventListener('keyup', hideResults, false);
$('input[type=search]').addEventListener('click', hideResults, false);