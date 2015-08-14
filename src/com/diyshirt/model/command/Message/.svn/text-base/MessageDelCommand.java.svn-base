package com.diyshirt.model.command.Message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.MessageManager;
import com.diyshirt.util.Logger;

public class MessageDelCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MESSAGE_DELETE;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int MesID = Integer.parseInt(request.getParameter("MesID"));
		
		boolean flag=MessageManager.getInstance().delete(MesID);
		
		if(flag==true){
			resultPage = ApplicationResources.MESSAGE_RETURN;
		}else{
			throw new Exception("¹«¸æÉ¾³ýÊ§°Ü£¡");
		}
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
