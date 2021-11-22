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
import javax.servlet.http.HttpSession;

/**
 * Servlet to handle File upload request from Client
 *
 * @author suhanda
 */
public class CreateDiscountServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(CreateDiscountServlet.class);

    public CreateDiscountServlet() {
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
            String outlet_id = newJson.get("outlet_id").toString();
            String user_id = newJson.get("user_id").toString();

            String discount_name = newJson.get("discount_name").toString();
            String discount_value = newJson.get("discount_value").toString();
            String discount_date_from = newJson.get("discount_date_from").toString();
            String discount_date_to = newJson.get("discount_date_to").toString();
            String discount_keterangan = newJson.get("discount_keterangan").toString();

            req.put("procCode", "35");
            req.put(FieldParameterMatapos.brand_id, brand_id);
            req.put(FieldParameterMatapos.outlet_id, outlet_id);
            req.put(FieldParameterMatapos.discount_name, discount_name);
            req.put("product_code", discount_keterangan.replace("|", ","));
            req.put("discount", discount_value);
            req.put("startdate", discount_date_from.replace("-", "") + "000000");
            req.put("enddate", discount_date_to.replace("-", "") + "235959");
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
