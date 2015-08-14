package com.diyshirt.model.command.Administrator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.AdministratorinfoManager;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.to.AdministratorinfoTo;
import com.diyshirt.util.Logger;

public class AdminQueryCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ADMIN_QUERY;
	}

	public Object execute(HttpServletRequest request,

	HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		
		if (request.getParameter("method").equals("show")) {

			resultPage = ApplicationResources.ADMIN_SHOW;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

		}else if (request.getParameter("method").equals("edit")) {

			resultPage = ApplicationResources.ADMIN_EDIT;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}else if (request.getParameter("method").equals("delete")) {

			int AdminID = Integer.parseInt(request.getParameter("AdminID"));
			AdministratorinfoTo to = AdministratorinfoManager.getInstance().findAdminByID(AdminID);
			
			request.setAttribute("to", to);
			
			resultPage = ApplicationResources.ADMIN_DELETE;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}else {
			return null;
		}
	}
}
