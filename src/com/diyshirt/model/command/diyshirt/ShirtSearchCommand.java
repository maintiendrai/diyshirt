package com.diyshirt.model.command.diyshirt;

import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.ShirtManager;

import com.diyshirt.to.Page;
import com.diyshirt.util.Logger;

public class ShirtSearchCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO 自动生成方法存根
		CommandResult result = new CommandResult();
		String resultPage = null;

		
		String ShirtName = request.getParameter("ShirtName");
		int CateID = Integer.parseInt(request.getParameter("CateID"));
		//String operation = request.getParameter("operation");
	    
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));

		
		Page mypage=ShirtManager.getInstance().findShirt(pageNum, 4, ShirtName,
				CateID);
		
		request.setAttribute("mypage", mypage);
		request.setAttribute("ShirtName", ShirtName);
		request.setAttribute("CateID", CateID);
		
		resultPage = ApplicationResources.DIYSHIRT_DIYSEARCH;
		
		result.setResultPage(resultPage);

		logger
		.debug(this.getName() + "'s result will be sent to "
				+ resultPage);
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.DIYSEARCH;
	}

}
