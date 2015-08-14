package com.diyshirt.model.command.Manufacturersinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.ManufacturersinfoManager;
import com.diyshirt.util.Logger;


public class ManufacturersinfoDelCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MANUFACTURERSINFO_DELETE;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		Integer MF_ID = Integer.valueOf(request.getParameter("MF_ID"));
		
		boolean flag=ManufacturersinfoManager.getInstance().delete(MF_ID);
		
		if(flag==true){
			resultPage = ApplicationResources.MANUFACTURERSINFO_RETURN;
		}else{
			throw new Exception("É¾³ýÊ§°Ü£¡");
		}
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}

}
