package com.diyshirt.model.command.Feedback;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.FeedbackManager;
import com.diyshirt.to.Page;
import com.diyshirt.util.Logger;

public class FeedbackListCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.FEEDBACK_LIST;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		Page feedbackpage = FeedbackManager.getInstance().findFeeByPage(pageNum, 10);
		request.setAttribute("feedbackpage", feedbackpage);
		
		resultPage = ApplicationResources.FEEDBACK_LIST;
		
		 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}

}
