package com.diyshirt.model.command.Orders;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.OrdersManager;
import com.diyshirt.to.OrdersTo;
import com.diyshirt.util.Logger;

public class OrdersQueryCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ORDERS_QUERY;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int OrderID = Integer.parseInt(request.getParameter("OrderID"));
		
		OrdersTo to=OrdersManager.getInstance().findOderByID(OrderID);
		request.setAttribute("to", to);
	
		if (request.getParameter("method").equals("show")) {

			resultPage = ApplicationResources.ORDERS_SHOW;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}else if (request.getParameter("method").equals("showuser")) {

			resultPage = ApplicationResources.USER_ORDERS_SHOW;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}else if (request.getParameter("method").equals("treatment")) {
			
			
			String BookTime = to.getBookTime();
            boolean flag1 = OrdersManager.getInstance().Overtime(BookTime);
			
			if(flag1==false){
				throw new Exception("订单未到处理时间！");
			}

			resultPage = ApplicationResources.ORDERS_TREATMENT;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}else if (request.getParameter("method").equals("delete")) {

			String BookTime = to.getBookTime();
            boolean flag1 = OrdersManager.getInstance().Overtime(BookTime);
			
			if(flag1==true){
				throw new Exception("订单超过可修改时间！");
			}
			
			resultPage = ApplicationResources.ORDERS_DELETE;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}else {
			return null;
		}
	}
}
