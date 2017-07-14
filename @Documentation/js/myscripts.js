  function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.body.scrollHeight + 20 + 'px';
  }
  
  function checkiframes()
	{
	var request = new XMLHttpRequest();  
	request.open('GET', 'iframes/promote.htm', true);
	request.onreadystatechange = function(){
		if (request.readyState === 4){
			if (request.status === 404) {  
				<!-- alert("Oh no, it does not exist!"); -->
			}  
			else {
			<!-- alert("Oh yes, it does exist!"); -->
			$(".container").append('<iframe style="border-width:0px;float:left" src="iFrames/promote.htm" width="100%" onload="resizeIframe(this)" scrolling="no"></iframe>');
			}
		}
	};
	request.send();
	}