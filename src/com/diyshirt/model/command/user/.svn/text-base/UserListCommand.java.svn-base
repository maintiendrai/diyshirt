package com.diyshirt.model.command.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.UserManager;
import com.diyshirt.to.Page;
import com.diyshirt.util.Logger;

public class UserListCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.USERLIST;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		Page mypage=UserManager.getInstance().findUserByPage(pageNum,10);
		request.setAttribute("mypage", mypage);
		
		resultPage = ApplicationResources.USER_USERLIST;
		
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	
	}
}
