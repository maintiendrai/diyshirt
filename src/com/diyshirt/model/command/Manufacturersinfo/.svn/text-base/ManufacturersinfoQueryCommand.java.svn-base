package com.diyshirt.model.command.Manufacturersinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.ManufacturersinfoManager;
import com.diyshirt.to.ManufacturersinfoTo;
import com.diyshirt.util.Logger;

public class ManufacturersinfoQueryCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MANUFACTURERSINFO_QUERY;
	}

	public Object execute(HttpServletRequest request,

	HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int MF_ID = Integer.parseInt(request.getParameter("MF_ID"));
		ManufacturersinfoTo to = ManufacturersinfoManager.getInstance().findMFByID(MF_ID);
		request.setAttribute("to", to);

		if (request.getParameter("method").equals("show")) {

			resultPage = ApplicationResources.MANUFACTURERSINFO_SHOW;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

		} else if (request.getParameter("method").equals("edit")) {

			resultPage = ApplicationResources.MANUFACTURERSINFO_EDIT;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		} else if (request.getParameter("method").equals("delete")) {

			resultPage = ApplicationResources.MANUFACTURERSINFO_DELETE;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}else {
			return null;
		}
	}
}
