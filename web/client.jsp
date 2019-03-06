<%--
  Created by IntelliJ IDEA.
  User: jongho.shin
  Date: 2019-03-05
  Time: 오후 1:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript">
        var webSocket = new WebSocket("ws://localhost:8080/ws/ami");
        var station = "3200";

        webSocket.onopen = function (message) {
            console.log("WebSocket Server Connected...");
        }

        webSocket.onclose = function (message) {
            console.log("WebSocket server closed...");
        }

        webSocket.onerror = function (message) {
            console.log("WebSocket Error");
        }

        webSocket.onmessage = function (msg) {
            console.log("message : " + msg.data);
            receiveMsgBox(msg.data);
        }

        function sendMessage(msg) {
            /*var ele = document.getElementById("id_MsgForm");
            var msg = ele.sendMsgBox.value;
            console.log("sendMessage : " + msg);*/

            webSocket.send(msg);
        }

        function receiveMsgBox(msg) {
            var rm = document.nmMsgForm;
            rm.receiveMsgBox.value = msg;
        }

        function loginCTI(){
            console.log("------loginCTI() Start-------");
            sendMessage("login:"+ station);
        }

        function logoutCTI() {
            console.log("------loginCTI() Start-------");
            sendMessage("logout:" + station);
        }
    </script>

    <title>Title</title>
</head>
<body>
<form id="id_MsgForm" name="nmMsgForm" action="">
    <input type="button" name="loginCtiBtn" onclick="loginCTI()" value="CTI LOGIN"><br>
    <input type="button" name="logoutCtiBtn" onclick="logoutCTI()" value="CTI LOGOUT"><br>
    <br>보낼 메시지 : <input type="text" name="sendMsgBox" value="">
    <input type="button" name="sendMsgBtn" value="Send" onclick="javascript:sendMessage()">
    <br>수신 메시지 : <input type="text" name="receiveMsgBox" value="">
</form>
</body>
</html>
