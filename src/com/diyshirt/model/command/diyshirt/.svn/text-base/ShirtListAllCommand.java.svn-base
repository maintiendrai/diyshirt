package com.diyshirt.model.command.diyshirt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.ShirtManager;
import com.diyshirt.to.Page;
import com.diyshirt.util.Logger;

public class ShirtListAllCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.DIYSHIRTLISTALL;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		Page page=ShirtManager.getInstance().findShirtByPage(pageNum,9);
		request.setAttribute("page", page);
		
		resultPage = ApplicationResources.DIYSHIRT_DIYLISTALL;
		
		 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}
}