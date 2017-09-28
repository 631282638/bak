<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common/basic.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html id="emle">
  <head>
    <base href="<%=basePath%>">
    <title>一个管理系统</title>
  	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<%=basePath%>common/css/font-awesome.min.css" rel="stylesheet">
	 <link rel="stylesheet" href="<%=basePath%>common/css/style.css" type="text/css"></link>
	 <link rel="stylesheet" href="<%=basePath%>/common/layui/css/layui.css" type="text/css"></link>
	<script type="text/javascript" src="<%=basePath%>common/layui/layui.js"></script>
	 <script type="text/javascript" src="<%=basePath%>common/js/index.js"></script>
    <style>
    
    .accordion li i.op {
	-webkit-transform: rotate(180deg);
	-ms-transform: rotate(180deg);
	-o-transform: rotate(180deg);
	transform: rotate(180deg);
}
/*.submenu{
   max-height:200px; 
   overflow-y:auto;

}
*/
.ydob{
height:100%;
overflow-y:auto;
background:#DCDCDC;

}

.logo_css{
/* vertical-align:middle; */
  /*  margin-top:5px;
   margin-left:2px;
   margin-right:6px; */
   margin-left:2%;
   width:25%;
   height:25%;
   float:left;
   position:relative;
   top:-5%;
   transition:.8s ease-in-out;
}
.logo_css:hover{
   transform:scale(1.2,1.2);
}
.linyipost_logobg_cs{
  height:50px;
  
  overflow:hidden;
}
.linyipost_title{
  height:80px;

}
.enlarger-cont{
/* border:2px solid #1d15a; */

float:left;
height:70%;
width:70%;

position:absolute;
right:0;
top:15%;
 transition:.8s ease-in-out;
}
.enlarger-cont:hover{
   transform:scale(1.2,1.2) ;
   
}
    </style>
 </head>
  <body class="ydob">
    <div class="logo">
    <form id="logoff_form" action="user/logoff.do" method="post">
			<input name="id" type="hidden" value="username" />
		</form>
    </div>
	<div class="linyipost_panel">
	<div class="linyipost_toolbar">
	<table class="linyipost_title">
	<tr>
	<td class="linyipost_logobg_cs" style="position:relative;top:-5%;" align="center">
	<table style="width:100%;">
	  <tr style="width:100%;">
	  <td style="width:100%;">
	   <div style=" display:flex;justify-content:center; align-items:center;" class="enlarger-cont">
	          <p style='overflow:hidden;color:yellow; font-weight:normal;font-size: 20'>工具sys</p>
	  </div>
	  </td>
	  </tr>
	</table>	
	</td>
	<td class="linyipost_icon_css"><div class="linyipost_inco_ct" onclick="contentsShow(-1,-1,'posthome/bg.do')" ><i class="fa fa-bars"></i></div></td>
	<td class="linyi_post_title_css">一个管理平台</td>
	<td class="linyipost_user_css">hi<span style="font-size:20px;color:#f00;border-bottom:1px dashed #f00;">&nbsp;${sessionScope.user_name}&nbsp;</span>欢迎您   <a onclick="logOff()">
	<span class="linyipost_user_logout">&nbsp;&nbsp;<i class='fa fa-power-off'></i> 注销</span></a></td>
	</tr>
	</table>
	</div>
	<div class="linyipost_left_menu" style="height:90%;overflow:auto;">
 	<ul id="accordion" class="accordion">
	</ul>
	</div>
	<div class="linyipost_content" style="height:90%">
		  <div id="tab1" class='content_css'>
			  <iframe src="<%=basePath%>posthome/bg.do" name="ifrmname" id="show_contents" width="100%" height="100%"  frameborder="0"> </iframe>
		   </div>
   		
	</div>
	</div>
  </body>
 <script type="text/javascript">
     var request_page;
	var contentsShow = function(i,j,url){
		 request_page = '<%=basePath%>'+url;
	//	request_page += "?mainGardenCode="+'${mainGardenCode}'+"&partGardenCode=" + '${partGardenCode}'+"&isSuper="+'${isSuper}'+"&cityCode="+'${cityCode}';
		$("#show_contents").attr("src", request_page);
	//	$("#li_"+i+"_"+j).css("background","#cb4a5d"); //#b63b4d
		
	};
  	
  //	alert('${menu_list}')
  //	alert('${sessionScope.user_name}')
 
 	$(function(){
 	var height = document.body.clientHeight;
 	$("body").css("height",$(document).height());
 	});
	//----------------------------------------------------------------------
	  var map = JSON.parse('${menu_list}');
				     var flag = map.flag;
				    if(flag == 2){
				     // window.location.href="user/index.do";
				  //    return;
				      }else if(flag==1){
				     var menuData = map.list;
				      var htmlDom = $("#accordion");
				      var firstHtml = "";
				      var secondHtml = "";
				      if(menuData != null && menuData.length > 0){
				          for(var j=0;j<menuData.length;j++){
				           firstHtml +="<li>";
				           firstHtml +="<div class='link'><i class='fa fa-"+menuData[j].m_icon+"'></i>"+menuData[j].m_title+"<i class='fa fa-chevron-down'></i></div>";
				          //
				           if(menuData[j].secondMenuListl != null && menuData[j].secondMenuListl.length >0){
				                secondHtml = "<ul class='submenu'>";
				                for(var i=0;i<menuData[j].secondMenuListl.length;i++){
					                 secondHtml+="<li id='li_"+i+"_"+j+"' class='sde'><i class='fa fa-"+menuData[j].secondMenuListl[i].m_icon+
					                 "'></i><a onclick=contentsShow("+i+","+j+",'"+menuData[j].secondMenuListl[i].m_url+"')>"+menuData[j].secondMenuListl[i].m_title+"</a></li>";
				                }
				                 secondHtml +="</ul>";
				           }
				           firstHtml += secondHtml;
				           firstHtml +="</li>";
				          }
				         
				      }
				   htmlDom.append(firstHtml);   
				     
				     }
		// zhuxiao 		     
		var logOff = function(){
			window.location.href="<%=path%>";
		};		    
				      
 </script>
 </html>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   