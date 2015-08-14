package com.diyshirt.model.command.Orders;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.OrdersManager;
import com.diyshirt.util.Logger;


public class OrdersDelCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ORDERS_DELETE;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		Integer OrderID = Integer.valueOf(request.getParameter("OrderID"));
		
		boolean flag=OrdersManager.getInstance().delete(OrderID);
		
		if(flag==true){
			resultPage = ApplicationResources.USER_ORDERS_RETURN;
		}else{
			throw new Exception("É¾³ýÊ§°Ü£¡");
		}
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}

}
