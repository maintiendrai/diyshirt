package com.diyshirt.model.command.Picture;

/**
 * <p>Title: ��̨����</p>
 *
 * <p>Description: Ϊ�ͻ����ṩ�ϴ����ļ�����״̬��ѯ����</p>
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
     * ���ļ�·����ȡ���ļ���
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
     * ��request��ȡ��FileUploadStatus Bean
     */
    public static PictureUploadStatus getStatusBean(
            HttpServletRequest request) {
        BeanControler beanCtrl = BeanControler.getInstance();
        return beanCtrl.getUploadStatus(request.getRemoteAddr());
    }

    /**
     * ��FileUploadStatus Bean���浽�������BeanControler
     */
    public static void saveStatusBean(
            HttpServletRequest request,
            PictureUploadStatus statusBean) {
        statusBean.setUploadAddr(request.getRemoteAddr());
        BeanControler beanCtrl = BeanControler.getInstance();
        beanCtrl.setUploadStatus(statusBean);
    }

    /**
     * ɾ���Ѿ��ϴ����ļ�
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
        satusBean.setStatus("ɾ�����ϴ����ļ�");
        saveStatusBean(request, satusBean);
    }

    /**
     * �ϴ������г�����
     */
    private void uploadExceptionHandle(
            HttpServletRequest request,
            String errMsg) throws ServletException, IOException {
        //����ɾ���Ѿ��ϴ����ļ�
        deleteUploadedFile(request);
        PictureUploadStatus satusBean = getStatusBean(request);
        satusBean.setStatus(errMsg);
        saveStatusBean(request, satusBean);
    }

    /**
     * ��ʼ���ļ��ϴ�״̬Bean
     * @throws IOException 
     */
    private PictureUploadStatus initStatusBean(HttpServletRequest
            request) throws IOException {
    	//request.setCharacterEncoding("gbk");
    	PictureUploadStatus satusBean = new PictureUploadStatus();
        satusBean.setStatus("����׼������");
        satusBean.setUploadTotalSize(request.getContentLength());
        satusBean.setProcessStartTime(System.currentTimeMillis());
        satusBean.setBaseDir(request.getContextPath() + UPLOAD_DIR);
        String picname=new String(request.getParameter("picname").getBytes("ISO8859_1"),"gbk");
        satusBean.setPictureName(picname);
        satusBean.setUserID(request.getParameter("UserID"));
        return satusBean;
    }

    /**
     * �����ļ��ϴ�
     */
    private void processFileUpload(HttpServletRequest request,
                                   HttpServletResponse response) throws
            ServletException, IOException {
    	Calendar time = Calendar.getInstance();
    	Random rd = new Random(); 
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //�����ڴ滺������������д����ʱ�ļ�
        factory.setSizeThreshold(10240000);
        //������ʱ�ļ��洢λ��
        factory.setRepository(new File(request.getRealPath("/upload"))); 
        ServletFileUpload upload = new ServletFileUpload(factory); 
        //���õ����ļ�������ϴ�ֵ
        upload.setFileSizeMax(2048000L);
        //��������request�����ֵ
        upload.setSizeMax(102400000L);
        upload.setProgressListener(new PictureUploadListener(request));        
        //�����ʼ�����PictureUploadStatus Bean
        saveStatusBean(request, initStatusBean(request));
        String forwardURL = "";
        try {  
            List items = upload.parseRequest(request);
            //��÷���url
            for (int i = 0; i < items.size(); i++) {
                FileItem item = (FileItem) items.get(i);
                if (item.isFormField()) {
                    forwardURL = item.getString();
                    break;
                }
            }
            //�����ļ��ϴ�
            for (int i = 0; i < items.size(); i++) {
                FileItem item = (FileItem) items.get(i);

                //ȡ���ϴ�
                if (getStatusBean(request).getCancel()) {
                    deleteUploadedFile(request);
                    break;
                }
                //�����ļ�
                else if (!item.isFormField() && item.getName().length() > 0) {
                    String fileName = takeOutFileName(item.getName());
//                  �����ϴ������Ϊ���ļ���
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
                    //�����ϴ��ļ��б�
                    PictureUploadStatus satusBean =
                            getStatusBean(request);
                    satusBean.getUploadFileUrlList().add(fname);
                    saveStatusBean(request, satusBean);
                    Thread.sleep(500);
                }
            }

        } catch (FileUploadException e) {
            uploadExceptionHandle(request, "�ϴ��ļ�ʱ��������:" + e.getMessage());
        } catch (Exception e) {
            uploadExceptionHandle(request, "�����ϴ��ļ�ʱ��������:" + e.getMessage());
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
     * ��Ӧ�ϴ�״̬��ѯ
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
     * ����ȡ���ļ��ϴ�
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

