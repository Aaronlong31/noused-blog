function acceptFullscreen(){
    var imgEle = document.createElement("img");
    imgEle.src="../img/fullscreen_32.png";
    imgEle.style.position = "fixed";
    imgEle.style.bottom = "0px";
    imgEle.style.right = "0px";
    imgEle.onclick = enterFullscreen;
    document.body.appendChild(imgEle);
}
function enterFullscreen() {
 window.open(window.location, "_blank", "fullscreen=yes, scrollbars=auto"); 
return;
/*
    var element = document.body;
    var requestMethod = element.requestFullScreen || element.webkitRequestFullscreen || element.webkitRequestFullScreen || element.mozRequestFullScreen || element.msRequestFullScreen;
    if( requestMethod ) {
        requestMethod.apply( element );
	 if (document.all) {
            top.window.resizeTo(screen.availWidth, screen.availHeight);
        }

        else if (document.layers || document.getElementById) {
            if (top.window.outerHeight < screen.availHeight || top.window.outerWidth < screen.availWidth) {
                top.window.outerHeight = screen.availHeight;
                top.window.outerWidth = screen.availWidth;
            }
        }
    }
*/
}
