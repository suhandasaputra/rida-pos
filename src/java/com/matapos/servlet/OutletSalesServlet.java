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
import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author suhanda
 */
public class OutletSalesServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(OutletSalesServlet.class);

    public OutletSalesServlet() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HashMap req = new HashMap();
        HashMap resp = new HashMap();
        HashMap newJson = new HashMap();
        MessageProcess mp = new MessageProcessImpl();
        SendHttpProcess http = new SendHttpProcess();
        Date date1 = new Date();
        Date date2 = new Date();

        try {
            String json = request.getParameter("data");
            newJson = JsonProcess.decodeJson(json);
            String brand_id = newJson.get("brand_id").toString();
            String tanggal_from = newJson.get("tanggal_from").toString();
            String tanggal_to = newJson.get("tanggal_to").toString();
            String outlet_id = newJson.get("outlet").toString();

            req.put(FieldParameterMatapos.proccode, ProcessingCode.getlistoutletsales);
            req.put(FieldParameterMatapos.brand_id, brand_id);
            req.put(FieldParameterMatapos.outlet_id, outlet_id);
            if (tanggal_from.equals("today")) {
                LocalDate localDate = date1.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                req.put(FieldParameterMatapos.tanggal_from, localDate);
            } else {
                req.put(FieldParameterMatapos.tanggal_from, tanggal_from);
            }
            if (tanggal_to.equals("today")) {
                LocalDate localDate = date2.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                req.put(FieldParameterMatapos.tanggal_to, localDate);
            } else {
                req.put(FieldParameterMatapos.tanggal_to, tanggal_to);
            }
            String reqMsg = mp.encryptMessage(req);
            String responseWeb = http.sendHttpRequest(StaticParameter.urlBOServer, reqMsg);
            resp = mp.decryptMessage(responseWeb);
            response.setContentType("application/json");
            response.getWriter().print(resp.get(FieldParameterMatapos.list_outlet_sales));
        } catch (Exception e) {
            System.out.println("error : " + e);
            response.setContentType("application/json");
            response.getWriter().print("error");
        } finally {
            req = null;
            resp = null;
            newJson = null;
            mp = null;
            http = null;
            date1 = null;
            date2 = null;
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
