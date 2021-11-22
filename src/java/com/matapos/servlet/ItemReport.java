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
public class ItemReport extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(ItemReport.class);

    public ItemReport() {
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
            String tanggal_item_from = newJson.get("tanggal_item_from").toString();
            String tanggal_item_to = newJson.get("tanggal_item_to").toString();

            String outlet_id = newJson.get("outlet_id_item").toString();
            req.put(FieldParameterMatapos.proccode, ProcessingCode.itemreport);
            req.put(FieldParameterMatapos.tanggal_from, tanggal_item_from);
            req.put(FieldParameterMatapos.tanggal_to, tanggal_item_to);

            req.put(FieldParameterMatapos.outlet_id, outlet_id);
            req.put(FieldParameterMatapos.brand_id, brand_id);
            String reqMsg = mp.encryptMessage(req);
            String responseWeb = http.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
            HashMap resp = mp.decryptMessage(responseWeb);
            response.setContentType("application/json");
            response.getWriter().print(resp.get(FieldParameterMatapos.listitemreport));
        } catch (Exception e) {
            System.out.println("error : " + e);
            response.setContentType("application/json");
            response.getWriter().print("error");
        } finally {
            req = null;
            mp = null;
            http = null;
            br = null;
        }
    }
}
