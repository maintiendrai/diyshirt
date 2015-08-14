package com.diyshirt.model.command.Orders;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.OrdersManager;
import com.diyshirt.to.Page;
import com.diyshirt.util.Logger;

public class OrdersListCommand extends Command{
	
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ORDERS_LIST;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		if (request.getParameter("method").equals("admin")) {
		
		Page mypage=OrdersManager.getInstance().findOderByPage(pageNum, 10);
		request.setAttribute("mypage", mypage);
		
		resultPage = ApplicationResources.ORDERS_LIST;
		 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
		}else if (request.getParameter("method").equals("user")) {
			HttpSession session = request.getSession();
			String UserID = (String) session.getAttribute(USERID);
	
			Page mypage=OrdersManager.getInstance().findUserOderByPage(pageNum, 10,UserID);
			request.setAttribute("mypage", mypage);

			resultPage = ApplicationResources.USER_ORDERS_LIST;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}else {
		return null;
		}
	}

}
