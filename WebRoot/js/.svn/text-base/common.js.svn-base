// JavaScript Document

var ie=document.all;

var nn6=document.getElementById&&!document.all;

var isdrag=false;

var x,y;

var dobj;


function movemouse(e)

{

  if (isdrag)

  {

    dobj.style.left = nn6 ? tx + e.clientX - x : tx + event.clientX - x;

    dobj.style.top  = nn6 ? ty + e.clientY - y : ty + event.clientY - y;

    return false;

  }

}

function selectmouse(e)

{

  var fobj       = nn6 ? e.target : event.srcElement;

  var topelement = nn6 ? "Html" : "BODY";

  while (fobj.tagName != topelement && fobj.className != "dragme")

  {

    fobj = nn6 ? fobj.parentNode : fobj.parentElement;

  }

  if (fobj.className=="dragme")

  {

    isdrag = true;

    dobj = fobj;

    tx = parseInt(dobj.style.left+0);

    ty = parseInt(dobj.style.top+0);

    x = nn6 ? e.clientX : event.clientX;

    y = nn6 ? e.clientY : event.clientY;

    document.onmousemove=movemouse;

    return false;

  }

}

document.onmouseup=new Function("isdrag=false");

function GetElCoordinate(e) //获取Element的坐标
		{
		var t = e.offsetTop;
		var l = e.offsetLeft;
		
		while (e = e.offsetParent)
		{
		t += e.offsetTop;
		l += e.offsetLeft;
		}
		return {
		top: t,
		left: l
		}
}
 function over(path) 
{ 	
		document.getElementById("new1").style.display="";
		var o=  GetElCoordinate(img1);
		var left = o.left+130;
		var top = o.top-300;	
		document.getElementById("new1").style.left = left;
		document.getElementById("new1").style.top = top;
		document.getElementById("new1").innerHTML='<img id ="img4" src="/diyshirt/upload/' + path + '" width="120" height="120" onload="javascript:resizeimg(this,150,150)">'; 
		}
		
function over2(path) 
	{ 	
		document.getElementById("new2").style.display="";
		var o=  GetElCoordinate(img2);
		var left = o.left+130;
		var top = o.top-300;
		document.getElementById("new2").style.left = left;
		document.getElementById("new2").style.top = top;
		document.getElementById("new2").innerHTML='<img id ="img5" src="/diyshirt/upload/' + path + '" width="120" height="120" onload="javascript:resizeimg(this,150,150)">'; 
	}
	
function over3(path,a,b,c)
{
	document.getElementById("new1").style.display="";
	var o=  GetElCoordinate(img1);
	var left = o.left+parseInt(a);
	var top = o.top-parseInt(b);
	document.getElementById("new1").style.left = left;
	document.getElementById("new1").style.top = top;
	document.getElementById("new1").innerHTML='<img src="/diyshirt/upload/' + path + '" width="120" height="120" onload="javascript:resizeimg(this,' + c + ',' + c + ')">'; 
}

function over4(path,a,b,c)
{
	document.getElementById("new2").style.display="";
	var o=  GetElCoordinate(img2);
	var left = o.left+parseInt(a);
	var top = o.top-parseInt(b);	
	document.getElementById("new2").style.left = left;
	document.getElementById("new2").style.top = top;
	document.getElementById("new2").innerHTML='<img src="/diyshirt/upload/' + path + '" width="120" height="120" onload="javascript:resizeimg(this,' + c + ',' + c + ')">'; 
}

function move()
{
	document.getElementById("new1").style.display="none";
	document.getElementById("new1").innerHTML='';
}

function move2()
{
	document.getElementById("new2").style.display="none";
	document.getElementById("new2").innerHTML='';
}

function show(a)
{
	document.getElementById("old").style.display="";
	var o=  GetElCoordinate(img3);
	var left = o.left;
	var top = o.top;	
	document.getElementById("old").style.left = left;
	document.getElementById("old").style.top = top;
	document.getElementById("old").innerHTML='<img src="/diyshirt'+a+'" onload="javascript:resizeimg(this,400,480)">'; 
}

function showpic()
{
	document.getElementById("new2").style.display="";
}

function hidden()
{
	document.getElementById("old").style.display="none";
}

function hiddenpic()
{
	document.getElementById("new2").style.display="none";
	document.getElementById("old").innerHTML='';
}

function resizeimg(ImgD,iwidth,iheight) {
     var image=new Image();
     image.src=ImgD.src;
     if(image.width>0 && image.height>0){
        if(image.width/image.height>= iwidth/iheight){
           if(image.width>iwidth){
               ImgD.width=iwidth;
               ImgD.height=(image.height*iwidth)/image.width;
           }else{
                  ImgD.width=image.width;
                  ImgD.height=image.height;
                }
               ImgD.alt=image.width+"×"+image.height;
        }
        else{
                if(image.height>iheight){
                       ImgD.height=iheight;
                       ImgD.width=(image.width*iheight)/image.height;
                }else{
                        ImgD.width=image.width;
                        ImgD.height=image.height;
                     }
                ImgD.alt=image.width+"×"+image.height;
            }
//ImgD.style.cursor= "pointer"; //改变鼠标指针
//ImgD.onclick = function() { window.open(this.src);} //点击打开大图片
if (navigator.userAgent.toLowerCase().indexOf("ie") > -1) { //判断浏览器，如果是IE
//ImgD.title = "请使用鼠标滚轮缩放图片，点击图片可在新窗口打开";
//ImgD.onmousewheel = function img_zoom() //滚轮缩放
  //{
//　　　　var zoom = parseInt(this.style.zoom, 10) || 100;
//　　　　zoom += event.wheelDelta / 12;
//　　　　if (zoom> 0)　this.style.zoom = zoom + "%";
//　　　　return false;
  //}
  } else { //如果不是IE
     //ImgD.title = "点击图片可在新窗口打开";
  }
    }
}




