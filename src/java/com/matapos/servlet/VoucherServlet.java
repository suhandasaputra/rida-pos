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
public class VoucherServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(VoucherServlet.class);

    public VoucherServlet() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HashMap req = new HashMap();
        MessageProcess mp = new MessageProcessImpl();
        HTTPProcessImpl ht = new HTTPProcessImpl();

        try {
            String json = request.getParameter("data");
            HashMap newJson = JsonProcess.decodeJson(json);
            String brand_id = newJson.get("brand_id").toString();
            String user_id = newJson.get("user_id").toString();

            req.put("procCode", "60");
            req.put("fullid", brand_id + "01");
            req.put("userlogin", user_id);

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

                    data2.put("voucher_id", "");
                    data2.put("voucher_name", "");
                    data2.put("value", "");
                    data2.put("limit", "");
                    data2.put("limit_used", "");
                    data2.put("startdate", "");
                    data2.put("enddate", "");
                    data2.put("outlet_name", "");
                    data2.put("creator", "");
                    data2.put("status_exp", "");
                    data2.put("voucher_code", "");
                    data2.put("status", "");
                    listJson.add(data2);
                    data1.put("datavocher", listJson);
                    data1.put("resp_code", resp.get(FieldParameterMatapos.resp_code));
                    String Kampret = JsonProcess.generateJson(data1);
                    HashMap hh = JsonProcess.decodeJson(Kampret);
                    response.setContentType("application/json");
                    response.getWriter().print(hh);
                    listJson = null;
                    data1 = null;
                    data2 = null;
                } else {
                    HashMap data1 = new HashMap();
                    List listJson = new ArrayList();
                    String JA[] = ld.split(";");
                    for (int i = 0; i < JA.length; i++) {
                        String AO[] = JA[i].split("\\|");
                        HashMap data2 = new HashMap();
                        data2.put("voucher_id", AO[0]);
                        data2.put("voucher_name", AO[1]);
                        data2.put("value", AO[2]);
                        data2.put("limit", AO[4] + "/" + AO[3]);
                        data2.put("limit_used", AO[4]);
                        data2.put("startdate", AO[5].substring(0, 10).replace("-", "/") + "-" + AO[6].substring(0, 10).replace("-", "/"));
                        data2.put("enddate", AO[6]);
                        data2.put("outlet_name", AO[7]);
                        data2.put("creator", AO[8]);
                        data2.put("status_exp", AO[9]);
                        data2.put("voucher_code", AO[10]);
                        data2.put("status", AO[11]);
                        listJson.add(data2);
                        data2 = null;

                    }
                    data1.put("datavocher", listJson);
                    data1.put("resp_code", resp.get(FieldParameterMatapos.resp_code));
                    String Kampret = JsonProcess.generateJson(data1);
                    HashMap hh = JsonProcess.decodeJson(Kampret);
                    response.setContentType("application/json");
                    response.getWriter().print(hh);
                    listJson = null;
                    data1 = null;
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
