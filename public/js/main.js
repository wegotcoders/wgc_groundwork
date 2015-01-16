var CountWords = function(text)
  {
    console.log(text)
     var number = 0;
     if  ( text.match(/\w/) ) {
      var gaps = text.replace(/\<br\>/g,'').match(/\W+\w/g);
      number = gaps ? gaps.length + 1 : 1;    
     }
   
     return number;
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