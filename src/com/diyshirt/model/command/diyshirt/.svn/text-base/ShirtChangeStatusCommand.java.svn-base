package com.diyshirt.model.command.diyshirt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.ShirtManager;
import com.diyshirt.to.Page;
import com.diyshirt.to.T_shirtTo;
import com.diyshirt.util.Logger;

public class ShirtChangeStatusCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.DIYSHIRTSTATUS;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		ShirtManager shirt = ShirtManager.getInstance();
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		short Status = (short)Integer.parseInt(request.getParameter("Status"));
		int T_ShirtID = Integer.parseInt(request.getParameter("T_ShirtID"));
		shirt.changerStatus(T_ShirtID, Status);
		Page page=shirt.findShirtByPage(pageNum,9);
		request.setAttribute("page", page);
		
		resultPage = ApplicationResources.DIYSHIRT_DIYEDIT;
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}
}
