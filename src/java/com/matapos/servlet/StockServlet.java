/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.matapos.servlet;

import com.matapos.parameter.StaticParameter;
import com.bo.parameter.FieldParameterMatapos;
import com.freemium.function.JsonProcess;
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
public class StockServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(StockServlet.class);

    public StockServlet() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HashMap req = new HashMap();
        MessageProcess mp = new MessageProcessImpl();
        HTTPProcessImpl ht = new HTTPProcessImpl();
        try {
            String json = request.getParameter("data");
            HashMap newJson = JsonProcess.decodeJson(json);
            String brand_id = newJson.get("brand_id").toString();
            String outlet_id = newJson.get("outlet_id").toString();
            String user_id = newJson.get("user_id").toString();

            req.put("procCode", "43");
            if (outlet_id.equals("") || outlet_id.equals("All Outlet")) {
                req.put("fullid", brand_id + "01");
                req.put("status", "all");
            } else {
                req.put("fullid", brand_id + outlet_id.substring(16));
                req.put("status", "-");
            }
            req.put("userlogin", user_id);
            String reqMsg = mp.encryptMessage(req);
            String responseWeb = ht.sendHttpRequest(StaticParameter.urlbackendserverUAT, reqMsg);
            HashMap resp = mp.decryptMessage(responseWeb);
            if (resp.get(FieldParameterMatapos.resp_code).toString().equals("0000")) {
                String ld = resp.get("list").toString();
                if ("".equals(ld)) {
                    List listJson = new ArrayList();
                    HashMap data1 = new HashMap();
                    String JA[] = ld.split(";");
                    for (int i = 0; i < JA.length; i++) {
                        HashMap data2 = new HashMap();
                        String AO[] = JA[i].split("\\|");
                        data2.put("id_receive", "");
                        data2.put("date", "");
                        data2.put("productcode", "");
                        data2.put("qty", "");
                        data2.put("buy_price", "");
                        data2.put("total_cost", "");
                        data2.put("pic", "");
                        data2.put("supplier_name", "");
                        data2.put("status", "");
                        data2.put("status_return", "");
                        data2.put("product_name", "");
                        data2.put("supplier_name", "");
                        data2.put("outlet_id", "");
                        listJson.add(data2);
                    }
                    data1.put("datapo", listJson);
                    data1.put("resp_code", resp.get(FieldParameterMatapos.resp_code));
                    String Kampret = JsonProcess.generateJson(data1);
                    HashMap hh = JsonProcess.decodeJson(Kampret);
                    response.setContentType("application/json");
                    response.getWriter().print(hh);
                } else {
                    List listJson = new ArrayList();
                    HashMap data1 = new HashMap();
                    String JA[] = ld.split(";");
                    for (int i = 0; i < JA.length; i++) {
                        HashMap data2 = new HashMap();
                        String AO[] = JA[i].split("\\|");
                        data2.put("id_receive", AO[0]);
                        data2.put("date", AO[1]);
                        data2.put("productcode", AO[2]);
                        data2.put("qty", AO[3]);
                        data2.put("buy_price", AO[4]);
                        data2.put("total_cost", AO[5]);
                        data2.put("pic", AO[6]);
                        data2.put("supplier_name", AO[7]);
                        data2.put("status", AO[8]);
                        data2.put("status_return", AO[9]);
                        data2.put("product_name", AO[10]);
                        data2.put("supplier_name", AO[11]);
                        data2.put("outlet_id", AO[12]);
                        listJson.add(data2);
                        data2 = null;
                    }
                    data1.put("datapo", listJson);
                    data1.put("resp_code", resp.get(FieldParameterMatapos.resp_code));
                    String Kampret = JsonProcess.generateJson(data1);
                    HashMap hh = JsonProcess.decodeJson(Kampret);
                    response.setContentType("application/json");
                    response.getWriter().print(hh);
                    data1 = null;
                    listJson = null;
                }
            } else {
                response.setContentType("application/json");
                response.getWriter().print("eror");
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
