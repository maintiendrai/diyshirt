package com.diyshirt.model.command.diyshirt;
import com.diyshirt.model.*;

import javax.servlet.http.*;

import com.diyshirt.util.*;
import com.diyshirt.to.*;
import com.diyshirt.*;
public class ShirtEditalongCommand  extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.DIYSHIRTEDIT;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		CommandResult result = new CommandResult();
		ShirtManager shirt =  ShirtManager.getInstance();
		T_shirtTo to = new T_shirtTo();
		
		String resultPage = null;
		String T_ShirtID = request.getParameter("T_ShirtID");
		String ShirtName = request.getParameter("ShirtName"); 
		String CateID = request.getParameter("CateID"); 
		float Price = Float.parseFloat(request.getParameter("Price"));  
		String Intro = request.getParameter("Intro"); 
		String Sex = request.getParameter("Sex"); 
			
		to.setT_ShirtID(Integer.parseInt(T_ShirtID));
		to.setShirtName(ShirtName);
		to.setCateID(Integer.parseInt(CateID));
		to.setPrice(Price);
		to.setIntro(Intro);
		to.setSex((short)Integer.parseInt(Sex));

			
				boolean f=shirt.updateshirt(to);
				if(f) {
					resultPage = "/shirtedit.do?operation=shirtedit&pageNum=1";
				}else {
					resultPage = ApplicationResources.ERROR_PAGE;
				}
		
		
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
