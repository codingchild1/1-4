<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<style>
			
.post {
	text-align: center;
}

.get {
	text-align: center;
	font-size: 13px;
	margin: 10px;
}

ul li a {
	text-decoration-line: none;
	color: black;
}

table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	border-bottom: 1px solid #444444;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}

.no {
	width: 60%;
	margin-left: 20%
}

a {
	text-decoration: none !important;
}

a:link {
	color: black;
}

a:visited {
	color: black;
}

a:hover {
	color: black;
}

a:active {
	color: black
}

.postbtn {
	padding-left: 5px;
	padding-right: 5px;
}
	
	#modal.modal-overlay {
	z-index: 8;
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	/* background: rgba(255, 255, 255, 0.25); */
	/* box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37); */
	/* backdrop-filter: blur(1.5px); */
	/* -webkit-backdrop-filter: blur(1.5px); */
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	display: none;
}
 .ptplist {
	display: none;
} 
 .info:hover .ptplist {
	display: block;
} 
#modal .modal-window {
	background: #d3d3d3;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(50px);
	/* backdrop-filter: none; */
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	/* height: 576px; */
	/* position: relative; */
	top: -100px;
	padding: 15px;
}
#modal .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: white;
}
#modal .title h2 {
	display: inline;
}
#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: black;
}
#modal .content {
	padding: 0px 10px;
}
#modal2.modal-overlay {
	z-index: 8;
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	display: none;
}
#modal2 .modal-window {
	background: #d3d3d3;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(50px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	/* height: 542px; */
	/* position: relative; */
	top: -100px;
	padding: 15px;
}
#modal2 .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: white;
}
#modal2 .title h2 {
	display: inline;
}
#modal2 .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: black;
}
#modal2 .content {
	/* margin-top: 20px; */
	padding: 0px 10px;
/* 	text-shadow: 1px 1px 2px gray;
	color: white; */
}

	</style>
<body>
		<header>
			<%@include file ="header.jsp" %>
		</header>
		<div style="width: 100%; margin-top: 5em;">
			<div class="post">
			<span> <span class="postbtn"><a href="mypage">?????? ??????</a></span>
				<span class="postbtn"><a href="changepw">???????????? ??????</a></span> <span
				class="postbtn"><a href="fblist"><b>?????? ??? ???</b></a></span> <span
				class="postbtn"><a href="delete">?????? ??????</a></span>
			</span>
		</div>
		<div class="get">
			<span> <span class="postbtn"><a href="todaylist">?????????
							??????</a></span> <span class="postbtn"><a href="routelist">????????????</a></span> <span
				class="postbtn"><a href="fblist">???????????????</a></span> <span
				class="postbtn"><a href="matelist"><b>???????????????</b></a></span>
			</span>
		</div>
			</div>
	<div class="no justify-content-center">

	<h2	style="font-size: 25px; text-align: center; margin-top: 40px; color: green">???????????????</h2>
		<table >
			<tr style="border-bottom: 1px solid #444444;">
				<th style="text-align: left;   width:20%">no</th>
				<th style="text-align: center; width:50%">??????</th>
				<th style="text-align: center; width:30%">?????????</th>

			</tr>
	<c:forEach var="groupandmate" items="${matelist}">
					<tr style="border-bottom: 1px solid #D3D3D3;">
						<td>${groupandmate.no }</td>
						<td style="text-align: center;" onclick="detailModal('${groupandmate.no}','${groupandmate.type }')">${groupandmate.title}</td>
		 				<td style="text-align: center;">${groupandmate.regdate}</td>
					</tr>
					</c:forEach>
				</table>	
					
	<c:choose>
		
		<c:when test="${matelist!=null && pageInfo.listCount>0 }">
			<div style="">
				
			
					
			
			</div>
			<div id="pageList" style="text-align: center; margin-top:30px; margin-bottom :30px;">
			<c:choose>
				<c:when test="${pageInfo.page<=1}">
					??&nbsp;
				</c:when>
				<c:otherwise>
					<a href="matelist?page=${pageInfo.page-1}">??&nbsp;</a>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
				<c:choose>
					<c:when test="${pageInfo.page==i }">
						${i }&nbsp;
					</c:when>
					<c:otherwise>
						<a href="matelist?page=${i}">${i }&nbsp;</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					??&nbsp;
				</c:when>
				<c:otherwise>
					<a href="matelist?page=${pageInfo.page+1}">??&nbsp;</a>
				</c:otherwise>
			</c:choose>
			</div>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="3">
					<b>????????? ?????? ????????????.</b>
				</td>
			</tr>
		</c:otherwise>
	</c:choose>
	
	</div>		
	<!-- mateform -->
	<div id="modal" class="modal-overlay">
		<div class="modal-window">
			<div class="title">
				<input name='mate_title' id="mate_title" style="color: black; border: none; font-size: 20px; font-weight: bold; background-color: #d3d3d3; margin-top: 20px;"value='' disabled>
				<div class="close-area">X</div>
			</div>
			<input name='user_id' id="user_id"style="color: black; border: none; font-size: 15px; background-color: #d3d3d3; padding-left: 10px; margin-top: 10px;"value=''disabled>
			<div style="font-size: 13px; float: right;display: flex;">
				<form action="mate_updatemate" method="get"><span id="update" ><input type="hidden" id="ptp" name="ptp" value=''><input type="submit" value='??????' style="border:none;background-color:#d3d3d3; cursor:pointer;margin:5px;"></span></form>
				<span id="delete" style="margin: 5px;"><button class="delete" style="border:none;background-color:#d3d3d3;cursor:pointer;">??????</button></span> 
					<span id="alerts" style="margin: 5px;">
						<!-- <span class="alert" style="border:none;background-color:#d3d3d3;cursor:pointer;width: 55px;padding:0px">??????</span> -->
						<input type="hidden" id="mwarning" name="mwarning" value=''>
					</span>
			</div>
			<input name='mate_date' type="text"style="color: black; height: 20px; margin: 10px; border: none; font-size: 12px; background-color:#d3d3d3;"value='' disabled>
			<div class="content">
				<div id="staticMap"style="width: 210px; height: 200px; border: 1px solid black;"></div>
					<input id="mapinfo" name="mapinfo" type="hidden" value=''> 
					<input id="mapinfo2" name="mapinfo2" type="hidden" value=''>
					<input id="mapinfo3" name="mapinfo3" type="hidden" value=''>
				<textarea id="editor" name="mate_cont"style="width: 352px; height: 190px;"></textarea> 
				<input id="mate_cont" name="mate_cont" type="hidden" value=''> 
				<div style="display: flex; flex-direction: row-reverse; margin: 7px; margin-right: 0px; float: right; position: relative; height: 32px;">
					<div class="info" style="margin: 5px;width: 60px;height: 30px;text-align: center;border: 1px solid #59ab6e;background-color: #59ab6e;border-radius: 0.25rem;color:white;cursor:pointer;line-height: 30px;font-size:13px;">??????
						<div class="ptplist"style="position: relative; border: 1px solid; width: 150px; top: -150px; margin: 10px; background-color: #59ab6e;">
							<p style="font-size: 13px; margin: 2px; padding: 5px;display:flex;">????????? ??????</p>
							<div class="list" style="margin: 5px;margin-left:10px">
								<input type="hidden" id="ptpli" name="ptpli" value=''>
							</div>
						</div>
					</div>
					<!-- <button class="ptp"  style="margin: 5px;width: 60px;height: 30px;text-align: center;border: 1px solid #59ab6e;background-color: #59ab6e;border-radius: 0.25rem;color:white;cursor:pointer;font-size:13px;">??????</button> -->
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- groupform -->
	<div id="modal2" class="modal-overlay">
		<div class="modal-window">
			<div class="title">
				<input name="group_title" id="group_title"style="color: black; border: none; font-size: 20px; font-weight: bold; background-color:#d3d3d3; margin-top: 20px;"value='' disabled>
				<div class="close-area">X</div>
			</div>
			<input name="user_id" id="user_id"style="color: black; border: none; font-size: 15px; background-color: #d3d3d3; padding-left: 10px; margin-top: 10px;"value='' disabled>
			<div style="font-size: 13px; float: right;display: flex;">
				<form action="mate_updategroup" method="get"><span id="update2"><input type="hidden" id="ptp" name="ptp" value=''><input type="submit" value='??????' style="border:none;background-color:#d3d3d3; cursor:pointer;margin:4px;"></span></form>
				<span id="delete2" style="margin: 5px; cursor: pointer;"><button class="delete2" style="border:none;background-color:#d3d3d3;cursor:pointer;">??????</button></span>
				<span id="alerts" style="margin: 5px;">
				<!-- 	<span class="alert2" style="border:none;background-color:#d3d3d3;cursor:pointer;width: 55px;">??????</span> -->
					<input type="hidden" id="gwarning" name="gwarning" value=''>
				</span>

			</div>
			<input name="group_date" type="text"style="color: black; height: 20px; margin: 10px; border: none; font-size: 12px; background-color: #d3d3d3;"value='' disabled>
			<div class="content">
				<div id="staticMap2"style="width: 210px; height: 200px; border: 1px solid black;"></div>
				<input id="mapinfo" name="mapinfo" type="hidden" value=''> 
				<input id="mapinfo2" name="mapinfo2" type="hidden" value=''>
					<input id="mapinfo3" name="mapinfo3" type="hidden" value=''>
				 <textarea id="editor2"style="width: 352px; height: 190px;"></textarea> 
					<input id="group_cont" name="group_cont" type="hidden" value=''> 
				<div style="display: flex; flex-direction: row-reverse; margin-top: 13px; margin-right: 0px; float: right; position: relative;">
					<a id=group_kl href='' target='_blank'><img class="kakao"src="images/kakao.png"style="width:25px;height:25px;margin-left:13px;"></a>
					<a id=group_il href='' target='_blank'><img class="insta"src="images/insta.png"style="width:25px;height:25px;"></a>

				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<script type="text/javascript"src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ff3a060b5b1b48bc2f77af63c6fa27a"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script	src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>
	<script>

	let m_editor;
	let g_editor;

//mate ckeditor
ClassicEditor.create(document.querySelector("#editor"))
    .then(editor=>{
    	window.editor = editor;
    	editor.isReadOnly = true;
    	const toolbarElement = editor.ui.view.toolbar.element;
    	toolbarElement.style.display = 'none';
    	m_editor=editor;
    })
	.catch((error) => {
    	console.error(error);
    });
    
//group ckeditor
ClassicEditor.create(document.querySelector("#editor2"))
    .then(editor=>{
   		window.editor = editor;
    	editor.isReadOnly = true;
    	const toolbarElement = editor.ui.view.toolbar.element;
    	toolbarElement.style.display = 'none';
    	g_editor=editor;
 	})
	.catch((error) => {
    	console.error(error);
    });

//????????? ????????? ????????? ???????????? ??????
function detailModal(no,type){
	//?????? ????????? ajax
	if(type=='m'){
	 modal.style.display = "flex";
        $.ajax({
			type:"post",
			dataType:"text",
			async:false,
			url:"${pageContext.request.contextPath}/Mmodal",
			data:{"no":no},
			success: function(data, textStatus){ 
			 	var jdata = JSON.parse(data);
			 	/*  console.log(jdata.mate_mapinfo);    */
			 	var map = JSON.parse(jdata.mate_mapinfo);
			  	/*  console.log(map.La); */
			  
 			 	$('input[name=mate_title]').attr('value',jdata.mate_title);
 			 	$('input[name=user_id]').attr('value',jdata.user_id); 
 			 	$('input[name=mate_date]').attr('value',jdata.mate_date); 
 			 	$('input[name=ptp]').attr('value',jdata.mate_articleNO);
 			 	$('input[name=mapinfo]').attr('value',map.La); 
 			 	$('input[name=mapinfo2]').attr('value',map.Ma); 
 			 	$('input[name=mapinfo3]').attr('value',jdata.mate_mapinfo); 
 			 	$('input[name=mate_cont]').val(jdata.mate_cont); 
 			 	$('input[name=mate_cont]').val(jdata.mate_cont);
 			 	$('input[name=mwarning]').val(jdata.warning);
 			   
 			 	/*  console.log(jdata.mate_mapinfo);
 			  	console.log(jdata.mate_cont); */
 			  	/* console.log($('#mate_cont').val());  */
 			 	var uid = '<%=(String)session.getAttribute("id")%>';
 			  	if($('#user_id').val()==uid){
 				 	$('#delete').show();
 				 	$('#update').show();
 			  	}else{
 				 	$('#delete').hide();
 				 	$('#update').hide();
 			 	}
 			  	
 				//????????????????????? ??????????????? ??????	  
 	   			m_editor.setData($('#mate_cont').val());
 	   	
 				var La = $('#mapinfo').val();
 				var Ma = $('#mapinfo2').val();
 			
 				//?????? ???????????? ???????????? ??????
 				var mapContainer = document.getElementById('staticMap'), // ????????? ????????? div 
 		   	 	mapOption = { 
 		        	center: new kakao.maps.LatLng(Ma, La), // ????????? ????????????
 		        	level: 3 // ????????? ?????? ??????
 		   	 	};

 				var map = new kakao.maps.Map(mapContainer, mapOption); // ????????? ???????????????

 				// ????????? ????????? ??????????????? 
 				var markerPosition  = new kakao.maps.LatLng(Ma, La); 

 				// ????????? ???????????????
 				var marker = new kakao.maps.Marker({
 		    		position: markerPosition
 				});

 				// ????????? ?????? ?????? ??????????????? ???????????????
 				marker.setMap(map);
				},
			error:function(data, textStatus){
				alert("??????");
			}
		});
        	//????????? ????????? ajax
        	$.ajax({     
    			type:"post",
    			dataType:"text",
    			async:false,
    			url:"${pageContext.request.contextPath}/ptplist",
    			data:{"no":no},
    			success: function(data, textStatus){ 
    				$('.list').html('');
    				var jdata = JSON.parse(data);
    				console.log(jdata);
    			 	for(let i of jdata) {
    				 	var clist = $('.list').html()+'<span style="float: left;">'+i.user_id+"</span><br>";
    				 	$('.list').html(clist);
    				}
    			},
    			error:function(data, textStatus){
    				alert("??????");
    			}
    		});
       		//?????? ???????????? ??????
        	$.ajax({     
    			type:"post",
    			dataType:"text",
    			async:false,
    			url:"${pageContext.request.contextPath}/alertcheck",
    			data:{"no":no},
    			success: function(data, textStatus){ 
    				if(data=='true'){
    					$("#alerts span").html("????????????");
    				}else{
    					$("#alerts span").html("??????");
    				}
    			},
    			error:function(data, textStatus){
    				alert("??????");
    			}
    		});
        //???????????? ??????
        	 $.ajax({     
    			type:"post",
    			dataType:"text",
    			async:false,
    			url:"${pageContext.request.contextPath}/Likecheck",
    			data:{"no":no},
    			success: function(data, textStatus){ 
    				if(data=='true'){
    					$('.ptp').html('????????????');
    				}else{
    					$('.ptp').html('??????');
    				}
    			},
    			error:function(data, textStatus){
    				alert("??????");
    			}
    		}); 

    //????????? ????????? ajax
	}else{
		modal2.style.display = "flex";
		 		$.ajax({
					type:"post",
					dataType:"text",
					async:false,
					url:"${pageContext.request.contextPath}/Gmodal",
					data:{"no":no},
					success: function(data, textStatus){ 
			 			var jdata = JSON.parse(data); 
		 			var map = JSON.parse(jdata.group_area);
			 			$('input[name=group_title]').attr('value',jdata.group_title);
			 			$('input[name=user_id]').attr('value',jdata.user_id);
			 			$('input[name=group_date]').attr('value',jdata.group_date);
			 			$('input[name=ptp]').attr('value',jdata.group_articleNO);
			 			$('#group_kl').attr('href',jdata.group_kl);
			 			$('#group_il').attr('href',jdata.group_il);
			 			$('input[name=mapinfo]').attr('value',map.La); 
		 			$('input[name=mapinfo2]').attr('value',map.Ma);  
		 			$("#group_cont").val(jdata.group_cont); 
		 			$('input[name=gwarning]').val(jdata.warning); 
		 	
		 			var uid = '<%=(String)session.getAttribute("id")%>';
		  			if($('#user_id').val()==uid){
				 			$('#delete2').show();
				 			$('#update2').show();
			  			}else{
				 			$('#delete2').hide();
				 			$('#update2').hide();
			  			}
		  			/* if($('#gwarning').val()=='1'){
				 			$('#alerts span').html('????????????');
			  			}else{
				 			$('#alerts span').html('??????');
			  			} */
		  
			//???????????????????????? ??? ?????? ??????
			g_editor.setData($('#group_cont').val());
		 
				var La = $('#mapinfo').val();
				var Ma = $('#mapinfo2').val(); 
			
				//????????? ???????????? ??????
				var mapContainer = document.getElementById('staticMap2'), // ????????? ????????? div 
		    	mapOption = { 
		        	center: new kakao.maps.LatLng(Ma, La), // ????????? ????????????
		        	level: 3 // ????????? ?????? ??????
		    	};

				var map = new kakao.maps.Map(mapContainer, mapOption); // ????????? ???????????????

				// ????????? ????????? ??????????????? 
				var markerPosition  = new kakao.maps.LatLng(Ma, La); 

				// ????????? ???????????????
				var marker = new kakao.maps.Marker({
		   		 	position: markerPosition
				});

				// ????????? ?????? ?????? ??????????????? ???????????????
				marker.setMap(map);
				},
				error:function(data, textStatus){
					alert("??????");
				}
			});
		 	//????????? ???????????? ??????
        	$.ajax({     
    			type:"post",
    			dataType:"text",
    			async:false,
    			url:"${pageContext.request.contextPath}/alertcheck2",
    			data:{"no":no},
    			success: function(data, textStatus){ 
    				if(data=='true'){
    					$("#alerts span").html("????????????");
    				}else{
    					$("#alerts span").html("??????");
    				}
    			},
    			error:function(data, textStatus){
    				alert("??????");
    			}
    		});
	}
}
//mate ????????? ??????
const modal = document.getElementById("modal")
function modalOn() {
    modal.style.display = "flex"
}
function isModalOn() {
    return modal.style.display === "flex"
}
function modalOff() {
    modal.style.display = "none"
}
const closeBtn = modal.querySelector(".close-area")
closeBtn.addEventListener("click", e => {
    modalOff()
});
modal.addEventListener("click", e => {
    const evTarget = e.target
    if (evTarget.classList.contains("modal-overlay")) {
        modalOff()
    }
});
window.addEventListener("keyup", e => {
    if (isModalOn() && e.key === "Escape") {
        modalOff()
    }
});
//group ????????? ??????
const modal2 = document.getElementById("modal2")
function modalOn1() {
    modal2.style.display = "flex"
}
function isModalOn1() {
    return modal2.style.display === "flex"
}
function modalOff1() {
    modal2.style.display = "none"
}

const closeBtn2 = modal2.querySelector(".close-area")
closeBtn2.addEventListener("click", e => {
    modalOff1()
})
modal2.addEventListener("click", e => {
    const evTarget2 = e.target
    if (evTarget2.classList.contains("modal-overlay")) {
        modalOff1()
    }
})
window.addEventListener("keyup", e => {
    if (isModalOn1() && e.key === "Escape") {
        modalOff1()
    }
});
//mate????????? ??????
	$('.delete').click(function(){
	$.ajax({
        type:"post",
        dataType:"text",
        async:false,
        url:"${pageContext.request.contextPath}/deletemate",
        data:{"no":$('#ptp').val()},
        success: function(data, textStatus){
        	alert("??????????????? ?????????????????????.");
        	location.reload();
        },
        error:function(data, textStatus){
        	alert("??????");
        }
 	});
});

	//group????????? ??????
$('.delete2').click(function(){
	$.ajax({
        type:"post",
        dataType:"text",
        async:false,
        url:"${pageContext.request.contextPath}/deletegroup",
        data:{"no":$('#ptp').val()},
        success: function(data, textStatus){
        	alert("??????????????? ?????????????????????.");
        	location.reload();
        },
        error:function(data, textStatus){
        	alert("??????");
        }
	});
});
		   
		

	</script>
	
</body>
</html>