/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.matapos.servlet;

import com.bo.function.JsonProcess;
import com.matapos.parameter.StaticParameter;
import com.bo.function.MessageProcess;
import com.bo.function.SendHttpProcess;
import com.bo.function.impl.MessageProcessImpl;
//import com.bo.parameter.FieldParameter;
import com.bo.parameter.FieldParameterMatapos;
import com.bo.parameter.ProcessingCode;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author suhanda
 */
public class ProductServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(ProductServlet.class);

    public ProductServlet() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HashMap req = new HashMap();
        MessageProcess mp = new MessageProcessImpl();
        SendHttpProcess http = new SendHttpProcess();
        try {
            String json = request.getParameter("data");
            HashMap newJson = JsonProcess.decodeJson(json);
            String brand_id = newJson.get("brand_id").toString();
            String outlet_id = newJson.get("outlet_id").toString();
            String userlevel = newJson.get("userlevel").toString();
            req.put(FieldParameterMatapos.proccode, ProcessingCode.getlistcategory);
            req.put(FieldParameterMatapos.brand_id, brand_id);
            req.put(FieldParameterMatapos.outlet_id, outlet_id);
            req.put(FieldParameterMatapos.userlevel, userlevel);
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
            req = null;
            mp = null;
            http = null;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            HashMap JsonMap = JsonProcess.decodeJson(data);
            String brand_id = JsonMap.get("brand_id").toString();
            String outlet_id = JsonMap.get("outlet_id").toString();
            String productcode = JsonMap.get("productcode").toString();
            String type_nya = JsonMap.get("tipe").toString();
            if (type_nya.equals("receive_stock")) {
                req.put(FieldParameterMatapos.proccode, ProcessingCode.changestatusreceive);
                req.put(FieldParameterMatapos.brand_id, brand_id);
                req.put(FieldParameterMatapos.outlet_id, outlet_id);
                req.put(FieldParameterMatapos.productcode, productcode);
                String reqMsg = mp.encryptMessage(req);
                String responseWeb = http.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
                HashMap resp = mp.decryptMessage(responseWeb);
                response.getWriter().print(resp);
                response.setContentType("application/json");
            } else if (type_nya.equals("available")) {
                req.put(FieldParameterMatapos.proccode, ProcessingCode.changestatusavailable);
                req.put(FieldParameterMatapos.brand_id, brand_id);
                req.put(FieldParameterMatapos.outlet_id, outlet_id);
                req.put(FieldParameterMatapos.productcode, productcode);
                String reqMsg = mp.encryptMessage(req);
                String responseWeb = http.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
                HashMap resp = mp.decryptMessage(responseWeb);
                response.getWriter().print(resp);
                response.setContentType("application/json");
            }
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
