package com.diyshirt.model.command.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.UserManager;
import com.diyshirt.to.MemberinfoTo;
import com.diyshirt.util.Logger;

public class UserQueryCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.USERQUERY;
	}

	public Object execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		String UserID = request.getParameter("UserID");
		MemberinfoTo to = UserManager.getInstance().findUserByID(UserID);
		request.setAttribute("to", to);

		if (request.getParameter("method").equals("show")) {

			resultPage = ApplicationResources.USER_SHOW;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

		} else if (request.getParameter("method").equals("freeze")) {

			resultPage = ApplicationResources.USER_FREEZE;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		} else if (request.getParameter("method").equals("delete")) {

			resultPage = ApplicationResources.USER_DELETE;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		} else {
			return null;
		}
	}
}
