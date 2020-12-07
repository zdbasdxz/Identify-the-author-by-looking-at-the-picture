<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
<script src="jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>看图识作者</title>
</head>

<style type="text/css">
#parent{width:550px; height:10px; border:2px solid #09F;}
	#son {
		width:0;
		height:100%;
		border-radius:10px;
		background-color:#e94829;
		text-align:center;
		line-height:20px;
		font-size:15px;
		color:white;
		font-weight:bold;
	} 

	#content_div{
		position:absolute;
		left:0px;
		top:0px;
		right:0px;
		bottom:0px;
		text-align:center
	}
	html,body{;}
	body {
		background-image: url("timg.jpg");
		background-repeat: no-repeat;
		background-size: 100% 100%;
	}
  
	.upload_dialog_div{
		position:fixed;
		left:0px;
		right:0px;
		top:0px;
		bottom:0px;
		overflow:auto; 
		visibility:hidden;
		background-color: rgba(60,60,60,0.5);
		z-index:99;
	}
	.style_content_div{
		position:relative;
		margin:auto;
		margin-top:160px;
		width:400px;
		height:160px;
		background:#F5F5DC;
	}
	.style_content_upper_div{
		position:absolute;
		left:0px;
		top:0px;
		width:400px;
		height:100px;
		background:#F5F5DC;
	}
	.style_content_lower_div{
		position:absolute;
		left:0px;
		top:100px;
		width:400px;
		height:60px;
		background:#F5FFDC;
	}
  
	.style_content_file_div{
		position:absolute;
		left:15px;
		top:20px;
		width:380px;
		height:60px;
	}
	.style_file_span{
		float:left;
		width:120px;
		height:36px;
		font-size:24px;
		text-align:right;
	}
	.style_file_content{
		margin-top:5px;
	}
	.style_content_prog_div{
		position:absolute;
		left:18px;
		top:57px;
		width:360px;
		height:40px;
	}
	.style_prog_span_hit{
		color:#ff0000;
	}
	.style_prog_content{
		width:360px;
		visibility:hidden;
	}
	.style_content_span{
		width:200px;
		height:60px;
		line-height:60px;
		display:inline-block;
		float:left;
		font-size:32px;
		text-align:center;
		cursor: pointer;
	}
 
	.upload_newfile{
		text-decoration:none;
		color:RGB(250,218,141);
	}
	.pictures{
		width: 900px;
		height: 500px;
		border: 1px solid green;
		position:absolute;
		top:50%;
		left:50%;
		margin:-225px 0 0 -400px;
	}
	.img{
		width:100%;
		height:100%;
	}
	.rightarea{
        float: right;
        width: 350px;
        height: 400px;
    }
    .leftarea{
        float: left;
        width: 450px;
        height: 400px;
    }
	.backgroundimg{
		background:url("timg.jpg");
		background-size:100% 100%;
	}
	.authorimg{
		left:50%; top:50%; 
		width:200px;
		height:200px;
		margin:0 auto;
	}

</style>




<script>
//js部分
var nameEn = "";	//作者的名字
var nameCn = "";
var contry = "";
var sex = "";
var work = "";
var pro = "";
var date = "";
var imgurl = "";
var wiki = "";

setTimeout(
		function() {
             Push();
           },
        200);//setTimeout 程序执行后200毫秒执行push，但是仅此一次。execute the function push only one time after the program began to work
        setInterval(function() {
 
            Push();
 
        },
        3000);

function uploadFile(inputid,type){
	var file = $('#'+inputid).prop('files')[0];//获取文件
	if(!file){
		alert("未选择文件")
		console.log("over");
		window.location.reload();
	}else{
		var formData=new FormData();
    	formData.append("file",file);
    	formData.append('type',type);
    	//document.getElementById("imgrul").src = file.target.result;    		
    	//var imgURl = window.URL.createObjectURL(file);
		//alert(imgURl);
		//图片预览
		var imgURl = window.URL.createObjectURL(file);
		console.log(imgURl);
		//alert(imgURl);
		$('#preview').attr('src',imgURl);
		
	   	$.ajax({
	      	 type:'POST',
	      	 url:'${pageContext.request.contextPath }/IAbypictuter',
	       	 data:formData,
	       	 dataType:"text",
	       	 contentType: false,// 注意：让jQuery不要处理数据
	      	 processData: false,// 注意：让jQuery不要设置contentType
	      	 success:function (msg) {
		         console.log("上传成功");
		         menu = $.parseJSON(msg);
		         var s = "<div>";
		         $.each(menu,function(index,element){
//		 				alert(element.empNo+element.ename);
						//alert(element.name);
						nameEn = element.nameEn;	//作者的名字
					    nameCn = element.nameCn;
						contry = element.contry;
						sex = 	element.gender;
						work = element.works;
						pro = element.profession;
						date = element.date;
						imgurl = element.iconUrl;
						wiki = element.detailsUrl;
						$(".origindata").hide();
							
						
						
						document.getElementById("nameEn").innerText="Name: "+element.nameEN;
						document.getElementById("nameCn").innerText="姓名:   "+element.nameCN;
						document.getElementById("contry").innerText="国家:   "+element.contry;
						document.getElementById("sex").innerText=	"性别:    "+element.gender;
						document.getElementById("work").innerText=	"代表作: "+work;
						document.getElementById("pro").innerText=	"职业::   "+pro;
						$('#wiki').attr('href',wiki);
						document.getElementById("wiki").innerText=	"了解详情点击这里";
						$('#imgurl').attr('src',imgurl);
						$(".detail").show();
						
						
					});
					//$("#ulul").html();
		         	
		         	
		         	
		         	
		         
		            var up_dialog=document.getElementById("upload_dialog");
		        	up_dialog.style.visibility="hidden";
		        	
		        	//$("#ulul").html(msg.string);  //此处设置前台需要显示的标签id
		 	
	        },
	        error:function (msg) {
	            console.log("上传失败，请重试");
	            alert("上传失败，请重试");
	            // window.location.reload();
	        }
	    });
	}
    document.getElementById("upload_tip_id").innerText="未选择文件";
	
}   
function showUploadDialog(){
	var up_dialog=document.getElementById("upload_dialog");
	document.getElementById("upload_tip_id").innerText="请选择要上传的文件";
	up_dialog.style.visibility="visible";	
}
 function hideUploadDialog(){
	var up_dialog=document.getElementById("upload_dialog");
	up_dialog.style.visibility="hidden";
 }
 function style_file_content(){
		document.getElementById("upload_tip_id").innerText="请点击确认";
 }


$(document).ready(function(){
	$(".detail").hide();
});

$(".pic").change(function() {
	document.getElementById("upload_tip_id").innerText="请点击确定";
});



$('#preview').click(function(){
	$('input[name="pic"]').click().change(function(e){
		var imgURl = window.URL.createObjectURL(e.target.files[0]);
		console.log(imgURl);
		alert(imgURl);
		$('#preview').attr('src',imgURl);
	})
})

</script>

<body style="height:100px;width:100%;">
  <div id="content_div" class="backgroundimg">
	  <br>
	  <br>
	  <div>
		<marquee scrollAmount=4 width=300>
			  
		</marquee>
	  </div>
		 <br>
		 <input type="hidden" id="info" value="???"/>
		 <br>
		 <br>

	  <div class="pictures" ><div style="margin-top:25px;">
		<table style="margin-left:50px">
			<tr>
				<th>
					<div class="leftarea"><img id="preview" class="img" src="img.jpg" /></div>
				</th>
				<th>
					<div class="rightarea" style="border: 1px solid green;overflow-y: scroll;text-align:left;color:RGB(222,125,44);">
					<div class="detail">
					<img class="authorimg" src="" id="imgurl"/>
					<div id="nameEn" ></div>
					<div id="nameCn" ></div>
					<div id="contry"></div>
					<div id="sex"></div>
					<div id="work"></div>
					<div id="pro"></div>
					<div id="date"></div>
					<a id="wiki" class="upload_newfile" target="_blank" href="javascript:void(0);"></a>
					</div>
				<div class="origindata">
				文森特·威廉·梵高，荷兰后印象派画家。代表作有《星月夜》、自画像系列、向日葵系列等。
				梵高出生于1853年3月30日荷兰乡村津德尔特的一个新教牧师家庭，早年的他做过职员和商行经纪人，还当过矿区的传教士最后他投身于绘画。他早期画风写实，受到荷兰传统绘画及法国写实主义画派的影响。1886年，他来到巴黎，结识印象派和新印象派画家，并接触到日本浮世绘的作品，视野的扩展使其画风巨变。1888年，来到法国南部小镇阿尔，创作《阿尔的吊桥》；同年与画家保罗·高更交往，但由于二人性格的冲突和观念的分歧，合作很快便告失败。此后，梵高的疯病（有人记载是“癫痫病”）时常发作，但神志清醒时他仍然坚持作画。1889年创作《星月夜》。1890年7月，梵高在精神错乱中开枪自杀，年仅37岁。
				文森特·威廉·梵高，荷兰后印象派画家。代表作有《星月夜》、自画像系列、向日葵系列等。
				梵高出生于1853年3月30日荷兰乡村津德尔特的一个新教牧师家庭，早年的他做过职员和商行经纪人，还当过矿区的传教士最后他投身于绘画。他早期画风写实，受到荷兰传统绘画及法国写实主义画派的影响。1886年，他来到巴黎，结识印象派和新印象派画家，并接触到日本浮世绘的作品，视野的扩展使其画风巨变。1888年，来到法国南部小镇阿尔，创作《阿尔的吊桥》；同年与画家保罗·高更交往，但由于二人性格的冲突和观念的分歧，合作很快便告失败。此后，梵高的疯病（有人记载是“癫痫病”）时常发作，但神志清醒时他仍然坚持作画。1889年创作《星月夜》。1890年7月，梵高在精神错乱中开枪自杀，年仅37岁。
				</div>
					</div>

				</th>
			</tr>
		 </table>
	  </div>
   	 	<br>
		<br>
   	  <a class="upload_newfile" href="javascript:void(0);"  onclick="showUploadDialog()">上传新文件</a>
   </div>
   </div>
   
<form action="IAbypictuter" method="post"> <!-- 消息体，LoginServlet为表单的接受地址 -->   
  <div id="upload_dialog" class="upload_dialog_div"> 
   	    <div class="style_content_div">
  	  	  <div class="style_content_upper_div">
  	  	  	  <div class="style_content_file_div">
  	  	  	  	 <span class="style_file_span"> 文件路径：</span>
				 <input type="file" id="pic" name="pic" onchange="style_file_content()" accept="image/gif, image/jpeg, image/png, image/jpg">
  	  	  	  </div>
  	  	  	  <div class="style_content_prog_div">
  	  	  	  	 <span class="style_prog_span_hit" id="upload_tip_id"> 请选择要上传的文件 </span>
  	  	  	  </div>
  	  	  </div>
  	  	  <div class="style_content_lower_div">
  	  	  	   <span class="style_content_span" onmouseover="this.style.background='#cccccc'" onmouseout="this.style.background=''" onclick="hideUploadDialog()">取消</span>
  	  	  	   <span class="style_content_span" onmouseover="this.style.background='#F5CCDC'" onmouseout="this.style.background=''" onclick="uploadFile('pic','photo')">确定</span>
  	  	  </div>
  	  </div>
   </div>
</form>
		 	
</body>

 
</html>