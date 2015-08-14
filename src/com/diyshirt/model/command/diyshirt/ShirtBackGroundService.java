package com.diyshirt.model.command.diyshirt;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.*;

import com.diyshirt.model.ShirtManager;
import com.diyshirt.model.command.diyshirt.ShirtBackGroundService;
import com.diyshirt.model.command.diyshirt.ShirtUploadStatus;
import com.diyshirt.to.T_shirtTo;
import com.diyshirt.util.ConfigManager;


public class ShirtBackGroundService extends javax.servlet.http.HttpServlet implements
        javax.servlet.Servlet {

    public static final String UPLOAD_DIR = "/diyshirt/T_Shirt";
    public static final String DEFAULT_UPLOAD_FAILURE_URL = "Result.jsp";

    public ShirtBackGroundService() {
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
    public static ShirtUploadStatus getStatusBean(
            HttpServletRequest request) {
        ShirtBeanControler beanCtrl = ShirtBeanControler.getInstance();
        return beanCtrl.getUploadStatus(request.getRemoteAddr());
    }

    /**
     * ��FileUploadStatus Bean���浽�������BeanControler
     */
    public static void saveStatusBean(
            HttpServletRequest request,
            ShirtUploadStatus statusBean) {
        statusBean.setUploadAddr(request.getRemoteAddr());
        ShirtBeanControler beanCtrl = ShirtBeanControler.getInstance();
        beanCtrl.setUploadStatus(statusBean);
    }

    /**
     * ɾ���Ѿ��ϴ����ļ�
     */
    private void deleteUploadedFile(HttpServletRequest request) {
        ShirtUploadStatus satusBean = getStatusBean(request);
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
        ShirtUploadStatus satusBean = getStatusBean(request);
        satusBean.setStatus(errMsg);
        saveStatusBean(request, satusBean);
    }

    /**
     * ��ʼ���ļ��ϴ�״̬Bean
     */
    private ShirtUploadStatus initStatusBean(HttpServletRequest
            request) {
        ShirtUploadStatus satusBean = new ShirtUploadStatus();
        satusBean.setStatus("����׼������");
        satusBean.setUploadTotalSize(request.getContentLength());
        satusBean.setProcessStartTime(System.currentTimeMillis());
        satusBean.setBaseDir(request.getContextPath() + UPLOAD_DIR);
        return satusBean;
    }

    /**
     * �����ļ��ϴ�
     */
    private void processFileUpload(HttpServletRequest request,
                                   HttpServletResponse response) throws
            ServletException, IOException {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //�����ڴ滺������������д����ʱ�ļ�
        factory.setSizeThreshold(10240000);
        //������ʱ�ļ��洢λ��
        factory.setRepository(new File(request.getRealPath("/upload/temp")));
        ServletFileUpload upload = new ServletFileUpload(factory);
        //���õ����ļ�������ϴ�ֵ
        upload.setFileSizeMax(102400000);
        //��������request�����ֵ
        upload.setSizeMax(102400000);
        upload.setProgressListener(new ShirtUploadListener(request));
        //�����ʼ�����FileUploadStatus Bean
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
                    File uploadedFile = new File(request.getRealPath(UPLOAD_DIR) +
                                                 File.separator + fileName);
                    item.write(uploadedFile);
                    //�����ϴ��ļ��б�
                    ShirtUploadStatus satusBean =
                            getStatusBean(request);
                    satusBean.getUploadFileUrlList().add(fileName);
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
        
        ShirtUploadStatus fUploadStatus = ShirtBackGroundService.getStatusBean(request);
        long size = fUploadStatus.getUploadTotalSize();
		String Price = request.getParameter("Price");
		String CateID = request.getParameter("CateID");
		String Intro = request.getParameter("Intro");
		String Sex = request.getParameter("Sex");
		String ShirtName = request.getParameter("ShirtName");
		String filename1 = (String) fUploadStatus.getUploadFileUrlList().get(0);
		String filename2 = (String) fUploadStatus.getUploadFileUrlList().get(1);
		String baseDir = fUploadStatus.getBaseDir();
		//String url = "C:\\Program Files\\Apache Software Foundation\\Tomcat 5.5\\webapps\\diyshirt\\upload\\";
		String filebaseurl = ConfigManager.getPropValue("file_base_url");
		String puttime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		//String url = filebaseurl + filename;
		//String UserID = fUploadStatus.getUserID();

		T_shirtTo to = new T_shirtTo();
		to.setT_ShirtPath_1(filename1);
		to.setT_ShirtPath_2(filename2);
		to.setPrice(Float.parseFloat(Price));
		to.setCateID(Integer.parseInt(CateID));
		to.setIntro(Intro);
		to.setShirtName(ShirtName);
		to.setSex((short)Integer.parseInt(Sex));
		//to.setSize("" + size);
		boolean flag = ShirtManager.getInstance().addshirt(to);
        if(flag==true){System.out.print("");}
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
        ShirtUploadStatus satusBean = getStatusBean(request);
        response.getWriter().write(satusBean.toJSon());
    }

    /**
     * ����ȡ���ļ��ϴ�
     */
    private void processCancelFileUpload(HttpServletRequest request,
                                         HttpServletResponse response) throws
            IOException {
        ShirtUploadStatus satusBean = getStatusBean(request);
        satusBean.setCancel(true);
        saveStatusBean(request, satusBean);
        responseStatusQuery(request, response);
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException,
            IOException {
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
