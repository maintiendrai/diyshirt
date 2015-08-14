package com.diyshirt.model.command.Administrator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.AdministratorinfoManager;
import com.diyshirt.to.AdministratorinfoTo;
import com.diyshirt.util.Logger;

public class AdminAddCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	public String getName() {
		return CommandFactory.ADMIN_ADD;
	} 
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		
		if (request.getParameter("method").equals("addL")) {
			resultPage = ApplicationResources.ADMIN_ADD;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}
		
		if (request.getParameter("method").equals("add")) {
		String AdminAccount = request.getParameter("AdminAccount");
		String Password = request.getParameter("Password");
		
		AdministratorinfoTo to = new AdministratorinfoTo();
		to.setAdminAccount(AdminAccount);
		to.setPassword(Password);
		
		boolean flag=AdministratorinfoManager.getInstance().insert(to);
		
		if(flag==true){
			resultPage = ApplicationResources.ADMIN_RETURN;
		}else{
			throw new Exception("管理员添加错误失败！");
		}
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}else {
		return null;
	}
		
   }
}