package com.diyshirt.model.command.Administrator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.to.AdministratorinfoTo;
import com.diyshirt.model.AdministratorinfoManager;
import com.diyshirt.util.Logger;

public class AdminLoginCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	public String getName() {
		return CommandFactory.ADMIN_LOGIN;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		CommandResult result = new CommandResult();
		String resultPage = null;
		HttpSession session = request.getSession();
		String AdminAccount = request.getParameter("adminaccount");
		String Password = request.getParameter("password");
		AdministratorinfoTo Admin = AdministratorinfoManager.getInstance().findAdminByAcc(AdminAccount);
		
		if (Admin != null) {
			if (!Admin.getPassword().equals(Password)){
				resultPage = ApplicationResources.ERROR_PAGE;
			}else{
				resultPage = ApplicationResources.ADMIN_INDEX;
				session.setAttribute("Admin", Admin);
			}
		} else {
			resultPage = ApplicationResources.ERROR_PAGE;
		}

		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
	
}
