package com.diyshirt.model.command.diyshirt;

import java.io.PrintWriter;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.ShirtManager;
import com.diyshirt.model.upload.*;
import com.diyshirt.to.*;
import com.diyshirt.util.Logger;

public class ShirtUploadCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO �Զ����ɷ������
		CommandResult result = new CommandResult();
		String resultPage = null;
		response.setContentType("text/html");
		response.setCharacterEncoding("GBK");
		PrintWriter out = response.getWriter();
		Calendar time = Calendar.getInstance();
		short j = 0;
		Random rd = new Random(); 
		String[] filedir = new String[2];
		SmartUpload su = new SmartUpload();
     
		
		//��ʼ���ϴ�
		su.initialize(this.getSc(), request, response);
		// ���������ϴ��ļ�����
		su.setAllowedFilesList("gif,jpg,bmp,JPG,GIF,BMP");
		// �������ϴ��ļ�����
		su.setDeniedFilesList("jsp,asp,php,aspx,html,htm");
		// �����ļ��������
		su.setMaxFileSize(2 * 1024 * 1024);
		// �ܹ��ϴ��ļ�����
		su.setTotalMaxFileSize(5 * 1024 * 1024);
		// ��ʼ�ϴ�,����������ƻ���Ϊ���������ͣ��׳��쳣��ʾ
		su.setContentDisposition(null);
		try {
			su.upload();
		} catch (Exception e) {
			out.println("��ѡ����ļ��������ϴ������ļ������뷵�ؼ�飡");
		}
		// �õ������ϴ��ļ�����Ϣ
		for (int i = 0; i < su.getFiles().getCount(); i++) {
			com.diyshirt.model.upload.File file = su.getFiles().getFile(i);
			if (file.isMissing()){
				continue;
				}
			// �����ϴ������Ϊ���ļ���
			String filename = String.valueOf(time.get(Calendar.YEAR))
					+ String.valueOf(time.get(Calendar.MONTH))
					+ String.valueOf(time.get(Calendar.DAY_OF_MONTH))
					+ String.valueOf(time.get(Calendar.HOUR_OF_DAY))
					+ String.valueOf(time.get(Calendar.MINUTE))
					+ String.valueOf(time.get(Calendar.SECOND))
					+ String.valueOf(rd.nextInt(100)) + "."
					+ file.getFileExt();
			// �ļ����Ϊ
			file.saveAs("/upload/temp/" + filename);
			filedir[i] = "/upload/temp/" + filename;
		}
		
		String c=su.getRequest().getParameter("CateID");
		int cateID = Integer.parseInt(c);
		String p=su.getRequest().getParameter("price");
		float price = Float.parseFloat(p);
		String intro =su.getRequest().getParameter("intro");
		String s=su.getRequest().getParameter("sex");
		short sex = Short.parseShort(s);
		String shirtName = su.getRequest().getParameter("ShirtName");
		T_shirtTo to = new T_shirtTo();
		to.setCateID(cateID);
		to.setPrice(price);
		to.setIntro(intro);
		to.setSex(sex);
		to.setShirtName(shirtName);
		to.setT_ShirtPath_1(filedir[0]);
		to.setT_ShirtPath_2(filedir[1]);
		to.setStatus(j);
		if(ShirtManager.getInstance().addshirt(to))
		resultPage = ApplicationResources.DIYSHIRT_DIYSHIRTUPLOADSUCCESS;

		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);
		return result;
	}

	@Override
	public String getName() {
		// TODO �Զ����ɷ������
		return CommandFactory.SHIRTUPLOAD;
	}

}
