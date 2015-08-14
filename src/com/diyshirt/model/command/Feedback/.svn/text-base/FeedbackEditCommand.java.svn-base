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

public class FeedbackEditCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.FEEDBACK_EDIT;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (request.getParameter("method").equals("editF")) {
			CommandResult result = new CommandResult();
			String resultPage = null;
			String UserID = request.getParameter("UserID");
			FeedbackTo to = FeedbackManager.getInstance().findFeeByID(
					UserID);
			request.setAttribute("to", to);

			resultPage = ApplicationResources.FEEDBACK_EDIT;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}else if (request.getParameter("method").equals("edit")) {
			CommandResult result = new CommandResult();
			String resultPage = null;
			String UserID = request.getParameter("UserID");
			int Feedback = Integer.parseInt(request.getParameter("feedback"));
			int Integral = Integer.parseInt(request.getParameter("integral"));

			FeedbackTo to = new FeedbackTo();
			to.setUserID(UserID);
			to.setFeedback(Feedback);
			to.setIntegral(Integral);	

			boolean flag = FeedbackManager.getInstance().update(to);

			if (flag == true) {
				resultPage = ApplicationResources.FEEDBACK_RETURN;
			} else {
				throw new Exception("积分信息修改失败！");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;	
        }else{
			return null;
		}
     }
}
