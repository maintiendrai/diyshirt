package com.diyshirt.model.command.Feedback;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.FeedbackManager;
import com.diyshirt.to.FeedbackTo;
import com.diyshirt.util.Logger;

public class FeedbackQueryCommand extends Command{

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.FEEDBACK_QUERY;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		String UserID = request.getParameter("UserID");
		
		FeedbackTo to=FeedbackManager.getInstance().findFeeByID(UserID);
		request.setAttribute("to", to);
	
		resultPage = ApplicationResources.FEEDBACK_SHOW; 
		
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
	
	
}
