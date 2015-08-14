package com.diyshirt.model.command.Administrator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.AdministratorinfoManager;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.to.AdministratorinfoTo;
import com.diyshirt.util.Logger;

public class AdminEditCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ADMIN_EDIT;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

			CommandResult result = new CommandResult();
			String resultPage = null;
			HttpSession session = request.getSession();
			AdministratorinfoTo Admin = (AdministratorinfoTo)session.getAttribute("Admin");
			int AdminID = Integer.parseInt(request.getParameter("AdminID"));
			String Password = request.getParameter("Password");

			AdministratorinfoTo to = new AdministratorinfoTo();
			to.setPassword(Password);
			to.setAdminID(AdminID);
			boolean flag = AdministratorinfoManager.getInstance().update(to);

			if (flag == true) {
				Admin.setPassword(Password);
				resultPage = ApplicationResources.ADMIN_SHOW;
				session.setAttribute("Admin", Admin);
			} else {
				throw new Exception("√‹¬Î–ﬁ∏ƒ ß∞‹£°");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

	}

}
