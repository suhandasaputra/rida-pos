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
public class DiscountServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(DiscountServlet.class);

    public DiscountServlet() {
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
            req.put("procCode", "72");
            req.put("userlogin", user_id);
            if (outlet_id.equals("") || outlet_id.equals("All Outlet")) {
                req.put("fullid", brand_id + "01");
                req.put("status", "all");
            } else {
                req.put("fullid", brand_id + outlet_id.substring(16));
                req.put("status", "-");
            }
            String reqMsg = mp.encryptMessage(req);
            String responseWeb = ht.sendHttpRequest(StaticParameter.urlbackendserverUAT, reqMsg);
            HashMap resp = mp.decryptMessage(responseWeb);
            String message;
            if (resp.get(FieldParameterMatapos.resp_code).toString().equals("0000")) {

                String ld = resp.get("list").toString();
                if ("".equals(ld)) {
                    HashMap data1 = new HashMap();
                    List listJson = new ArrayList();
                    HashMap data2 = new HashMap();

                    data2.put("id", "");
                    data2.put("discount_name", "");
                    data2.put("discount_rate", "");
                    data2.put("items", "");
                    data2.put("startdate", "");
                    data2.put("enddate", "");
                    data2.put("outlets", "");
                    data2.put("create_by", "");
                    data2.put("status", "");
                    data2.put("active", "");
                    data2.put("outlet_id", "");
                    listJson.add(data2);
                    data1.put("datadiscount", listJson);
                    data1.put("resp_code", resp.get(FieldParameterMatapos.resp_code));
                    String Kampret = JsonProcess.generateJson(data1);
                    HashMap hh = JsonProcess.decodeJson(Kampret);
                    response.setContentType("application/json");
                    response.getWriter().print(hh);
                    data2 = null;

                    data1 = null;
                    listJson = null;
                } else {
                    HashMap data1 = new HashMap();
                    List listJson = new ArrayList();
                    String JA[] = ld.split(";");
                    for (int i = 0; i < JA.length; i++) {
                        HashMap data2 = new HashMap();
                        String AO[] = JA[i].split("\\|");
                        data2.put("id", AO[0]);
                        data2.put("discount_name", AO[1]);
                        data2.put("discount_rate", AO[2]);
                        data2.put("items", AO[3]);
                        data2.put("startdate", AO[4].substring(0, 10).replace("-", "/") + "-" + AO[5].substring(0, 10).replace("-", "/"));
                        data2.put("enddate", AO[5]);
                        data2.put("outlets", AO[6]);
                        data2.put("create_by", AO[7]);
                        data2.put("status", AO[8]);
                        data2.put("active", AO[9]);
                        data2.put("outlet_id", AO[10]);
                        listJson.add(data2);
                        data2 = null;
                    }
                    data1.put("datadiscount", listJson);
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
    }
}
