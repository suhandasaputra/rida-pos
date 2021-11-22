/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.matapos.servlet;

import com.matapos.parameter.StaticParameter;
import com.bo.function.MessageProcess;
import com.bo.function.SendHttpProcess;
import com.bo.function.impl.MessageProcessImpl;
import com.bo.parameter.FieldParameterMatapos;
import com.bo.parameter.ProcessingCode;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author suhanda
 */
public class OptionServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(OptionServlet.class);

    public OptionServlet() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HashMap req = new HashMap();
        HashMap resp = new HashMap();
        MessageProcess mp = new MessageProcessImpl();
        SendHttpProcess http = new SendHttpProcess();
        try {
            String action = request.getParameter("action");
            if (action.equalsIgnoreCase("option_category")) {
                req.put(FieldParameterMatapos.proccode, ProcessingCode.getoptioncategory);
                req.put(FieldParameterMatapos.brand_id, request.getParameter("brand_id"));
                String outlet_id = request.getParameter("outlet_id");
                if (outlet_id.length() > 2) {
                    req.put(FieldParameterMatapos.outlet_id, outlet_id.substring(16));
                } else {
                    req.put(FieldParameterMatapos.outlet_id, outlet_id);
                }
                String reqMsg = mp.encryptMessage(req);
                String responseWeb = http.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
                resp = mp.decryptMessage(responseWeb);
                response.setContentType("text/plain");
                response.getWriter().print(resp.get(FieldParameterMatapos.listcategoryname));
            } else if (action.equalsIgnoreCase("option_outlet")) {
                req.put(FieldParameterMatapos.proccode, ProcessingCode.getoptionoutlet);
                req.put(FieldParameterMatapos.brand_id, request.getParameter("brand_id"));
                req.put(FieldParameterMatapos.userlevel, request.getParameter("userlevel"));
                req.put(FieldParameterMatapos.outlet_id, request.getParameter("outlet_store"));
                String reqMsg = mp.encryptMessage(req);
                String responseWeb = http.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
                resp = mp.decryptMessage(responseWeb);
                response.setContentType("text/plain");
                response.getWriter().print(resp.get(FieldParameterMatapos.listoutlet));
            } else if (action.equalsIgnoreCase("option_supplier")) {
                req.put(FieldParameterMatapos.proccode, ProcessingCode.getoptionsupplier);
                req.put(FieldParameterMatapos.brand_id, request.getParameter("brand_id"));
                String reqMsg = mp.encryptMessage(req);
                String responseWeb = http.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
                resp = mp.decryptMessage(responseWeb);
                response.setContentType("text/plain");
                response.getWriter().print(resp.get(FieldParameterMatapos.listsupplier));
            } else if (action.equalsIgnoreCase("option_business")) {
                req.put(FieldParameterMatapos.proccode, ProcessingCode.getoptionbusiness);
                String reqMsg = mp.encryptMessage(req);
                String responseWeb = http.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
                resp = mp.decryptMessage(responseWeb);
                response.setContentType("text/plain");
                response.getWriter().print(resp.get(FieldParameterMatapos.listbusiness));
            }  else if (action.equalsIgnoreCase("option_brand")) {
                req.put(FieldParameterMatapos.proccode, ProcessingCode.getoptionbrand);
                String reqMsg = mp.encryptMessage(req);
                String responseWeb = http.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
                resp = mp.decryptMessage(responseWeb);
                response.setContentType("text/plain");
                response.getWriter().print(resp.get("listbrand"));
            }
        } catch (Exception e) {
            System.out.println("error : " + e);
            response.setContentType("application/json");
            response.getWriter().print("error");
        } finally {
            req = null;
            resp = null;
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
//        HashMap JsonMap = new HashMap();
//        String jsonObj[] = data.split("&");
//        for (int i = 0; i < jsonObj.length; i++) {
//            String keyJson[] = jsonObj[i].split("=");
//            JsonMap.put(keyJson[0], keyJson[1]);
//        }
//
//        String productcode = JsonMap.get("productcode").toString();
//        String type_nya = JsonMap.get("type_nya").toString();
//
//        if (type_nya.equals("receive_stock")) {
//            HashMap req = new HashMap();
//            MessageProcess mp = new MessageProcessImpl();
//            SendHttpProcess http = new SendHttpProcess();
//            req.put(FieldParameterMatapos.proccode, ProcessingCode.changestatusreceive);
//            req.put(FieldParameterMatapos.brand_id, session.getAttribute("brand_id"));
//            req.put(FieldParameterMatapos.productcode, productcode);
//            String reqMsg = mp.encryptMessage(req);
//            String responseWeb = http.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
//            HashMap resp = mp.decryptMessage(responseWeb);
//            String message;
//            if (resp.get(FieldParameterMatapos.resp_code).toString().equals("0000")) {
//                message = "00";
//            } else {
//                message = "01";
//            }
//            response.setContentType("text/plain");
//            response.getWriter().write(message);
//        } else if (type_nya.equals("available")) {
//            HashMap req = new HashMap();
//            MessageProcess mp = new MessageProcessImpl();
//            SendHttpProcess http = new SendHttpProcess();
//            req.put(FieldParameterMatapos.proccode, ProcessingCode.changestatusavailable);
//            req.put(FieldParameterMatapos.brand_id, session.getAttribute("brand_id"));
//            req.put(FieldParameterMatapos.productcode, productcode);
//            String reqMsg = mp.encryptMessage(req);
//            String responseWeb = http.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
//            HashMap resp = mp.decryptMessage(responseWeb);
//            String message;
//            if (resp.get(FieldParameterMatapos.resp_code).toString().equals("0000")) {
//                message = "00";
//            } else {
//                message = "01";
//            }
//            response.setContentType("text/plain");
//            response.getWriter().write(message);
//        }
    }
}
