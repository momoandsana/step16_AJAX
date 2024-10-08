<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

    <script type="text/javascript">
        $(function(){
            $("#ajaxBtn").click(function(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/ajax?key=text", //통신할 서버 주소
                    type:"post", //요청방식(get,post,put,delete,fetch) put & fetch 모두 업데이트지만 put 은 전체 업데이트, fetch 는 하나만 업데이트
                    dataType:"text", // 서버가 응댑해주는 데이터타입(text,html,xml,json)

                    success:function(result)
                    {
                        console.log(result);
                    },// 성공했을 때 콜백함수

                    error: function(err)
                    {
                        console.log(err);
                    }// 실패했을 때 콜백함수
                });
            });//클릭End

            //////////////////////////////////////
            $("#jsonBtn").click(function(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/ajax?key=json", //통신할 서버 주소
                    type:"post", //요청방식(get,post,put,delete,fetch) put & fetch 모두 업데이트지만 put 은 전체 업데이트, fetch 는 하나만 업데이트
                    dataType:"json", // 서버가 응댑해주는 데이터타입(text,html,xml,json)

                    success:function(result)
                    {
                        console.log(result)

                        let str="";
                        $.each(result,function(index,menu){
                            str+=`<input type='checkbox' value='${"${index}"}'>${"${menu}"}`;
                            // el이 우선순위이기 때문에 jQuery 와 같이 $로 같이 쓰고 싶으면 이렇게 써야 함. was에서 el 먼저 해석
                        });

                        $("#display").html(str);
                    },// 성공했을 때 콜백함수

                    error: function(err)
                    {
                        console.log(err);
                    }// 실패했을 때 콜백함수
                });
            });//클릭End

            ////////////////////////////////////////////////////
            $("#dtoBtn").click(function(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/ajax?key=dto", //통신할 서버 주소
                    type:"post", //요청방식(get,post,put,delete,fetch) put & fetch 모두 업데이트지만 put 은 전체 업데이트, fetch 는 하나만 업데이트
                    dataType:"json", // 서버가 응댑해주는 데이터타입(text,html,xml,json)

                    success:function(result)
                    {
                        console.log(result)

                        let str=result.id+" | "+result.name+" | "+result.addr;
                        $("#display").html(str);

                    },// 성공했을 때 콜백함수

                    error: function(err)
                    {
                        console.log(err);
                    }// 실패했을 때 콜백함수
                });
            });//클릭End
            //////////////////////////////////////////////////////
            $("#listBtn").click(function(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/ajax?key=list", //통신할 서버 주소
                    type:"post", //요청방식(get,post,put,delete,fetch) put & fetch 모두 업데이트지만 put 은 전체 업데이트, fetch 는 하나만 업데이트
                    dataType:"json", // 서버가 응댑해주는 데이터타입(text,html,xml,json)

                    success:function(result)
                    {
                        console.log(result)

                    },// 성공했을 때 콜백함수

                    error: function(err)
                    {
                        console.log(err);
                    }// 실패했을 때 콜백함수
                });
            });//클릭End

            //////////////////////////////////////

            $("#mapBtn").click(function(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/ajax?key=map", //통신할 서버 주소
                    type:"post", //요청방식(get,post,put,delete,fetch) put & fetch 모두 업데이트지만 put 은 전체 업데이트, fetch 는 하나만 업데이트
                    dataType:"json", // 서버가 응댑해주는 데이터타입(text,html,xml,json)

                    success:function(result)
                    {
                        console.log(result);
                        $.each(result.memberList,function(index,member){
                            console.log(member.name);

                        })

                    },// 성공했을 때 콜백함수

                    error: function(err)
                    {
                        console.log(err);
                    }// 실패했을 때 콜백함수
                });
            });//클릭End
            ///////////////////////////////////////////
            $("#textJsonBtn").click(function(){
                $.ajax({
                    url:"${pageContext.request.contextPath}/ajax?key=json", //통신할 서버 주소
                    type:"post", //요청방식(get,post,put,delete,fetch) put & fetch 모두 업데이트지만 put 은 전체 업데이트, fetch 는 하나만 업데이트
                    dataType:"json", // 서버가 응댑해주는 데이터타입(text,html,xml,json)

                    success:function(result)
                    {
                        console.log(result)

                        let str="";
                        $.each(result,function(index,menu){
                            str+=`<input type='checkbox' value='${"${index}"}'>${"${menu}"}`;
                            // el이 우선순위이기 때문에 jQuery 와 같이 $로 같이 쓰고 싶으면 이렇게 써야 함. was에서 el 먼저 해석
                        });

                        $("#display").html(str);
                    },// 성공했을 때 콜백함수

                    error: function(err)
                    {
                        console.log(err);
                    }// 실패했을 때 콜백함수
                });
            });//클릭End

        })// readyEnd

    </script>
</head>
<body>

<input type="button" value="text결과" id="ajaxBtn">
<input type="button" value="json결과" id="jsonBtn">

<input type="button" value="DTO결과" id="dtoBtn">
<input type="button" value="List결과" id="listBtn">
<input type="button" value="Map결과" id="mapBtn">

<input type="button" value="textJson결과" id="textJsonBtn">

<hr>
<div id="display"></div>

</body>
</html>
