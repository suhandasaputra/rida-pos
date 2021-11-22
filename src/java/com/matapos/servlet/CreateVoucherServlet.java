/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.matapos.servlet;

import com.bo.function.JsonProcess;
import com.bo.parameter.FieldParameterMatapos;
import com.freemium.function.MessageProcess;
import com.freemium.function.impl.HTTPProcessImpl;
import com.freemium.function.impl.MessageProcessImpl;
import com.matapos.parameter.StaticParameter;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet to handle File upload request from Client
 *
 * @author suhanda
 */
public class CreateVoucherServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(CreateVoucherServlet.class);

    public CreateVoucherServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
        HashMap req = new HashMap();
        MessageProcess mp = new MessageProcessImpl();
        HTTPProcessImpl ht = new HTTPProcessImpl();

        try {
            String json = "";
            json = br.readLine();
            HashMap newJson = JsonProcess.decodeJson(json);

            String brand_id = newJson.get("brand_id").toString();
            String user_id = newJson.get("user_id").toString();

            String voucher_name = newJson.get("voucher_name").toString();
            String voucher_code = newJson.get("voucher_code").toString();
            String voucher_value = newJson.get("voucher_value").toString();
            String voucher_limit = newJson.get("voucher_limit").toString();
            String voucher_date_from = newJson.get("voucher_date_from").toString();
            String voucher_date_to = newJson.get("voucher_date_to").toString();

            req.put("procCode", "58");
            req.put(FieldParameterMatapos.brand_id, brand_id);
            req.put("fullid", brand_id + "01");
            req.put("value", voucher_value);
            req.put("startdate", voucher_date_from.replace("-", "") + "000000");
            req.put("enddate", voucher_date_to.replace("-", "") + "235959");
            req.put("vouchername", voucher_name);
            req.put("vouchercode", voucher_code);
            req.put("voucherlimit", voucher_limit);
            req.put("userlogin", user_id);

            String reqMsg = mp.encryptMessage(req);
            String responseWeb = ht.sendHttpRequest(StaticParameter.urlbackendserverUAT, reqMsg);
            HashMap resp = mp.decryptMessage(responseWeb);
            response.setContentType("application/json");
            response.getWriter().print(resp);
        } catch (Exception e) {
            System.out.println("error : " + e);
            response.setContentType("application/json");
            response.getWriter().print("error");
        } finally {
            br = null;
            req = null;
            mp = null;
            ht = null;
        }
    }
}
