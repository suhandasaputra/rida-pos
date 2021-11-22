/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.matapos.servlet;

import com.bo.function.JsonProcess;
import com.freemium.function.impl.MessageProcessImpl;
import com.freemium.function.MessageProcess;
import com.freemium.function.impl.HTTPProcessImpl;
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
public class EditDiscountServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(EditDiscountServlet.class);

    public EditDiscountServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HashMap req = new HashMap();
        MessageProcess mp = new MessageProcessImpl();
        HTTPProcessImpl ht = new HTTPProcessImpl();

        try {
            String json = request.getParameter("data");
            HashMap newJson = JsonProcess.decodeJson(json);
            String brand_id = newJson.get("brand_id").toString();
            String id = newJson.get("id").toString();
            String user_id = newJson.get("user_id").toString();
            String outlet_id = newJson.get("outlet_id").toString();

            req.put("procCode", "53");
            req.put("fullid", brand_id + outlet_id.substring(16));
            req.put("userlogin", user_id);
            req.put("discount_id", id);

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
            req = null;
            mp = null;
            ht = null;
        }
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

            String edit_discount_id = newJson.get("edit_discount_id").toString();
            String edit_discount_name = newJson.get("edit_discount_name").toString();
            String edit_discount_value = newJson.get("edit_discount_value").toString();
            String edit_discount_date_from = newJson.get("edit_discount_date_from").toString();
            String edit_discount_date_to = newJson.get("edit_discount_date_to").toString();
            String edit_send_outlet = newJson.get("edit_send_outlet").toString();
            String edit_discount_keterangan = newJson.get("edit_discount_keterangan").toString();

            req.put("procCode", "56");
            req.put("brand_id", brand_id);
            req.put("outlet_id", edit_send_outlet.replace("|", ","));
            req.put("product_code", edit_discount_keterangan.replace("|", ","));
            req.put("discount", edit_discount_value);
            req.put("startdate", edit_discount_date_from.replace("-", "") + "000000");
            req.put("enddate", edit_discount_date_to.replace("-", "") + "235959");
            req.put("status", "1");
            req.put("discount_id", edit_discount_id);
            req.put("discount_name", edit_discount_name);
            req.put("userlogin", user_id);

            String reqMsg = mp.encryptMessage(req);
            String responseWeb = ht.sendHttpRequest(StaticParameter.urlbackendserverUAT, reqMsg);
            HashMap resp = mp.decryptMessage(responseWeb);
            response.getWriter().print(resp);
            response.setContentType("application/json");
        } catch (Exception e) {
            System.out.println("error : " + e);
            response.setContentType("application/json");
            response.getWriter().print("error");
        } finally {
            req = null;
            mp = null;
            ht = null;
            br = null;
        }
    }
}
