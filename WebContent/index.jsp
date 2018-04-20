<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
%>
<!DOCTYPE html>
<html>
<head>

<link rel="icon" type="image/x-icon" href="img/favicon.ico"media="screen" />
    <meta  charset="utf-8">
    <title> 人工智能机器人</title>
    <style type="text/css">
        *{margin:0;padding:0;}
        html,body{width:100%;height:100%;}
        body{background: url(img/bg.jpg) no-repeat center;
        
        }
        /*titlestart*/
        #title{width:100%;height:60px;background: rgba(0, 0, 0, 0.20);
        font-size:24px;color:#fff;text-align:center;line-height:40px;
        }
        /*titleend*/
        /*centerstart*/
        .center {
            width: 800px;
            height: 600px;
            margin-left: 250px;
            background: rgba(255, 255, 255, .2);
            
        }
        

        .center .c_head{width:100%;height:60px;background: #2196F3;}
        .center .c_center{width:780px; height:440px;padding:10px;overflow:auto; }
        .center .c_foot{width:100%;height:80px;}

            .center .c_center .rot {width: 100%;overflow:hidden;}
                .center .c_center .rot span {
                    display:block;
                    width: 40px;
                    height: 40px;
                    background: url(img/rot.png);
                    float:left;
                    
                }
                  .center .c_center .rot p{
                  	max-width:220px;
                  	float:left;
                  	margin-left:10px;
                  	padding: 10px;
                  	background:rgba(0, 0, 255, .5);
                  	border-radius:8px;
      
                  }
                  .center .c_center .my {width: 100%;overflow:hidden;}
                .center .c_center .my span {
                    display:block;
                    width: 40px;
                    height: 40px;
                    background: url(img/my.png);
                    float:right;
                    
                }
                  .center .c_center .my p{
                  	max-width:220px;
                  	float:right;
                  	margin-right:10px;
                  	padding: 10px;
                  	background:#19b955;
                  	border-radius:8px;
      
                  }
                    #text {
                        width: 640px;
                        height: 60px;
                        outline: none;
                        text-indent: 20px;
                        font-size: 18px;
                        background: rgba(0, 0, 0, .4);
                        border: none;
                        outline:none;
                        color: #fff;
                        border-radius: 10px;
                        margin: 10px;
                    }
        #btn {
            width: 100px;
            height: 60px;
            border: none;
            outline:none;
            color: #fff;
            background: rgba(0, 0, 0, .4);
            border-radius: 10px;
        }
        /*centerend*/
    </style>
</head>
<body>
    <!--title start-->
    <div id="title">
                                   人工智能机器人对话
    </div>
    <!--title end-->
    <!--center start-->
    <div class="center">
        <div class="c_head"></div>
        <div class="c_center">
            <div class="rot">
            
            
            </div>
            <div class="my">
            	
                
            
            </div>
        </div>
        <div class="c_foot">
            <input type="text" id="text" />
            <input type="button" id="btn" value="发送"/>
        </div>
    </div>
    <!--center end-->
    
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">
    	$("#btn").click(function(){
    		//获取输入框的内容
    		var text=$("#text").val();
    		//传递到后台
    		if(text==""||text==null){
    			return;
    		}
    		else{
    			var myobj ="<div class='my'><span></span><p>"+text+"</p></div>";
				$(".c_center").append(myobj);   //添加HTML代码
				$("#text").val("");   //输入框赋空值
				$("#text").focus();   //使输入框成为焦点
				$(".c_center").scrollTop(99999999999999); //使页面向下滚动
    			$.ajax({
        			//传递的地址
        			url: "chart",
        			//传递的方式
        			type: "post",
        			//传递的参数 "text"为名字，text为值
        			data: {"text":text},
        			//传递返回的结果
        			success: function(answer){
        				
        				var obj ="<div class='rot'><span></span><p>"+answer+"</p></div>";
        				$(".c_center").append(obj);
        				$(".c_center").scrollTop(99999999999999);
        			}
        		});
    		}
    	});
    	
    	$(document).keydown(function(event){
    		if(event.keyCode==13){   //按下回车
    			$("#btn").click();	
    		}	
    	})
    </script>
</body>
</html>