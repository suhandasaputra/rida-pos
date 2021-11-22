/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.matapos.servlet;

import com.freemium.function.impl.MessageProcessImpl;
import com.freemium.function.MessageProcess;
import com.freemium.function.impl.HTTPProcessImpl;
import com.bo.parameter.FieldParameterMatapos;
import com.freemium.function.JsonProcess;
import com.matapos.parameter.StaticParameter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet to handle File upload request from Client
 *
 * @author suhanda
 */
public class EditStockServlet extends HttpServlet {

    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(EditStockServlet.class);
    private static String UPDATE = "sto_ed";

    public EditStockServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HashMap req = new HashMap();
        MessageProcess mp = new MessageProcessImpl();
        HTTPProcessImpl ht = new HTTPProcessImpl();

        try {
            String forward = "";
            String action = request.getParameter("action");
            if (action.equalsIgnoreCase("update")) {
                forward = UPDATE;
                String id = request.getParameter("id");
                String brand_id = request.getParameter("brand");
                String outlet_id = request.getParameter("outlet");
                String user_id = request.getParameter("user");
                req.put("fullid", brand_id + outlet_id);
                req.put("procCode", "51");
                req.put("userlogin", user_id);
                req.put("refer", id);

                String reqMsg = mp.encryptMessage(req);
                String responseWeb = ht.sendHttpRequest(StaticParameter.urlbackendserverUAT, reqMsg);
                HashMap resp = mp.decryptMessage(responseWeb);
                if (resp.get(FieldParameterMatapos.resp_code).toString().equals("0000")) {
                    String ld = resp.get("list").toString();
                    HashMap data1 = new HashMap();
                    List listJson = new ArrayList();
                    String JA[] = ld.split(";");
                    int returnstock = 0;
                    int receivestock = 0;
                    int hargastockawal = 0;
                    int hargastockpengurang = 0;
                    String return_productname = "";
                    String return_totalcost = "";
                    String return_productcode = "";
                    String return_suppliername = "";
                    String return_id_receive = "";
                    String return_supplierid = "";

                    for (int i = 0; i < JA.length; i++) {
                        String AO[] = JA[i].split("\\|");
                        HashMap data2 = new HashMap();
//          324|2021-02-04 09:50:22|111000|2|1000|2000|lenamagdalena22@gmail.com|1|RECEIVE STOCK|0|gtgt|-|Bang Jago
                        
                        data2.put("id", AO[0]);
                        data2.put("date", AO[1]);
                        data2.put("product_code", AO[2]);
                        data2.put("qty", AO[3]);
                        data2.put("price", AO[4]);
                        data2.put("total_cost", AO[5]);
                        data2.put("pic", AO[6]);
                        data2.put("supplier_id", AO[7]);
                        data2.put("status", AO[8]);
                        data2.put("refer", AO[9]);
                        data2.put("product_name", AO[10]);
                        data2.put("reason_return", AO[11]);
                        data2.put("supplier_name", AO[12]);

                        data2.put("supplier_email", AO[13]);
                        data2.put("supplier_phone", AO[14]);
                        data2.put("supplier_address", AO[15]);
                        data2.put("outlet_name", AO[16]);
                        data2.put("pic_phone", AO[17]);
                        listJson.add(data2);

                        if ("RECEIVE STOCK".equals(AO[8])) {
                            receivestock = Integer.valueOf(AO[3]);
                            hargastockawal = Integer.valueOf(AO[5]);
                            return_productname = AO[10];
                            return_totalcost = AO[5];
                            return_productcode = AO[2];
                            return_suppliername = AO[12];
                            return_id_receive = AO[0];
                            return_supplierid = AO[7];
                        } else {
                            int val_ret = Integer.valueOf(AO[3]);
                            returnstock += val_ret;
                            int val_pri = Integer.valueOf(AO[5]);
                            hargastockpengurang += val_pri;
                        }
                        data2 = null;
                    }
                    int sisauang = hargastockawal - hargastockpengurang;
                    int sisa = receivestock - returnstock;
                    data1.put("DATA", listJson);
                    String Kampret = JsonProcess.generateJson(data1);
                    HashMap hh = JsonProcess.decodeJson(Kampret);
                    request.setAttribute("det_re_stock", hh.get("DATA"));
                    request.setAttribute("return_sisa", sisa);
                    request.setAttribute("return_sisauang", sisauang);

                    request.setAttribute("return_productname", return_productname);
                    request.setAttribute("return_totalcost", return_totalcost);
                    request.setAttribute("return_productcode", return_productcode);
                    request.setAttribute("return_suppliername", return_suppliername);
                    request.setAttribute("return_id_receive", return_id_receive);
                    request.setAttribute("outlet_id_edit_po", outlet_id);
                    request.setAttribute("return_supplierid", return_supplierid);
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher(forward);
                    requestDispatcher.forward(request, response);
                    listJson = null;
                    data1 = null;
                }
            }
        } catch (Exception e) {
            System.out.println("error : " + e);
            response.setContentType("application/json");
            response.getWriter().print("error");
        } finally {
            req = null;
            mp = null;
            ht = null;

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String edit_discount_id = request.getParameter("edit_discount_id").toString();
//        String edit_discount_name = request.getParameter("edit_discount_name").toString();
//        String edit_discount_value = request.getParameter("edit_discount_value").toString();
//        String edit_discount_date_from = request.getParameter("edit_discount_date_from").toString();
//        String edit_discount_date_to = request.getParameter("edit_discount_date_to").toString();
//        String edit_send_outlet = request.getParameter("edit_send_outlet").toString();
//        String edit_discount_keterangan = request.getParameter("edit_discount_keterangan").toString();
//
//        HashMap req = new HashMap();
//        MessageProcess mp = new MessageProcessImpl();
//        HTTPProcessImpl ht = new HTTPProcessImpl();
//        HttpSession session = request.getSession(true);
//
//        req.put("procCode", "56");
//        req.put("brand_id", session.getAttribute("brand_id"));
//        req.put("outlet_id", edit_send_outlet.replace("|", ","));
//        req.put("product_code", edit_discount_keterangan.replace("|", ","));
//        req.put("discount", edit_discount_value);
//        req.put("startdate", edit_discount_date_from.replace("-", "") + "000000");
//        req.put("enddate", edit_discount_date_to.replace("-", "") + "235959");
//        req.put("status", "1");
//        req.put("discount_id", edit_discount_id);
//        req.put("discount_name", edit_discount_name);
//        req.put("userlogin", session.getAttribute("user_id"));
//        System.out.println("ini req : " + req);
//
//        String reqMsg = mp.encryptMessage(req);
//        String responseWeb = ht.sendHttpRequest(StaticParameter.urlbackendserverUAT, reqMsg);
//        HashMap resp = mp.decryptMessage(responseWeb);
//        if (resp.get(FieldParameterMatapos.resp_code).toString().equals("0000")) {
//            session.removeAttribute("edit_discount_id");
//            session.removeAttribute("edit_discount_name");
//            session.removeAttribute("edit_discount_value");
//            session.removeAttribute("edit_discount_startdate");
//            session.removeAttribute("edit_discount_enddate");
//            session.removeAttribute("edit_discount_outlet_id");
//            session.removeAttribute("edit_discount_keterangan");
//            RequestDispatcher rd = request.getRequestDispatcher("/dis");
//            PrintWriter out = response.getWriter();
//            out.println("<div class=\"alert alert-success status-custom\">\n"
//                    + "     <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>\n"
//                    + "     <i class=\"icon fa fa-check\"></i>Success Edit Discount " + edit_discount_name + " \n"
//                    + "</div>");
//            rd.include(request, response);
//        } else {
//            RequestDispatcher rd = request.getRequestDispatcher("/edit_discount.jsp");
//            PrintWriter out = response.getWriter();
//            out.println("<div class=\"alert alert-danger status-custom\">\n"
//                    + "     <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>\n"
//                    + "     <i class=\"icon fa fa-check\"></i>Failed Edit Discount " + edit_discount_name + " \n"
//                    + "</div>");
//            rd.include(request, response);
//        }
    }
}
