/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.matapos.servlet;

import com.bo.function.MessageProcess;
import com.bo.function.SendHttpProcess;
import com.bo.function.impl.MessageProcessImpl;
import com.bo.parameter.FieldParameterMatapos;
import com.bo.parameter.ProcessingCode;
import com.freemium.function.JsonProcess;
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
public class DeleteItemServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(DeleteItemServlet.class);

    public DeleteItemServlet() {
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
            String outlet_id = gg.get("outlet_id_edit_item").toString();
            String product_code = gg.get("item_product_code_edit").toString();

            req.put(FieldParameterMatapos.proccode, ProcessingCode.delete_item);
            req.put(FieldParameterMatapos.brand_id, brand_id);
            req.put(FieldParameterMatapos.outlet_id, outlet_id);
            req.put(FieldParameterMatapos.product_code, product_code);

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
