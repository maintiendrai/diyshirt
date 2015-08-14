package com.diyshirt.model.command.Manufacturersinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.ManufacturersinfoManager;
import com.diyshirt.model.OrdersManager;
import com.diyshirt.to.OrdersTo;
import com.diyshirt.to.Page;
import com.diyshirt.util.Logger;

public class ManufacturersinfoListCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MANUFACTURERSINFO_LIST;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		Page mypage=ManufacturersinfoManager.getInstance().findMFByPage(pageNum, 10);
		request.setAttribute("mypage", mypage);
		
		if (request.getParameter("method").equals("admin")) {
			resultPage = ApplicationResources.MANUFACTURERSINFO_LIST;
		
		 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	   } else if (request.getParameter("method").equals("change")) {
		    int OrderID = Integer.parseInt(request.getParameter("OrderID"));
			
			OrdersTo to=OrdersManager.getInstance().findOderByID(OrderID);
			request.setAttribute("to", to);

			resultPage = ApplicationResources.MANUFACTURERSINFO_CHANGE;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}else {
		return null;
		}
	}
}
