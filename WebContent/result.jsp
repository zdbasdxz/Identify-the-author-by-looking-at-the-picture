<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
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
 
	.style_copyright_a{
		text-decoration:none;
		color:#cc00cc;
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
			border: 1px solid green;

		width:100%;
		height:100%;
	}
	.rightarea{
        float: left;
        width: 350px;
        height: 400px;
    }
    .leftarea{
        float: left;
        width: 450px;
        height: 400px;
    }
	.backgroundimg{
		background-color: white;
	}
  
</style>

<script>
//js部分


function uploadFile(inputid,type){
	var formData=new FormData();
    formData.append("file",$('#'+inputid).prop('files')[0]);
    formData.append('type',type);
    $.ajax({
        type:'POST',
        url:'${pageContext.request.contextPath }/IAbypictuter',
        data:formData,
        contentType: false,// 注意：让jQuery不要处理数据
        processData: false,// 注意：让jQuery不要设置contentType
        success:function (msg) {
            console.log("上传成功");
            console.log(msg);
            window.location.reload();
        },
        error:function (msg) {
            console.log("上传失败，请重试");
            alert("上传失败，请重试");
            // window.location.reload();
        }
    });

	document.getElementById("upload_tip_id").innerText="未选择文件";
	console.log("over");
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
 //鼠标悬停事件
$(document).ready(function(){
	$(".Mover").hide();
	$(".ellipsis").mouseover(function(e){
		$(this).next(".Mover").css({
			"position":"absolute",
			"left":e.clientX+1,
			"top":e.clientY+1
		}).show();
	});
	$(".ellipsis").mouseover(function(e){
		$(this).next(".Mover").css({
			"color":"#fff;",
			"position":"absolute;",
			"opacity":"0.9;",
			"width":"600px;",
			"cursor":"default;",
			"top":";",
			"left":"1;"
		});
	});
	$(".ellipsis").mouseout(function(){
		$(this).next(".Mover").hide();
	});

});


$(document).ready(function(){
	$(".us").hide();
	$(".contact").mouseover(function(){
		$(".us").show("slow");
		$(".contact").mouseout(function(){
			$(".us").hide();
		});
	});
});



</script>

<body>
  <div id="content_div" class="backgroundimg">
	  <br>
	  <br>
	  <div>
		<marquee scrollAmount=4 witdh=300>
			欢迎使用本软件,此处正在测试
		</marquee>
	  </div>
		 <br>
		 <input type="hidden" id="info" value="<%=request.getAttribute("res")%>"/>
		 <div class="ellipsis" value="<%=request.getAttribute("res")%>">测试testing ${session.rt}
		 </div>
		 <div class="Mover">这是隐藏的内容，测试ing</div>
		 <br>
		 <br>

	  <div class="pictures" ><div style="margin-top:25px;">
		<table style="margin-left:50px">
			<tr>
				<th class="ellipsis">
					<div class="leftarea" class="ellipsis"><img class="img" src="img.jpg" /><div>
				</th>
				<th>
					<div class="rightarea" style="border: 1px solid green;overflow-y: scroll;" class="ellipsis">
							结果：${request.res} 
						</div>
				</th>
			</tr>
		 </table>
	  </div>
   	 	<br>
		<br>
   	  <a class="style_copyright_a" href="javascript:void(0);"  onclick="showUploadDialog()">上传新文件</a>
   </div>
   <div id="upload_dialog" class="upload_dialog_div"> 
   	    <div class="style_content_div">
  	  	  <div class="style_content_upper_div">
  	  	  	  <div class="style_content_file_div">
  	  	  	  	 <span class="style_file_span"> 文件路径：</span>
				 <input type="file" id="pic" name="pic" οnchange="style_file_content">
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
</body>

 
</html>