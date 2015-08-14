package com.diyshirt.model.command.Picture;

/**
 * <p>Title: 后台服务</p>
 *
 * <p>Description: 为客户端提供上传及文件传输状态查询服务</p>
 *
 */

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Random;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.*;

import com.diyshirt.model.PictureManager;
import com.diyshirt.to.PictureTo;
import com.diyshirt.util.ConfigManager;


public class BackGroundService extends javax.servlet.http.HttpServlet implements
        javax.servlet.Servlet {

    public static final String UPLOAD_DIR = "/upload";
//  public static final String DEFAULT_UPLOAD_FAILURE_URL = "./result.jsp";
    public static final String DEFAULT_UPLOAD_FAILURE_URL ="Result.jsp";

    public BackGroundService() {
        super();
    }


    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException,
            IOException {
        doPost(request, response);
    }

    /**
     * 从文件路径中取出文件名
     */
    private String takeOutFileName(String filePath) {
        int pos = filePath.lastIndexOf(File.separator);
        if (pos > 0) {
            return filePath.substring(pos + 1);
        } else {
            return filePath;
        }
    }

    /**
     * 从request中取出FileUploadStatus Bean
     */
    public static PictureUploadStatus getStatusBean(
            HttpServletRequest request) {
        BeanControler beanCtrl = BeanControler.getInstance();
        return beanCtrl.getUploadStatus(request.getRemoteAddr());
    }

    /**
     * 把FileUploadStatus Bean保存到类控制器BeanControler
     */
    public static void saveStatusBean(
            HttpServletRequest request,
            PictureUploadStatus statusBean) {
        statusBean.setUploadAddr(request.getRemoteAddr());
        BeanControler beanCtrl = BeanControler.getInstance();
        beanCtrl.setUploadStatus(statusBean);
    }

    /**
     * 删除已经上传的文件
     */
    private void deleteUploadedFile(HttpServletRequest request) {
        PictureUploadStatus satusBean = getStatusBean(request);
        for (int i = 0; i < satusBean.getUploadFileUrlList().size(); i++) {
            File uploadedFile = new File(request.getRealPath(UPLOAD_DIR) +
                                         File.separator +
                                         satusBean.getUploadFileUrlList().
                                         get(i));
            uploadedFile.delete();
        }
        satusBean.getUploadFileUrlList().clear();
        satusBean.setStatus("删除已上传的文件");
        saveStatusBean(request, satusBean);
    }

    /**
     * 上传过程中出错处理
     */
    private void uploadExceptionHandle(
            HttpServletRequest request,
            String errMsg) throws ServletException, IOException {
        //首先删除已经上传的文件
        deleteUploadedFile(request);
        PictureUploadStatus satusBean = getStatusBean(request);
        satusBean.setStatus(errMsg);
        saveStatusBean(request, satusBean);
    }

    /**
     * 初始化文件上传状态Bean
     * @throws IOException 
     */
    private PictureUploadStatus initStatusBean(HttpServletRequest
            request) throws IOException {
    	//request.setCharacterEncoding("gbk");
    	PictureUploadStatus satusBean = new PictureUploadStatus();
        satusBean.setStatus("正在准备处理");
        satusBean.setUploadTotalSize(request.getContentLength());
        satusBean.setProcessStartTime(System.currentTimeMillis());
        satusBean.setBaseDir(request.getContextPath() + UPLOAD_DIR);
        String picname=new String(request.getParameter("picname").getBytes("ISO8859_1"),"gbk");
        satusBean.setPictureName(picname);
        satusBean.setUserID(request.getParameter("UserID"));
        return satusBean;
    }

    /**
     * 处理文件上传
     */
    private void processFileUpload(HttpServletRequest request,
                                   HttpServletResponse response) throws
            ServletException, IOException {
    	Calendar time = Calendar.getInstance();
    	Random rd = new Random(); 
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //设置内存缓冲区，超过后写入临时文件
        factory.setSizeThreshold(10240000);
        //设置临时文件存储位置
        factory.setRepository(new File(request.getRealPath("/upload"))); 
        ServletFileUpload upload = new ServletFileUpload(factory); 
        //设置单个文件的最大上传值
        upload.setFileSizeMax(2048000L);
        //设置整个request的最大值
        upload.setSizeMax(102400000L);
        upload.setProgressListener(new PictureUploadListener(request));        
        //保存初始化后的PictureUploadStatus Bean
        saveStatusBean(request, initStatusBean(request));
        String forwardURL = "";
        try {  
            List items = upload.parseRequest(request);
            //获得返回url
            for (int i = 0; i < items.size(); i++) {
                FileItem item = (FileItem) items.get(i);
                if (item.isFormField()) {
                    forwardURL = item.getString();
                    break;
                }
            }
            //处理文件上传
            for (int i = 0; i < items.size(); i++) {
                FileItem item = (FileItem) items.get(i);

                //取消上传
                if (getStatusBean(request).getCancel()) {
                    deleteUploadedFile(request);
                    break;
                }
                //保存文件
                else if (!item.isFormField() && item.getName().length() > 0) {
                    String fileName = takeOutFileName(item.getName());
//                  定义上传后另存为的文件名
        			String fname = String.valueOf(time.get(Calendar.YEAR))
        					+ String.valueOf(time.get(Calendar.MONTH))
        					+ String.valueOf(time.get(Calendar.DAY_OF_MONTH))
        					+ String.valueOf(time.get(Calendar.HOUR_OF_DAY))
        					+ String.valueOf(time.get(Calendar.MINUTE))
        					+ String.valueOf(time.get(Calendar.SECOND))
        					+ String.valueOf(rd.nextInt(100))
        					+ fileName.substring(fileName.lastIndexOf("."));
                    File uploadedFile = new File(request.getRealPath(UPLOAD_DIR) +
                                                 File.separator + fname);
                  
                    item.write(uploadedFile);
                    //更新上传文件列表
                    PictureUploadStatus satusBean =
                            getStatusBean(request);
                    satusBean.getUploadFileUrlList().add(fname);
                    saveStatusBean(request, satusBean);
                    Thread.sleep(500);
                }
            }

        } catch (FileUploadException e) {
            uploadExceptionHandle(request, "上传文件时发生错误:" + e.getMessage());
        } catch (Exception e) {
            uploadExceptionHandle(request, "保存上传文件时发生错误:" + e.getMessage());
        }
        if (forwardURL.length() == 0) {
            forwardURL = DEFAULT_UPLOAD_FAILURE_URL;
        }
        PictureUploadStatus fUploadStatus = BackGroundService
		.getStatusBean(request);
        long size = fUploadStatus.getUploadTotalSize();
		String picname = fUploadStatus.getPictureName();
		String filename = (String) fUploadStatus.getUploadFileUrlList().get(0);
		String baseDir = fUploadStatus.getBaseDir();
		String filebaseurl = ConfigManager.getPropValue("file_base_url");
		String puttime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(time.getTime());
		//String url = filebaseurl + filename;
		String UserID = fUploadStatus.getUserID();
		System.out.println(filename);
		PictureTo to = new PictureTo();
		to.setPicName(picname);
		to.setUserID(UserID);
		to.setPicPath(filename);
		//to.setSize("" + size);
		boolean flag = PictureManager.getInstance().addPicture(to);
		response.sendRedirect(DEFAULT_UPLOAD_FAILURE_URL);
		
    }

    /**
     * 回应上传状态查询
     */
    private void responseStatusQuery(HttpServletRequest request,
                                              HttpServletResponse response) throws
            IOException {
        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");
        PictureUploadStatus satusBean = getStatusBean(request);
        response.getWriter().write(satusBean.toJSon());
    }

    /**
     * 处理取消文件上传
     */
    private void processCancelFileUpload(HttpServletRequest request,
                                         HttpServletResponse response) throws
            IOException {
        PictureUploadStatus satusBean = getStatusBean(request);
        satusBean.setCancel(true);
        saveStatusBean(request, satusBean);
        responseStatusQuery(request, response);
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException,
            IOException {
//    	String documentname = request.getParameter("documentname");
//    	String nameID = request.getParameter("nameID");
//    	String kind = request.getParameter("kind");
//    	String integral = request.getParameter("integral");
//   	System.out.println(documentname+nameID+kind+integral);
    	
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart) {
            processFileUpload(request, response);
        } else {
            request.setCharacterEncoding("UTF-8");

            if (request.getParameter("uploadStatus") != null) {
                responseStatusQuery(request, response);
            }
            if (request.getParameter("cancelUpload") != null) {
                processCancelFileUpload(request, response);
            }

        }
    }
}

