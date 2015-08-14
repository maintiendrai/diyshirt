package com.diyshirt.model.command.Manufacturersinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.ManufacturersinfoManager;
import com.diyshirt.model.FeedbackManager;
import com.diyshirt.model.OrdersManager;
import com.diyshirt.to.FeedbackTo;
import com.diyshirt.to.OrdersTo;
import com.diyshirt.util.Logger;


public class ManufacturersinfoChangeCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MANUFACTURERSINFO_CHANGE;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int MF_ID = Integer.valueOf(request.getParameter("MF_ID"));
		String UserID = request.getParameter("UserID");
		int OrderID = Integer.valueOf(request.getParameter("OrderID"));
		
		String MF_Name = ManufacturersinfoManager.getInstance().findMFByID(MF_ID).getMF_Name();
		FeedbackTo fto = FeedbackManager.getInstance().findFeeByID(UserID);
		OrdersTo oto = OrdersManager.getInstance().findOderByID(OrderID);
		int Integral = fto.getIntegral()+oto.getNumber();
		int Feedback = fto.getFeedback()+3;
		short BookStatus = 1;
		
		oto.setBookStatus(BookStatus);
		fto.setIntegral(Integral);
		fto.setFeedback(Feedback);
		
		boolean flag = OrdersManager.getInstance().updateMF_Name(MF_Name,oto);
		if(flag==true){
			boolean flag1 = FeedbackManager.getInstance().update(fto);
			if(flag1==true){
			   resultPage = ApplicationResources.MANUFACTURERSINFO_CHANGE_RETURN;
			}
		}else{
			throw new Exception("厂商选定失败！");
		}
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}

}
