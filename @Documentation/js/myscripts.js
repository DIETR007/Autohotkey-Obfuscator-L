  function resizeIframe(obj) {
	  // alert("Oh yes, it does exist!");
	  
	// alert('size ');
	// alert('size ' + obj.contentWindow.document.body.scrollHeight);
    // obj.style.height =  '100px';
    obj.style.height = obj.contentWindow.document.body.offsetHeight + 20 + 'px';
	// alert('size ' + obj.style.height);
  }  
  
  function resizeIframeSmall(obj) {
	  // alert("Oh yes, it does exist!");
    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
	// alert('height ' + obj.style.height);
  }
  
  function checkiframes()
	{
	var request = new XMLHttpRequest();  
	request.open('GET', 'iFrames/promote.htm', true);
	request.onreadystatechange = function(){
		if (request.readyState === 4){
			if (request.status === 404) {  
				<!-- alert("Oh no, it does not exist!"); -->
			}  
			else {
			<!-- alert("Oh yes, it does exist!"); -->
			$(".container").append('<br/><br/><br/><iframe style="border-width:0px;float:left" src="iFrames/promote.htm" width="100%" height="300px" scrolling="no"></iframe>');
			}
		}
	};
	request.send();
	}