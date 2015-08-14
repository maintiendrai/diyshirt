package com.diyshirt.model.command.Message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.MessageManager;
import com.diyshirt.to.MessageTo;
import com.diyshirt.util.Logger;

public class MessageQueryCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MESSAGE_QUERY;
	}

	public Object execute(HttpServletRequest request,

	HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		
		int MesID = Integer.parseInt(request.getParameter("MesID"));
		MessageTo to = MessageManager.getInstance().findMesByID(MesID);
		request.setAttribute("to", to);

		if (request.getParameter("method").equals("show")) {

			resultPage = ApplicationResources.MESSAGE_SHOW;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

		}else if (request.getParameter("method").equals("edit")) {

			resultPage = ApplicationResources.MESSAGE_EDIT;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}else if (request.getParameter("method").equals("user")) {

			resultPage = ApplicationResources.USER_MESSAGE_SHOW;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}else if (request.getParameter("method").equals("delete")) {

			resultPage = ApplicationResources.MESSAGE_DELETE;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}else {
			return null;
		}
	}
}
