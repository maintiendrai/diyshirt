package com.diyshirt.model.command.Message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.MessageManager;
import com.diyshirt.to.Page;
import com.diyshirt.util.Logger;

public class MessageListCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MESSAGE_LIST;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));

		if (request.getParameter("method").equals("admin")) {
			
		Page mypage=MessageManager.getInstance().findMesByPage(pageNum, 10);
		request.setAttribute("mypage", mypage);	
		
		resultPage = ApplicationResources.MESSAGE_LIST;
		
		 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}else if (request.getParameter("method").equals("tourist")) {
		
		
		int Authority = 0;
		Page mypage=MessageManager.getInstance().findMesByPage(pageNum, 5 ,Authority);
		request.setAttribute("mypage", mypage);	
		
		resultPage = ApplicationResources.TOURIST_MESSAGE_LIST;
		
		 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}else if (request.getParameter("method").equals("user")) {
		
		
		int Authority = 1;
		Page mypage=MessageManager.getInstance().findMesByPage(pageNum, 5 ,Authority);
		request.setAttribute("mypage", mypage);	
		
		resultPage = ApplicationResources.USER_MESSAGE_LIST;
		
		 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}else {
	return null;
	}
    }
}

