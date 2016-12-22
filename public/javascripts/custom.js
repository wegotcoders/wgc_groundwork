  console.log("I am Javascript!");

  var profile_values = document.getElementsByClassName('profile-value');
  var total_words = profile_values.length;
  for (var i = 0; i < profile_values.length; i++) {
    total_words += profile_values[i].textContent.split(" ").length;
  }
  document.getElementById('word-count').innerHTML = total_words;
  
  
  var log = document.getElementById('log'),
    i = '', 
    out = [];
    // for every eventlistener in window
	for (i in window) {
	  if ( /^on/.test(i)) { out[out.length] = i; }
	}
	log.innerHTML = out.join(', '); // display in element and separate each by comma  
	
	var log = document.getElementById('log'),
    out = '';
	//assigns event listeners to element and the whole page
	log.addEventListener('click', logeventinfo, false);
	//document.addEventListener('keypress', logeventinfo, false);

function logeventinfo (ev) {
  log.innerHTML = '';
  out = '<ul>';
  for (var i in ev) {
    if (typeof ev[i] === 'function' || i === i.toUpperCase()) {
      continue;
    }
    out += '<li><span>'+i+'</span>: '+ev[i]+'</li>';
  }
  log.innerHTML += out + '</ul>';
}

//Moves image to the click position
// var plot = document.getElementById('myimg')
    // offset = plot.offsetWidth / 2;
// document.addEventListener('click', function(ev) {
  // plot.style.left = (ev.pageX - offset) + 'px';
  // plot.style.top = (ev.pageY - offset) + 'px';
// }, false);

//  Increases/decreases profile image size when mouse is over it
var image = document.getElementById('myimg'),
    imageWidth = image.width,
    imageHeight = image.height;
    
image.onmouseenter = function() {
  image.width = 2 * imageWidth;
  image.height = 2 * imageHeight;
};
image.onmouseout = function() {
  image.width = imageWidth;
  image.height = imageHeight;
};