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
import com.diyshirt.to.T_shirtTo;
import com.diyshirt.util.Logger;

public class OrdersAddCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	public String getName() {
		return CommandFactory.ORDERS_ADD;
	}
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		
		System.out.println(request.getParameter("UserID"));
		String UserID = request.getParameter("UserID");
		if (request.getParameter("method").equals("addL")) {
			int CustomID = Integer.parseInt(request.getParameter("CustomID"));
			
			T_ShirtCustomTo to = ShirtManager.getInstance().diyshirtinfo(CustomID);
			request.setAttribute("to", to);
			resultPage = ApplicationResources.ORDERS_ADD;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}
		
		if (request.getParameter("method").equals("add")) {
		int CustomID = Integer.parseInt(request.getParameter("CustomID")); 
		int T_ShirtID = Integer.parseInt(request.getParameter("T_ShirtID"));
		T_shirtTo shirt = ShirtManager.getInstance().shirtinfo(T_ShirtID);
		float Price = shirt.getPrice();
		int Number = Integer.parseInt(request.getParameter("Number"));
		String Size = request.getParameter("size");
		short BookStatus = 0;
		float AllPrice = Price*Number;
		String MF_Name = "";
		
		OrdersTo to = new OrdersTo();
		to.setCustomID(CustomID);
		to.setUserID(UserID);
		to.setNumber(Number);
		to.setSize(Size);
		to.setBookStatus(BookStatus);
		to.setAllPrice(AllPrice);
		to.setMF_Name(MF_Name);
		
		boolean flag=OrdersManager.getInstance().insert(to);
		
		if(flag==true){
			resultPage = ApplicationResources.USER_ORDERS_RETURN;
		}else{
			throw new Exception("∂©µ•ÃÓ–¥¥ÌŒÛ ß∞‹£°");
		}
 
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
