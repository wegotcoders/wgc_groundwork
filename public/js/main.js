var CountWords = function(text)
  {
    text=text.replace(/\<br\>/g,'').replace(/\W+/g,' ').trim();
    if ( text === "" ) {
      return 0;
    } else {
      return text.split(' ').length;
    } 
  }

  function DiscardChanges () {
    
    var r = confirm("Discard changes?");
    if ( r === true) {
      window.location.href ='/';
    } else {
     return false;
    }
  }

  function ClearInvalid(element) {
  	element.className = element.className.replace(/ invalid/,'');
  }

  function CheckTextAreaLenght() {
    var profile_values = document.getElementsByTagName('textarea');

    for ( var i=0; i < profile_values.length; i += 1 ) {
      
      var this_item = CountWords(profile_values.item(i).value);
      
      profile_values.item(i).className =  profile_values.item(i).className.replace(/ invalid/,'');
      
      if ( this_item < 20) {
        
        profile_values.item(i).className += " invalid";
        profile_values.item(i).focus();
        confirm("You need to write at leas 20 words");
        event.returnValue=false;
        return false;     
      }
    }
  }