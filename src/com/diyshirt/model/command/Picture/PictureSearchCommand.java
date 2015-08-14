package com.diyshirt.model.command.Picture;

import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.PictureManager;

import com.diyshirt.to.Page;
import com.diyshirt.util.Logger;

public class PictureSearchCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO 自动生成方法存根
		CommandResult result = new CommandResult();
		String resultPage = null;

		String PicName = request.getParameter("PicName");
		int PicCate = Integer.parseInt(request.getParameter("PicCate"));
		//String operation = request.getParameter("operation");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));

		
		Page mypage=PictureManager.getInstance().findPicture(pageNum, 6, PicName,
				PicCate);
		request.setAttribute("mypage", mypage);
		request.setAttribute("PicName", PicName);
		request.setAttribute("PicCate", PicCate);
		
		resultPage = ApplicationResources.PICTURE_PICTURESEARCHRESULT;	
		result.setResultPage(resultPage);

		logger
		.debug(this.getName() + "'s result will be sent to "
				+ resultPage);
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.PICTURESEARCH;
	}

}
