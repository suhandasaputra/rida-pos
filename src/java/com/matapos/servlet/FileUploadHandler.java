/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.matapos.servlet;

//import java.io.File;
//import java.io.IOException;
//import java.util.List;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;
//
///**
// * Servlet to handle File upload request from Client
// *
// * @author suhanda
// */
//public class FileUploadHandler extends HttpServlet {
//
//    private static final org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(FileUploadHandler.class);
//
//    public FileUploadHandler() {
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//        String message;
//        //process only if its multipart content
////        File f = new File("/var/www/html/freemium/"+brand_id);
//        File f = new File("C:\\xampp\\htdocs\\rekon\\");
//        if (!f.exists()) {
//            f.mkdir();
//        }
//        if (ServletFileUpload.isMultipartContent(request)) {
//            try {
//                List<FileItem> multiparts = new ServletFileUpload(
//                        new DiskFileItemFactory()).parseRequest(request);
//                for (FileItem item : multiparts) {
//                    if (!item.isFormField()) {
////                        String name = new File(item.getName()).getName();
//                        item.write(new File(f.getAbsolutePath() + File.separator + "pembanding"+".xlsx"));
////                        session.setAttribute("file_name", name);
//                    }
//                }
//                //File uploaded successfully
//                message = "00";
//            } catch (Exception ex) {
//                message = "01";
//            }
//        } else {
//            message = "02";
//        }
//        response.setContentType("text/plain");
//        response.getWriter().write(message);
//    }
//}
