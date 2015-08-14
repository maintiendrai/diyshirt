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
import com.diyshirt.to.T_shirtrecommendedTo;
import com.diyshirt.util.Logger;

public class ShirtRecommendedCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.SHIRTRECOMMENDED;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		String T_ShirtID = (String)request.getParameter("T_ShirtID");
		ShirtManager shirt = ShirtManager.getInstance();
		String act = request.getParameter("act");
		int num = shirt.ShirtNum();
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		Page page=ShirtManager.getInstance().findShirtByPage(pageNum,9);
		request.setAttribute("page", page);
		boolean flag = false;
		
		if(act.equals("recommended")){
			T_shirtrecommendedTo to = new T_shirtrecommendedTo();
			to.setT_ShirtID(Integer.parseInt(T_ShirtID));
			to.setT_RM_Order(num+1);
			flag=shirt.ShirtRecommended(to);
		}
		if(act.equals("cancelrecommended")){
			flag = shirt.cancelrecommended(Integer.parseInt(T_ShirtID));
		}
		if(flag==true){
			resultPage = ApplicationResources.DIYSHIRT_DIYCOMMENDED;
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
