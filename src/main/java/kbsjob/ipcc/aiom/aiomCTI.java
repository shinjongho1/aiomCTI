package kbsjob.ipcc.aiom;

import javax.websocket.OnOpen;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnError;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.Session;

import java.io.IOException;

@ServerEndpoint("/ws/ami")
public class aiomCTI {

    public void aiomCTI() {
        System.out.println("--------------Start--------------");
    }

    @OnOpen
    public void handleOpen(Session session) {
        System.out.println("client is now connected...: " + session.getId());


    }

    @OnClose
    public void handleClose(Session session) {
        System.out.println("client is now closed....: " + session.getId());
    }

    @OnError
    public void handleError(Throwable t) {
        t.printStackTrace();
    }

    @OnMessage
    public void handleMessage(String getMessage, Session getSession) {
        System.out.println("statement  :" + getMessage);

        String[] getBody = null;
        getBody = getMessage.split(":");

        switch (getBody[0]) {
            case "login":
                loginAMI(getBody[1], getSession);
                break;
            case "logout":
                logoutAMI(getBody[1], getSession);
                break;
        }
    }

    private void loginAMI(String station, Session se) {
//        Login 기능 구현
        System.out.println("staion : " + station);
        sendToClient(station + "aa", se);
    }

    private void logoutAMI(String msg, Session se) {
//        Logout 기능 구현
        System.out.println("msg : " + msg);
        sendToClient("logout Sucesse", se);
    }

    private void sendToClient(String msg, Session se) {
        System.out.println("Session ID :" + se.getId());
        System.out.println("Server ==> client :" + msg);
        try {
            se.getBasicRemote().sendText(msg);
        } catch (IOException e) {

        }
    }

}


