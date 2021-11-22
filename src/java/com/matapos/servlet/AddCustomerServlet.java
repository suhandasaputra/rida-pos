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
//import static com.bo.parameter.FieldParameterMatapos.productname;
import com.bo.parameter.ProcessingCode;
import com.matapos.parameter.StaticParameter;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet to handle File upload request from Client
 *
 * @author suhanda
 */
public class AddCustomerServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(AddCustomerServlet.class);

    public AddCustomerServlet() {
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
        SendHttpProcess http = new SendHttpProcess();

        try {
            String json = "";
            json = br.readLine();
            HashMap newJson = JsonProcess.decodeJson(json);

            String brand_id = newJson.get("brand_id").toString();
            String outlet_id = newJson.get("outlet_id").toString();
            String customer_name = newJson.get("customer_name").toString();
            String customer_email = newJson.get("customer_email").toString();
            String customer_phone = newJson.get("customer_phone").toString();
            String customer_address = newJson.get("customer_address").toString();

            req.put(FieldParameterMatapos.proccode, ProcessingCode.addcustomer);
            req.put(FieldParameterMatapos.brand_id, brand_id);
            req.put(FieldParameterMatapos.outlet_id, outlet_id.substring(16));
            req.put(FieldParameterMatapos.customer_name, customer_name);
            req.put(FieldParameterMatapos.customer_email, customer_email);
            req.put(FieldParameterMatapos.customer_phone, customer_phone);
            req.put(FieldParameterMatapos.customer_address, customer_address);

            String reqMsg = mp.encryptMessage(req);
            String responseWeb = http.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
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
            http = null;
        }

    }
}
