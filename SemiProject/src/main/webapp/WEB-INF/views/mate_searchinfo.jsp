<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<style>
* {
	padding: 0;
	box-sizing: border-box;
}
body {
	display: flex;
	flex-direction: column;
	justify-content: center;
}
.post li {
	float: left;
	margin: 10px;
	list-style: none;
}
ul li a {
	text-decoration-line: none;
	color: black;
}
button a {
	text-decoration-line: none;
	color: white;
}
.post {
	display: inline-flex;
	width: 1060px;
	margin-top: 51px;
	justify-content: space-between;
}
.main {
	position: relative;
}
.box {
	border-radius: 5px;
	background-color: darkgray;
}
.container1 {
	margin: 20px;
	width: 1060px;
}
.register {
	width: 300px;
	height: 160px;
	padding: 8px 8px;
	background: white;
	color: #2b2e4a;
	font-size: 14px;
	margin: 14px;
	box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
	display: inline-block;
}
.profile {
	width: 50px;
	height: 50px;
	border-radius: 70%;
}
#modal.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
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
	background: rgba(69, 139, 197, 0.70);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(50px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	height: 576px;
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
	color: white;
}
#modal .content {
	/* margin-top: 20px; */
	padding: 0px 10px;
	text-shadow: 1px 1px 2px gray;
	color: white;
}
#modal2.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	display: none;
}
#modal2 .modal-window {
	background: rgba(69, 139, 197, 0.70);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(50px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
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
	color: white;
}
#modal2 .content {
	padding: 0px 10px;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<div style="width: 1060px; padding: 10px; margin: 20px auto;">
		<h1>????????? ?????????</h1>
		<div class="main">
			<div class="post">
				<ul>
					<li><a href="mate_main">??????</a></li>
					<li><a href="mate_search"><b>??????</b></a></li>
					<li><a href="mate_map">????????? ??????</a></li>
				</ul>
				<div style="display: flex; float: right; align-items: center; margin-right: 55px;">
					<button style="width: 30; height: 40px; padding: 6px 6px; margin: 7px; border: 1px solid #59ab6e; background-color: #59ab6e; border-radius: .25rem;"><a href="mate_makemate">?????? ?????????</a></button>
					<button style="width: 30; height: 40px; padding: 6px 6px; margin: 7px; border: 1px solid #59ab6e; background-color: #59ab6e; border-radius: .25rem;"><a href="mate_makegroup">????????? ?????????</a></button>
				</div>
			</div>
		</div>
		<div style="width: 700px; margin: 60px; margin-left: 120px;">
			<div style="margin: 25px;">
				<div class="box"style="background-color: #59ab6e; color: white; border: 1px solid #59ab6e; border-radius: .25rem; display: inline-block; border: 1px solid; width: 90px; height: 40px; text-align: center; vertical-align: middle; line-height: 40px;">??????</div>
				<select id="type"style="width: 90px; height: 40px; font-size: 15px; margin-left: 10px;">
					<option value="m">??????</option>
					<option value="g">?????????</option>
				</select>
			</div>
			<div style="margin: 25px; display: flex;">
				<div class="box"style="background-color: #59ab6e; color: white; border: 1px solid #59ab6e; border-radius: .25rem; display: inline-block; border: 1px solid; width: 99.5px; height: 40px; text-align: center; vertical-align: middle; line-height: 40px;">??????</div>
				<select id="option"style="width: 98.5px; height: 40px; font-size: 15px; margin-left: 15px;">
					<option value="title">??????</option>
					<option value="id">?????????</option>
					<option value="cont">??????</option>
				</select>
				<input id="input" type="text"style="width: 500px; height: 40px; margin-left: 10px; font-size: 15px;"placeholder="???????????? ???????????????.">
			</div>
			<button class="search"style="width: 90px; height: 40px; font-size: 15px; border-radius: .25rem; background-color: #59ab6e; border: 1px solid #59ab6e; color: white; margin: auto; display: block; margin-top: 60px; cursor: pointer;">??????</button>
		</div>
		<div class="container1">
			<c:forEach items="${mates }" var="groupandmate">
				<div class="register">
					<div style="margin: 5px; padding: 5px; display: flex; align-items: flex-start; justify-content: space-between;">
						<span><img class="profile" src='${groupandmate.img }'></span>
						<div style="margin-left: 10px;">
							<span><input type="text" id="title"value='${groupandmate.title }'style="height: 35px; vertical-align: middle; font-weight: bold; font-size: 15px; border: none; background-color: white;"disabled></span> 
							<span><input type="text" id="id"value='${groupandmate.id }'style="height: 20px; vertical-align: middle; border: none; background-color: white;"disabled></span>
						</div>
					</div>
					<div style="margin: 5px; margin-top: 25px; padding: 5px; vertical-align: middle;">
						<span><img class="heart" src="images/ptp2.png"style="width: 30px; height: 30px;"></span> 
						<span><input type="text" id="like" value='${groupandmate.likeno }'style="width: 30px; display: inline-block; vertical-align: middle; margin-bottom: 20px; font-size: 15px; font-weight: bold; border: none; background-color: white;"disabled></span>
						<button id="btn-modal" class="more"style="border: none; float: right; margin-top: 10px; background-color: white; color: rgba(var(- -f52, 142, 142, 142), 1); cursor: pointer;"onclick="detailModal('${groupandmate.no}','${groupandmate.type }')">?????????</button>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- mateform -->
	<div id="modal" class="modal-overlay">
		<div class="modal-window">
			<div class="title">
				<input name='mate_title' id="mate_title"style="color: black; border: none; font-size: 20px; font-weight: bold; background-color: rgba(123, 173, 213, 0.70); margin-top: 20px;"value=''>
				<div class="close-area">X</div>
			</div>
			<input name='user_id' id="user_id"style="color: black; border: none; font-size: 15px; background-color: rgba(123, 173, 213, 0.70); padding-left: 10px; margin-top: 10px;"value=''>
			<div style="font-size: 13px; float: right; display: flex;">
				<form action="mate_updatemate" method="get">
					<span id="update">
						<input type="hidden" id="ptp" name="ptp"value=''>
						<input type="submit" value='??????'style="border: none; background-color: rgba(123, 173, 213, 0.70); cursor: pointer; margin: 5px;">
					</span>
				</form>
				<span id="delete" style="margin: 5px;"><button class="delete"style="border: none; background-color: rgba(123, 173, 213, 0.70); cursor: pointer;">??????</button></span>
				<span style="margin: 5px;"><button class="repoprt"style="border: none; background-color: rgba(123, 173, 213, 0.70); cursor: pointer;">??????</button></span>
			</div>
			<input name='mate_date' type="text"style="color: black; height: 20px; margin: 10px; border: none; font-size: 12px; background-color: rgba(123, 173, 213, 0.70);"value='' disabled>
			<div class="content">
				<div id="staticMap"style="width: 210px; height: 200px; border: 1px solid black;"></div>
					<input id="mapinfo" name="mapinfo" type="hidden" value=''>
					<input id="mapinfo2" name="mapinfo2" type="hidden" value=''> 
					<input id="mapinfo3" name="mapinfo3" type="hidden" value=''>
				<textarea id="editor" name="mate_cont"style="width: 352px; height: 190px;"></textarea>
				<div style="display: flex; flex-direction: row-reverse; margin: 7px; margin-right: 0px; float: right; position: relative; height: 32px;">
					<div class="info" style="margin: 5px; width: 43px;">??????
						<div class="ptplist"style="position: relative; border: 1px solid; width: 200px; top: -150px; margin: 10px; background-color: #2b2e4a;">
							<p style="font-size: 13px; margin: 2px; padding: 5px;">????????? ??????</p>
							<div class="list" style="margin: 5px;">
								<input type="hidden" id="ptpli" name="ptpli" value=''>
							</div>
						</div>
					</div>
					<button class="ptp" style="margin: 5px; width: 43px;">??????</button>
				</div>
			</div>
		</div>
	</div>
	<!-- groupform -->
	<div id="modal2" class="modal-overlay">
		<div class="modal-window">
			<div class="title">
				<input name="group_title" id="group_title"style="color: black; border: none; font-size: 20px; font-weight: bold; background-color: rgba(123, 173, 213, 0.70); margin-top: 20px;"value='' disabled>
				<div class="close-area">X</div>
			</div>
			<input name="user_id" id="user_id"style="color: black; border: none; font-size: 15px; background-color: rgba(123, 173, 213, 0.70); padding-left: 10px; margin-top: 10px;"value=''>
			<div style="font-size: 13px; float: right; display: flex;">
				<form action="mate_updategroup" method="get">
					<span id="update2"><input type="hidden" id="ptp" name="ptp"	value=''><input type="submit" value='??????'style="border: none; background-color: rgba(123, 173, 213, 0.70); cursor: pointer; margin: 4px;"></span>
				</form>
				<span id="delete2" style="margin: 5px; cursor: pointer;">
				<button class="delete2"style="border: none; background-color: rgba(123, 173, 213, 0.70); cursor: pointer;">??????</button></span>
				<span style="margin: 5px;"><button class="repoprt"style="border: none; background-color: rgba(123, 173, 213, 0.70); cursor: pointer;">??????</button></span>
			</div>
			<input name="group_date" type="text"style="color: black; height: 20px; margin: 10px; border: none; font-size: 12px; background-color: rgba(123, 173, 213, 0.70);"value='' disabled>
			<div class="content">
				<div id="staticMap2"style="width: 210px; height: 200px; border: 1px solid black;"></div>
					<input id="mapinfo" name="mapinfo" type="hidden" value=''> 
					<input id="mapinfo2" name="mapinfo2" type="hidden" value=''> 
					<input id="mapinfo3" name="mapinfo3" type="hidden" value=''>
				<textarea id="editor2" style="width: 352px; height: 190px;"></textarea>
				<input id="group_cont" name="group_cont" type="hidden" value=''>
				<div style="display: flex; flex-direction: row-reverse; margin-top: 13px; margin-right: 0px; float: right; position: relative;">
					<a id=group_kl href=''><img class="kakao"src="images/kakao.png"style="width: 25px; height: 25px; margin-left: 13px;"></a> 
					<a id=group_il href=''><img class="insta" src="images/insta.png"style="width: 25px; height: 25px;"></a>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript"src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ff3a060b5b1b48bc2f77af63c6fa27a"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>
<script>

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
    			  	var map = JSON.parse(jdata.mate_mapinfo);
    			  	
     			 	$('input[name=mate_title]').attr('value',jdata.mate_title);
     			 	$('input[name=user_id]').attr('value',jdata.user_id); 
     			 	$('input[name=mate_date]').attr('value',jdata.mate_date); 
     			 	$('input[name=ptp]').attr('value',jdata.mate_articleNO);
     			 	$('input[name=mapinfo]').attr('value',map.La); 
     			 	$('input[name=mapinfo2]').attr('value',map.Ma); 
     			 	$('input[name=mapinfo3]').attr('value',jdata.mate_mapinfo); 
     			 	$('input[name=mate_cont]').val(jdata.mate_cont); 
     			 	
     			 	var uid = '<%=(String)session.getAttribute("id")%>';
     			  	if($('#user_id').val()==uid){
     				 	$('#delete').show();
     					$('#update').show();
     			  	}else{
     					$('#delete').hide();
     				 	$('#update').hide();
     			  	} 
     	          
     	     	ClassicEditor.create(document.querySelector("#editor"))
     	        	.then(editor=>{
     	             	editor.setData($('#mate_cont').val());
     	            })
     	            .catch((error) => {
     	                console.error(error);
     	            });
     	   
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
        			var jdata = JSON.parse(data);
        			for(let i of jdata) {
        				$('.list').replaceWith('<input type="text" name="ptplist" value=""><br>');
        				var idx = $('input[name="ptplist"]').index(this);
        				$('input[name=ptplist]').eq(idx).val(i.user_id);
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
			 
			 	var uid = '<%=(String)session.getAttribute("id")%>';
			  	if($('#user_id').val()==uid){
  				 	$('#delete2').show();
  				 	$('#update2').show();
  			  	}else{
  					 $('#delete2').hide();
  				 	$('#update2').hide();
  			  	}
	           
 	          	ClassicEditor.create(document.querySelector("#editor2"))
 	            	.then(editor=>{
 	                	editor.setData($('#group_cont').val());
 	                })
 	                .catch((error) => {
 	                	console.error(error);
 	                });
			 
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
	   
   //???????????? ????????? ????????? ??? +1, ptp???????????? ???????????? ?????? ajax
	$('.ptp').click(function(){
		$.ajax({
	    	type:"post",
	        dataType:"text",
	        async:false,
	        url:"${pageContext.request.contextPath}/Like",
	        data:{"no":$('#ptp').val()},
	        success: function(data, textStatus){
	        	if(data=='false') {
	        		alert("????????? ?????????????????????.");
	        	} else{
	        		alert("????????? ?????????????????????.");
	        	}
	        },
	        error:function(data, textStatus){
	        	alert("??????");
	        }
        });
	});
		
	//??????????????? ?????? 
 	$('.delete').click(function(){
		$.ajax({
	        type:"post",
	        dataType:"text",
	        async:false,
	        url:"${pageContext.request.contextPath}/deletemate",
	        data:{"no":$('#ptp').val()},
	        success: function(data, textStatus){
	        	alert("??????????????? ?????????????????????.");
	        },
	        error:function(data, textStatus){
	        	alert("??????");
	        }
     	});
	}); 
	
	//?????????????????? ??????
	$('.delete2').click(function(){
		$.ajax({
	        type:"post",
	        dataType:"text",
	        async:false,
	        url:"${pageContext.request.contextPath}/deletegroup",
	        data:{"no":$('#ptp').val()},
	        success: function(data, textStatus){
	        	alert("??????????????? ?????????????????????.");
	        },
	        error:function(data, textStatus){
	        	alert("??????");
	        }
    	});
	});
	
    </script>
	<%@include file="fotter.jsp"%>
</body>
</html>