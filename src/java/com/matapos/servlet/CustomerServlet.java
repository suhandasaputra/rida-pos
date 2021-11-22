/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.matapos.servlet;

import com.bo.function.JsonProcess;
import com.matapos.parameter.StaticParameter;
import com.bo.function.MessageProcess;
import com.bo.function.SendHttpProcess;
import com.bo.function.impl.MessageProcessImpl;
import com.bo.parameter.FieldParameterMatapos;
import com.bo.parameter.ProcessingCode;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author suhanda
 */
public class CustomerServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(CustomerServlet.class);

    public CustomerServlet() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HashMap req = new HashMap();
        MessageProcess mp = new MessageProcessImpl();
        SendHttpProcess http = new SendHttpProcess();
        try {
            String json = request.getParameter("data");
            HashMap newJson = JsonProcess.decodeJson(json);
            String brand_id = newJson.get("brand_id").toString();

            req.put(FieldParameterMatapos.proccode, ProcessingCode.getlistcustomer);
            req.put(FieldParameterMatapos.brand_id, brand_id);
            String reqMsg = mp.encryptMessage(req);
            String responseWeb = http.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
            HashMap resp = mp.decryptMessage(responseWeb);
            response.setContentType("application/json");
            response.getWriter().print(resp.get(FieldParameterMatapos.listcustomer));
        } catch (Exception e) {
            System.out.println("error : " + e);
            response.setContentType("application/json");
            response.getWriter().print("error");
        } finally {
            req = null;
            mp = null;
            http = null;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        BufferedReader in = new BufferedReader(new InputStreamReader(request.getInputStream()));
//        String data = "";
//        String line = "";
//
//        while ((line = in.readLine()) != null) {
//            data += line;
//        }
//
//        String gg_data = data.replace("%40", "@");
//
//        HashMap JsonMap = new HashMap();
//        String jsonObj[] = gg_data.split("&");
//        for (int i = 0; i < jsonObj.length; i++) {
//            String keyJson[] = jsonObj[i].split("=");
//            JsonMap.put(keyJson[0], keyJson[1]);
//        }
//
//        String user_id = JsonMap.get("user_id").toString();
//
//        HashMap req = new HashMap();
//        MessageProcess mp = new MessageProcessImpl();
//        SendHttpProcess http = new SendHttpProcess();
//        HttpSession session = request.getSession(true);
//
//        req.put(FieldParameterMatapos.proccode, ProcessingCode.changestatususer);
//        req.put(FieldParameterMatapos.user_id, user_id);
//        String reqMsg = mp.encryptMessage(req);
//        String responseWeb = http.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
//        HashMap resp = mp.decryptMessage(responseWeb);
//        String message;
//        if (resp.get(FieldParameterMatapos.resp_code).toString().equals("0000")) {
//            message = "00";
//        } else {
//            message = "01";
//        }
//        response.setContentType("text/plain");
//        response.getWriter().write(message);
    }
}
