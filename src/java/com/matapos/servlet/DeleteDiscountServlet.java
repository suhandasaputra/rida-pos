/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.matapos.servlet;

import com.freemium.function.JsonProcess;
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
public class DeleteDiscountServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(DeleteDiscountServlet.class);

    public DeleteDiscountServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(request.getInputStream()));
        HashMap req = new HashMap();
        MessageProcess mp = new MessageProcessImpl();
        HTTPProcessImpl ht = new HTTPProcessImpl();

        try {
            String data = "";
            String line = "";
            while ((line = in.readLine()) != null) {
                data += line;
            }
            HashMap gg = JsonProcess.decodeJson(data);
            String brand_id = gg.get("brand_id").toString();
            String outlet_id = gg.get("outlet_id").toString();
            String user_id = gg.get("user_id").toString();
            String discount_id = gg.get("discount_id").toString();

            req.put("procCode", "54");
            req.put("fullid", brand_id + outlet_id.substring(16));
            req.put("userlogin", user_id);
            req.put("discount_id", discount_id);
            String reqMsg = mp.encryptMessage(req);
            String responseWeb = ht.sendHttpRequest(StaticParameter.urlbackendserverUAT, reqMsg);
            HashMap resp = mp.decryptMessage(responseWeb);
//        session.removeAttribute("edit_discount_id");
//        session.removeAttribute("edit_discount_name");
//        session.removeAttribute("edit_discount_value");
//        session.removeAttribute("edit_discount_startdate");
//        session.removeAttribute("edit_discount_enddate");
//        session.removeAttribute("edit_discount_outlet_id");
//        session.removeAttribute("edit_discount_keterangan");
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
            in = null;
        }
    }
}
