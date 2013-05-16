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
    var element = document.body;
    var requestMethod = element.requestFullScreen || element.webkitRequestFullscreen || element.webkitRequestFullScreen || element.mozRequestFullScreen || element.msRequestFullScreen;
    if( requestMethod ) {
        requestMethod.apply( element );
    }
}
