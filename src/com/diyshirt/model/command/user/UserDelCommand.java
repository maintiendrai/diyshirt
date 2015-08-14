package com.diyshirt.model.command.user;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.FeedbackManager;
import com.diyshirt.model.UserManager;
import com.diyshirt.util.Logger;


public class UserDelCommand extends Command{
	
	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		CommandResult result = new CommandResult();
		String resultPage = null;
		String UserID = request.getParameter("UserID");
		boolean flag = UserManager.getInstance().deleteUser(UserID);
		if(flag==true){
			boolean flag1 = FeedbackManager.getInstance().delete(UserID);
			if(flag1==true)
			resultPage = ApplicationResources.USER_RETURN;
		}
		else{
			throw new Exception("»áÔ±É¾³ýÊ§°Ü£¡");
		}
		result.setResultPage(resultPage);

		logger.debug(this.getName() + "'s result will be sent to "
				+ resultPage);

		
		return result;
	}
	
	public String getName() {
		return CommandFactory.USERDEL;
	}

}
