/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.matapos.servlet;

import com.bo.function.JsonProcess;
import com.bo.parameter.FieldParameterMatapos;
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
public class AddItemServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(AddItemServlet.class);

    public AddItemServlet() {
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
            String category_name_item = newJson.get("category_name_item").toString();
            String item_name = newJson.get("item_name").toString();
            String item_description = newJson.get("item_description").toString();
            String img_item = newJson.get("img_item").toString();
            String item_price = newJson.get("item_price").toString();
            String item_receive_stock = newJson.get("item_receive_stock").toString();
            String item_barcode = newJson.get("item_barcode").toString();
            String stock_beginning = newJson.get("stock_beginning").toString();
            String product_code = newJson.get("sku").toString();

            req.put("procCode", "18");
            req.put(FieldParameterMatapos.category, category_name_item);
            req.put("fullid", brand_id + outlet_id.substring(16));
            req.put("image", img_item);

            req.put("detail", item_description);
            req.put("product_name", item_name);
            if ("false".equals(item_receive_stock)) {
                req.put("receive_stock", "0");
            } else if ("true".equals(item_receive_stock)) {
                req.put("receive_stock", "1");
            }
            req.put("price", item_price);
            req.put("status", "1");
            if (item_barcode.equals("")) {
                req.put("barcode", "-");
            } else {
                req.put("barcode", item_barcode);
            }
            if ("".equals(stock_beginning)) {
                req.put("stock", "0");
            } else {
                req.put("stock", stock_beginning);
            }
            req.put("userlogin", user_id);
            req.put("product_code", product_code);
            String reqMsg = mp.encryptMessage(req);
            String responseWeb = ht.sendHttpRequest(StaticParameter.urlbackendserverUAT, reqMsg);
            HashMap resp = mp.decryptMessage(responseWeb);
            response.setContentType("application/json");
            response.getWriter().print(resp);
        } catch (IOException e) {
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
