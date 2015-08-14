package com.diyshirt.model.command.Administrator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.AdministratorinfoManager;
import com.diyshirt.util.Logger;

public class AdminDeleteCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ADMIN_DELETE;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int AdminID = Integer.parseInt(request.getParameter("AdminID"));
		
		boolean flag = AdministratorinfoManager.getInstance().delete(AdminID);
		
		if(flag==true){
			resultPage = ApplicationResources.ADMIN_RETURN;
		}else{
			throw new Exception("π‹¿Ì‘±…æ≥˝ ß∞‹£°");
		}
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
