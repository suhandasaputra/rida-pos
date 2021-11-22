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
public class EditItemServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(EditItemServlet.class);

    public EditItemServlet() {
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
            String user_id = newJson.get("user_id").toString();
            String outlet_id = newJson.get("outlet_id_edit_item").toString();

            String item_product_code_edit = newJson.get("item_product_code_edit").toString();
            String category_name_new_item = newJson.get("category_name_edit_item").toString();
            String category_name_old_item = newJson.get("category_name_send_edit_item").toString();
            String item_name_edit_item = newJson.get("item_name_edit_item").toString();
            String item_price_edit_item = newJson.get("item_price_edit_item").toString();
            String item_barcode_edit_item = newJson.get("item_barcode_edit_item").toString();
            String item_description_edit_item = newJson.get("item_description_edit_item").toString();
            String img_item_edit_item = newJson.get("img_item_edit_item").toString();
            String item_receive_stock_edit_item = newJson.get("item_receive_stock_edit_item").toString();

            req.put("procCode", "19");
            req.put(FieldParameterMatapos.category, category_name_old_item.toUpperCase());
            req.put("product_code", item_product_code_edit);
            if (category_name_new_item.equals("")) {
                req.put("new_category", category_name_old_item.toUpperCase());
            } else {
                req.put("new_category", category_name_new_item.toUpperCase());
            }
            req.put("fullid", brand_id + outlet_id);
            req.put("image", img_item_edit_item);
            req.put("detail", item_description_edit_item);
            req.put("product_name", item_name_edit_item);
            req.put("status", "1");
            if (item_receive_stock_edit_item.equals("false")) {
                req.put("receive_stock", "0");
            } else {
                req.put("receive_stock", "1");
            }
            req.put("price", item_price_edit_item.replace(".", ""));
            if (item_barcode_edit_item.equals("")) {
                req.put("barcode", "-");
            } else {
                req.put("barcode", item_barcode_edit_item);
            }
            req.put("userlogin", user_id);
            String reqMsg = mp.encryptMessage(req);
            String responseWeb = ht.sendHttpRequest(StaticParameter.urlbackendserverUAT, reqMsg);
            HashMap resp = mp.decryptMessage(responseWeb);
            response.getWriter().print(resp);
            response.setContentType("application/json");
        } catch (Exception e) {
            System.out.println("error : " + e);
            response.setContentType("application/json");
            response.getWriter().print("error");
        } finally {
            req = null;
            mp = null;
            ht = null;
            br = null;
        }
    }
}
