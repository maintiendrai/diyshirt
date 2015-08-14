package com.diyshirt.model.command.Administrator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.AdministratorinfoManager;
import com.diyshirt.to.Page;
import com.diyshirt.util.Logger;

public class AdminListCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		Page mypage = AdministratorinfoManager.getInstance().findAdminByPage(pageNum, 10);
		request.setAttribute("mypage", mypage);
		
		resultPage = ApplicationResources.ADMIN_LIST;
		
		result.setResultPage(resultPage);

		logger.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	
	}
	public String getName() {
		return CommandFactory.ADMIN_LIST;
	}

}
