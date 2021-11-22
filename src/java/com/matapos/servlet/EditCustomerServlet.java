/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.matapos.servlet;

import com.bo.function.JsonProcess;
import com.bo.function.MessageProcess;
import com.bo.function.SendHttpProcess;
import com.bo.function.impl.MessageProcessImpl;
import com.bo.parameter.FieldParameterMatapos;
import com.bo.parameter.ProcessingCode;
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
public class EditCustomerServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(EditCustomerServlet.class);

    public EditCustomerServlet() {
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
        SendHttpProcess http = new SendHttpProcess();
        try {
            String data = "";
            String line = "";
            while ((line = in.readLine()) != null) {
                data += line;
            }
            HashMap gg = JsonProcess.decodeJson(data);
            String brand_id = gg.get("brand_id").toString();
            String customer_outlet_edit = gg.get("customer_outlet_edit").toString();
            String customer_name_edit = gg.get("customer_name_edit").toString();
            String customer_email_edit = gg.get("customer_email_edit").toString();
            String customer_phone_edit = gg.get("customer_phone_edit").toString();
            String customer_address_edit = gg.get("customer_address_edit").toString();

            req.put(FieldParameterMatapos.proccode, ProcessingCode.edit_customer);
            req.put(FieldParameterMatapos.brand_id, brand_id);
            req.put(FieldParameterMatapos.outlet_id, customer_outlet_edit);
            req.put(FieldParameterMatapos.customer_name, customer_name_edit);
            req.put(FieldParameterMatapos.customer_phone, customer_phone_edit);
            req.put(FieldParameterMatapos.customer_email, customer_email_edit);
            req.put(FieldParameterMatapos.customer_address, customer_address_edit);

            String reqMsg = mp.encryptMessage(req);
            String responseWeb = http.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
            HashMap resp = mp.decryptMessage(responseWeb);
            response.getWriter().print(resp);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
        } catch (Exception e) {
            System.out.println("error : " + e);
            response.setContentType("application/json");
            response.getWriter().print("error");
        } finally {
            req = null;
            mp = null;
            http = null;
            in = null;
        }
    }
}
