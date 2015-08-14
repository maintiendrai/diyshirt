package com.diyshirt.model.command.diyshirt;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.dao.*;
import com.diyshirt.model.*;

public class shirtDelCommand extends Command{
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		CommandResult result = new CommandResult();
		String resultPage = null;
		int T_ShirtID = Integer.parseInt(request.getParameter("T_ShirtID"));
		ShirtManager shirt = ShirtManager.getInstance();
		if(shirt.deleteshirt(T_ShirtID) == true)
			resultPage = ApplicationResources.UPSUCCESS;
		else
			resultPage = ApplicationResources.UPERROR;
		result.setResultPage(resultPage);
		
		return result;
	
	}
	
	public String getName() {
		return CommandFactory.SHIRTDEL;
	}
}