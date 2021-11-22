/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.matapos.servlet;

import com.bo.function.JsonProcess;
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
public class CreateStockServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(CreateStockServlet.class);

    public CreateStockServlet() {
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
        HTTPProcessImpl ht = new HTTPProcessImpl();
        try {
            String json = "";
            json = br.readLine();
            HashMap newJson = JsonProcess.decodeJson(json);

            String brand_id = newJson.get("brand_id").toString();
            String outlet_id = newJson.get("outlet_id").toString();
            String user_id = newJson.get("user_id").toString();

            String product_name = newJson.get("product_name").toString();
            String product_code = newJson.get("product_code").toString();
            String quantity = newJson.get("quantity").toString();
            String price = newJson.get("price").toString();
            String total_cost = newJson.get("total_cost").toString();
            String supplier_id = newJson.get("supplier_id").toString();

            req.put("procCode", "20");
            req.put("fullid", brand_id + outlet_id.substring(16));
            req.put("product_code", product_code);
            req.put("supplier_id", supplier_id);
            req.put("stock", quantity);
//            int c = Integer.valueOf(total_cost)/Integer.valueOf(quantity);
            req.put("buy_price", price);
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
            br = null;
            req = null;
            mp = null;
            ht = null;
        }

    }
}
