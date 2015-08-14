package com.diyshirt.model.command.Message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.MessageManager;
import com.diyshirt.to.MessageTo;
import com.diyshirt.util.Logger;

public class MessageAddCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MESSAGE_ADD;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		    CommandResult result = new CommandResult();
		    String resultPage = null;
		    
		    if (request.getParameter("method").equals("addAdmin")) {
				resultPage = ApplicationResources.MESSAGE_ADD;

				result.setResultPage(resultPage);

				logger.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

				return result;
			}
		    
		    if (request.getParameter("method").equals("add")) {
			String MesTitle = request.getParameter("mestitle");
			String MesContent = request.getParameter("mescontent");
			//int AdminID = Integer.parseInt(request.getParameter("AdminID"));
			String FocTime = request.getParameter("foctime");
			String FaiTime = request.getParameter("faitime");
			int Authority = Integer.parseInt(request.getParameter("authority"));

			MessageTo to = new MessageTo();
			to.setMesTitle(MesTitle);
			to.setMesContent(MesContent);
			//to.setAdminID(AdminID);
			to.setFocTime(FocTime);
			to.setFaiTime(FaiTime);
			to.setAuthority(Authority);

			boolean flag = MessageManager.getInstance().insert(to);

			if (flag == true) {
				resultPage = ApplicationResources.MESSAGE_RETURN;
			} else {
				throw new Exception("公告新增失败！");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		    }else {
				return null;
			}
		}

	}
