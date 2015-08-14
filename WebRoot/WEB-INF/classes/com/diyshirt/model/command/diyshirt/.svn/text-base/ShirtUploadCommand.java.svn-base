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
		// TODO 自动生成方法存根
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
     
		
		//初始化上传
		su.initialize(this.getSc(), request, response);
		// 定义允许上传文件类型
		su.setAllowedFilesList("gif,jpg,bmp,JPG,GIF,BMP");
		// 不允许上传文件类型
		su.setDeniedFilesList("jsp,asp,php,aspx,html,htm");
		// 单个文件最大限制
		su.setMaxFileSize(2 * 1024 * 1024);
		// 总共上传文件限制
		su.setTotalMaxFileSize(5 * 1024 * 1024);
		// 开始上传,如果超过限制或者为不允许类型，抛出异常提示
		su.setContentDisposition(null);
		try {
			su.upload();
		} catch (Exception e) {
			out.println("你选择的文件不允许上传或者文件过大，请返回检查！");
		}
		// 得到单个上传文件的信息
		for (int i = 0; i < su.getFiles().getCount(); i++) {
			com.diyshirt.model.upload.File file = su.getFiles().getFile(i);
			if (file.isMissing()){
				continue;
				}
			// 定义上传后另存为的文件名
			String filename = String.valueOf(time.get(Calendar.YEAR))
					+ String.valueOf(time.get(Calendar.MONTH))
					+ String.valueOf(time.get(Calendar.DAY_OF_MONTH))
					+ String.valueOf(time.get(Calendar.HOUR_OF_DAY))
					+ String.valueOf(time.get(Calendar.MINUTE))
					+ String.valueOf(time.get(Calendar.SECOND))
					+ String.valueOf(rd.nextInt(100)) + "."
					+ file.getFileExt();
			// 文件另存为
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
		// TODO 自动生成方法存根
		return CommandFactory.SHIRTUPLOAD;
	}

}
