package com.diyshirt.model.command.Manufacturersinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.ManufacturersinfoManager;
import com.diyshirt.to.ManufacturersinfoTo;
import com.diyshirt.util.Logger;

public class ManufacturersinfoAddCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	public String getName() {
		return CommandFactory.MANUFACTURERSINFO_ADD;
	} 
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		
		if (request.getParameter("method").equals("addF")) {
			resultPage = ApplicationResources.MANUFACTURERSINFO_ADD;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}
		
		if (request.getParameter("method").equals("add")) {
		String MF_Name = request.getParameter("mf_name");
		String MF_Tel = request.getParameter("mf_tel");
		String MF_Add = request.getParameter("mf_add");
		String MF_Post = request.getParameter("mf_post");
		
		ManufacturersinfoTo to = new ManufacturersinfoTo();
		to.setMF_Name(MF_Name);
		to.setMF_Tel(MF_Tel);
		to.setMF_Add(MF_Add);
		to.setMF_Post(MF_Post);
		
		boolean flag=ManufacturersinfoManager.getInstance().insert(to);
		
		if(flag==true){
			resultPage = ApplicationResources.MANUFACTURERSINFO_RETURN;
		}else{
			throw new Exception("≥ß…ÃÃÓ–¥¥ÌŒÛ ß∞‹£°");
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