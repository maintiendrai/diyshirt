package com.diyshirt.model.command.Orders;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.OrdersManager;
import com.diyshirt.model.ShirtManager;
import com.diyshirt.to.OrdersTo;
import com.diyshirt.to.T_ShirtCustomTo;
import com.diyshirt.util.Logger;

public class OrdersEditCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ORDERS_EDIT;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		
		Integer OrderID = Integer.valueOf(request.getParameter("OrderID"));
		OrdersTo to = OrdersManager.getInstance().findOderByID(OrderID);
		T_ShirtCustomTo cto = ShirtManager.getInstance().diyshirtinfo(to.getCustomID());
		request.setAttribute("to",to);
		request.setAttribute("cto",cto);
		
		if (request.getParameter("method").equals("editUOL")) {
			
			String BookTime = to.getBookTime();
            boolean flag1 = OrdersManager.getInstance().Overtime(BookTime);
			
			if(flag1==true){
				throw new Exception("订单修改过期！");
			}
			
			resultPage = ApplicationResources.ORDERS_EDIT;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

		} else if (request.getParameter("method").equals("edit")) {

			int CustomID = Integer.parseInt(request.getParameter("CustomID")); 
			int Number = Integer.parseInt(request.getParameter("Number"));
			String UserID = request.getParameter("UserID");
			String Size = request.getParameter("size");
			//float AllPrice = Float.parseFloat(request.getParameter("AllPrice"));
			
			
			OrdersTo oto = new OrdersTo();
			oto.setCustomID(CustomID);
			oto.setNumber(Number);
			oto.setOrderID(OrderID);
			oto.setUserID(UserID);
			oto.setSize(Size);

			boolean flag = OrdersManager.getInstance().update(oto);

			if (flag == true) {
				resultPage = ApplicationResources.USER_ORDERS_RETURN;
			} else {
				throw new Exception("订单修改失败！");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

		} else{
			return null;
		}

	}

}
