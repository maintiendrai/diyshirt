package com.diyshirt.model.command.Picture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.PictureManager;
import com.diyshirt.to.Page;
import com.diyshirt.util.Logger;
import com.diyshirt.to.ReportinfoTo;

public class PictureReportCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.PICTUREREPORT;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		
		String PicID = (String)request.getParameter("picid");
		HttpSession session = request.getSession();
		String UserID = (String)session.getAttribute("UserID");
		
		ReportinfoTo to = new ReportinfoTo();
		to.setPicID(Integer.parseInt(PicID));
		to.setUserID(UserID);
		to.setStatus((short)1);
		
		boolean flag=PictureManager.getInstance().addReport(to);
		
		if(flag==true){
			resultPage = ApplicationResources.PICREPSUC;
		}else{
			resultPage = ApplicationResources.ERROR_PAGE;
		}
		
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}

}
