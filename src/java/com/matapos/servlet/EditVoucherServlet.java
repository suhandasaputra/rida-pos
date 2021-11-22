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
public class EditVoucherServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(EditVoucherServlet.class);
    private static String UPDATE = "edit_voucher.jsp";

    public EditVoucherServlet() {
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
            String id = newJson.get("id_voucher").toString();
            String user_id = newJson.get("user_id").toString();

            req.put("procCode", "59");
            req.put("fullid", brand_id + "01");
            req.put("userlogin", user_id);
            req.put("voucherid", id);

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

            String edit_voucher_id = newJson.get("edit_voucher_id").toString();
            String edit_voucher_name = newJson.get("edit_voucher_name").toString();
            String edit_voucher_code = newJson.get("edit_voucher_code").toString();
            String edit_voucher_value = newJson.get("edit_voucher_value").toString();
            String edit_voucher_limit = newJson.get("edit_voucher_limit").toString();
            String edit_voucher_date_from = newJson.get("edit_voucher_date_from").toString();
            String edit_voucher_date_to = newJson.get("edit_voucher_date_to").toString();

            req.put("procCode", "62");
            req.put("brand_id", brand_id);
            req.put("value", edit_voucher_value);
            req.put("startdate", edit_voucher_date_from.replace("-", "") + "000000");
            req.put("enddate", edit_voucher_date_to.replace("-", "") + "235959");
            req.put("vouchername", edit_voucher_name);
            req.put("vouchercode", edit_voucher_code.toUpperCase());
            req.put("voucherlimit", edit_voucher_limit);
            req.put("voucherid", edit_voucher_id);
            req.put("status", "1");
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
