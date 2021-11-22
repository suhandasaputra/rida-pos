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
public class DeleteStockServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(DeleteStockServlet.class);

    public DeleteStockServlet() {
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

            String return_productcode = gg.get("return_productcode").toString();
            String product_name_rs = gg.get("product_name_rs").toString();
            String qty_rs = gg.get("qty_rs").toString();
            String return_supplierid = gg.get("return_supplierid").toString();
            String reason = gg.get("return_reason").toString();
            String return_id_receive = gg.get("return_id_receive").toString();
            String total_cost = gg.get("total_cost").toString();

            req.put("procCode", "42");
            req.put("fullid", brand_id + outlet_id);
            req.put("product_code", return_productcode);
            req.put("product_name", product_name_rs);
            req.put("stock", qty_rs);
            req.put("supplier_id", return_supplierid);
            req.put("reason_return", reason);
            req.put("refer", return_id_receive);
            req.put("buy_price", "0");
            req.put("total_cost", total_cost);
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
            req = null;
            mp = null;
            ht = null;
            in = null;
        }
    }
}
