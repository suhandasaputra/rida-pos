/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.matapos.servlet;

import com.bo.function.JsonProcess;
import com.matapos.parameter.StaticParameter;
import com.bo.parameter.FieldParameterMatapos;
import com.freemium.function.MessageProcess;
import com.freemium.function.impl.HTTPProcessImpl;
import com.freemium.function.impl.MessageProcessImpl;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author suhanda
 */
public class DiscountItemServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(DiscountItemServlet.class);

    public DiscountItemServlet() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HashMap req = new HashMap();
        MessageProcess mp = new MessageProcessImpl();
        HTTPProcessImpl ht = new HTTPProcessImpl();
        try {
            String brand_id = request.getParameter("brand_id");
            String outlet_id = request.getParameter("outlet_id");
            String user_id = request.getParameter("user_id");
            String category = request.getParameter("category");

            req.put("procCode", "21");
            req.put("category", category);
            req.put("fullid", brand_id + outlet_id.substring(16));
            req.put("userlogin", user_id);

            String reqMsg = mp.encryptMessage(req);
            String responseWeb = ht.sendHttpRequest(StaticParameter.urlbackendserverUAT, reqMsg);
            HashMap resp = mp.decryptMessage(responseWeb);
            if (resp.get(FieldParameterMatapos.resp_code).toString().equals("0000")) {
                if (resp.get("list").equals("")) {
                    response.setContentType("text/plain;charset=UTF-8");
                    response.getWriter().print("keren");
                } else {
                    HashMap data1 = new HashMap();
                    List listJson = new ArrayList();
                    String ld = resp.get("list").toString();
                    String JA[] = ld.split(";");
                    for (int i = 0; i < JA.length; i++) {
                        String AO[] = JA[i].split("\\|");
                        HashMap data2 = new HashMap();
                        data2.put("productcode", AO[0]);
                        data2.put("productname", AO[2]);
                        data2.put("img_url", AO[1]);
                        listJson.add(data2);
                        data2 = null;
                    }
                    data1.put("DATA", listJson);
                    String Kampret = JsonProcess.generateJson(data1);
                    HashMap hh = JsonProcess.decodeJson(Kampret);
                    response.setContentType("application/json");
                    response.getWriter().print(hh.get("DATA"));
                    data1 = null;
                    listJson = null;
                }
            } else {
                response.setContentType("text/plain;charset=UTF-8");
                response.getWriter().print("error");
            }
        } catch (Exception e) {
            System.out.println("error : " + e);
            response.setContentType("application/json");
            response.getWriter().print("error");
        } finally {
            req = null;
            mp = null;
            ht = null;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        BufferedReader in = new BufferedReader(new InputStreamReader(request.getInputStream()));
//        String data = "";
//        String line = "";
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
//            HTTPProcessImpl ht = new HTTPProcessImpl();
//
//            HttpSession session = request.getSession(true);
//
//            req.put(FieldParameterMatapos.proccode, ProcessingCode.changestatusreceive);
//            req.put(FieldParameterMatapos.brand_id, session.getAttribute("brand_id"));
//            req.put(FieldParameterMatapos.productcode, productcode);
//            String reqMsg = mp.encryptMessage(req);
//            String responseWeb = ht.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
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
//            HTTPProcessImpl ht = new HTTPProcessImpl();
//            HttpSession session = request.getSession(true);
//
//            req.put(FieldParameterMatapos.proccode, ProcessingCode.changestatusavailable);
//            req.put(FieldParameterMatapos.brand_id, session.getAttribute("brand_id"));
//            req.put(FieldParameterMatapos.productcode, productcode);
//            String reqMsg = mp.encryptMessage(req);
//            String responseWeb = ht.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
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
