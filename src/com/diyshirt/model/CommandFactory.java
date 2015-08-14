package com.diyshirt.model;

import java.util.*;

import com.diyshirt.model.command.Administrator.*;
import com.diyshirt.model.command.Orders.*;
import com.diyshirt.model.command.Manufacturersinfo.*;
import com.diyshirt.model.command.Feedback.*;
import com.diyshirt.model.command.Message.*;
import com.diyshirt.model.command.user.*;
import com.diyshirt.model.command.Picture.*;
import com.diyshirt.model.command.diyshirt.*;
import com.diyshirt.util.Logger;

public class CommandFactory {
	private static HashMap commandTimes = new HashMap();

	private static HashMap commandUsedTime = new HashMap();

	public static final String REDIRECT = "redirect";

	public static final String LOGIN = "login";

	public static final String LOGOUT = "logout";

	public static final String SEARCH = "search";

	public static final String NOTICE_LIST = "noticelist";

	public static final String NOTICE_EDIT = "noticeedit";

	public static final String NOTICE_MANAGER_DETAIL = "noticemanagerdetail";

	public static final String NOTICE = "notice";

	public static final String NOTICE_DETAIL = "noticedetail";

	public static final String RECOMMEND = "recommend";

	public static final String EXPERT_DETAIL = "expertdetail";

	public static final String EXPERT_EDIT = "expertedit";

	public static final String EXPERT_INFO = "expertinfo";

	public static final String EXPERT_REGISTER = "expertregister";

	public static final String USER_REGISTER = "userregister";

	public static final String USER_DETAIL = "userdetail";

	public static final String USER_EDIT = "useredit";

	public static final String USER_LIST = "userlist";

	public static final String TRAINING_DETAIL = "trainingdetail";

	public static final String WORK_DETAIL = "workdetail";

	public static final String WANTED_ORDER = "wantedorder";

	public static final String WANTED_DETAIL = "wanteddetail";

	public static final String WANTED_EDIT = "wantededit";

	public static final String WANTED_LIST = "wantedlist";

	public static final String SEND_MESSAGE = "sendmessage";

	public static final String LIST_MESSAGE = "listmessage";

	public static final String MESSAGE_DETAIL = "messagedetail";

	public static final String TRAINING_ORDER = "trainingorder";

	public static final String TRAINING_EDIT = "trainingedit";

	public static final String TRAINING_LIST = "traininglist";

	public static final String WORK_ORDER = "workorder";

	public static final String WORK_EDIT = "workedit";

	public static final String WORK_LIST = "worklist";

	public static final String EXPERT_BASIC_MODIFY = "expertbasicmodify";

	public static final String EXPERT_FLEXIBLE_MODIFY = "expertflexiblemodify";

	public static final String EXPERT_LIST = "expertlist";

	public static final String EXPERT_LEVEL = "expertlevel";

	public static final String USER_LEVEL = "userlevel";

	public static final String CHANGE_PASSWORD = "changepassword";

	public static final String RESET_PASSWORD = "resetpassword";

	public static final String UPLOAD_EXPERT_IMAGE = "uploadimage";

	public static final String ORDER_LIST = "orderlist";

	public static final String ORDER_UNDOEN_LIST = "orderundonelist";

	public static final String ORDER_DETAIL = "orderdetail";

	public static final String ORDER_EDIT = "orderedit";

	public static final String ORDER_QUALITY = "orderquality";

	public static final String ORDER_QUALITY_LIST = "orderqualitylist";

	public static final String WANTED_APPLY = "wantedapply";

	public static final String INBILL_LIST = "inbilllist";

	public static final String OUTBILL_LIST = "outbilllist";

	public static final String INBILL_EDIT = "inbilledit";

	public static final String OUTBILL_EDIT = "outbilledit";

	public static final String EXPERT_MOD_LIST = "expertmodlist";

	public static final String EXPERT_MOD_DETAIL = "expertmoddetail";

	public static final String EXPERT_MOD_EDIT = "expertmodedit";

	public static final String RECOMMEND_LIST = "recommendlist";

	public static final String RECOMMEND_EDIT = "recommendedit";

	public static final String RECOMMEND_DETAIL = "recommenddetail";

	public static final String MANAGER_LIST = "managerlist";

	public static final String MANAGER_EDIT = "manageredit";

	public static final String MANAGER_DETAIL = "managerdetail";

	public static final String ADVERTISE_LIST = "advertiselist";

	public static final String ADVERTISE_EDIT = "advertiseedit";

	public static final String ADVERTISE_DETAIL = "advertisedetail";
	
	
	public static final String LINK_LIST = "linklist";

	public static final String LINK_EDIT = "linkedit";

	public static final String LINK_DETAIL = "linkdetail";
	public static final String LINK_APPLY = "linkapply";
	public static final String LINK_GO = "linkgo";

	public static final String VIPREQUEST_LIST = "viprequestlist";

	public static final String VIPREQUEST_EDIT = "viprequestedit";

	public static final String COMMENT_LIST = "commentlist";
	
	public static final String MESSAGE_ADD = "messageadd";          //��������
	
	public static final String MESSAGE_EDIT = "messageedit";        //�����޸�
	
	public static final String MESSAGE_DELETE = "messagedelete";    //����ɾ��
	
	public static final String MESSAGE_LIST = "messagelist";        //�����б�
	 
	public static final String MESSAGE_QUERY = "messagequery";      //����鿴
	
	public static final String ORDERS_ADD = "ordersadd";            //��������
	
	public static final String ORDERS_EDIT = "ordersedit";          //�����޸�
	
	public static final String ORDERS_DELETE = "ordersdelete";      //����ɾ��
	
	public static final String ORDERS_LIST = "orderslist";          //�����б�
	
	public static final String ORDERS_QUERY = "ordersquery";        //�����鿴
	
	public static final String FEEDBACK_EDIT = "feedbackedit";      //�����޸�

	public static final String FEEDBACK_LIST = "feedbacklist";      //�����б�
	
	public static final String FEEDBACK_QUERY = "feedbackquery";    //���ֲ鿴
	
	public static final String MANUFACTURERSINFO_ADD = "manufacturersinfoadd";        //������Ϣ����
	
	public static final String MANUFACTURERSINFO_EDIT = "manufacturersinfoedit";       //������Ϣ�޸�
	
	public static final String MANUFACTURERSINFO_DELETE = "manufacturersinfodelete";   //������Ϣɾ��
	
	public static final String MANUFACTURERSINFO_LIST = "manufacturersinfolist";       //������Ϣ�б�
	
	public static final String MANUFACTURERSINFO_QUERY = "manufacturersinfoquery";       //������Ϣ�鿴
	
	public static final String MANUFACTURERSINFO_CHANGE = "manufacturersinfochange";       //����ѡ��
	
	public final static String USERREGEDIT = "userregedit";          //�û�ע��
	public final static String USERLOGIN = "userlogin";              //�û���¼
	public final static String USERCHANGEPASSWORD = "changepwd";     //�޸��û�����
	public final static String USEREDIT = "useredit";                //�û������޸�
	public final static String USERLIST = "userlist";                //�û��б�
	public final static String USERQUERY = "userquery";              //�û��鿴
	public final static String USERFREEZE = "userfreeze";            //�û�״̬�޸�
	public final static String USERDEL = "userdel";               //�û�ɾ��
	
	public final static String PICTURELIST = "picturelist";          //ָ���û��ϴ�ͼƬ�б�
	public final static String PICLISTALL = "picturelistall";        //ȫ��ͼƬ�б�
	public final static String PICTUREFAVOURIT = "picturefavarit";   //�ղ�ͼƬ
	public final static String PICTUREREPORT = "picturereport";      //ͼƬ�ٱ�
	public final static String PICADDLIST = "picaddlist";            //����Ա�鿴ͼƬ
	public final static String PICFAVLIST = "picfavlist";            //�鿴�û��ղ�ͼƬ
	public final static String PICTURERECOMMANDED = "picrecommended";//�Ƽ�ͼƬ
	public final static String PICTURESEARCH = "picturesearch";      //ͼƬ����
	public final static String RECOMMENDED="recommended";            //ͼƬ�Ƽ��ɹ�
	public final static String PICREMOVELIST = "picremovelist";      //ͼƬɾ���б�
	public final static String PICTUREREMOVE = "pictureremove";      //ͼƬɾ��
	public final static String PICTUREREPORTLIST = "reportlist";     //ͼƬ�ٱ��б�
	public final static String PICTURETREAT = "picturetreat";        //ͼƬ�ٱ�����
	public final static String PICTURERCSHOW="picturercshow";        //���ͼƬ�Ƽ���ʾ
	
	public final static String DIYSHIRTCUSTOM = "diyshirtcustom";    //�Ļ�������
	public final static String DIYSHIRTADD = "diyshirtadd";          //�����Ļ���
	public final static String DIYSHIRTLISTALL = "diyshirtlistall";  //��ѯȫ���Ļ���
	public final static String SHIRTDEL = "shirtdel";                //ɾ���Ļ���
	public final static String SHIRTEDIT = "shirtedit";              //�޸��Ļ���
	public final static String SHIRTRECOMMENDED = "shirtrecommended";  //�Ļ����Ƽ�ǰ��
	public final static String SHIRTCOMMENDED = "shirtcommended";  //�Ļ����Ƽ�
	public final static String SHIRTCUSTOMSUCCESS = "shirtcustomsuccess";//�Ļ������Ƴɹ�
	public final static String DIYSHIRTCUSTOMLISTALL = "diyshirtcustomlistall";//��ѯȫ�������Ļ���
	public final static String SHIRTCOMMENDSHOW = "shirtcommendshow";//��ʾ�Ļ����Ƽ�
	public final static String DIYSEARCH = "diysearch";               //�Ļ�������
	public final static String DIYSHIRTEDIT ="shirteditalong";        //�Ļ����༭
	public final static String DIYSHIRTSTATUS = "shirtstatus";        //�Ļ���״̬�޸�
	public final static String DIYSHIRTFAVLIST = "shirtfavlist";      //�鿴�û��ղ��Ļ���
	public final static String DIYSHIRTUSERCUSTOMLIST = "shirtusercustomlist";//�鿴�û������Ļ���
	  

	
	public final static String  ADMIN_LOGIN="adminlogin";  //����Ա��¼
	public final static String  ADMIN_LIST="adminlist";    //����Ա�б�
	public final static String  ADMIN_EDIT="adminedit";    //����Ա�޸�
	public final static String  ADMIN_QUERY="adminquery";  //����Ա�鿴
	public final static String  ADMIN_DELETE="admindelete";//����Աɾ��
	public final static String  ADMIN_ADD="adminadd";      //����Ա���


	  public final static String SHOWIT="showit";
	
	  public final static String EDITIT= "editit";
	  
	  public final static String DELIT= "delit";
	  
	  
	  public final static String  UPDATEIT="updateit";//�޸���Ϣ
	  
	  public final static String  ITINFOUP= "itinfoup";//�޸ĸ��˻�����Ϣ
	  

public final static String SHIRTUPLOAD="shirtupload";  //�Ļ����ϴ�
	  
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.diyshirt.util.Logger.appender);

	private static CommandFactory instance = null;

	private HashMap commands = new HashMap();

	private CommandFactory() {

		//ChangePasswordCommand changePasswordCommand = new ChangePasswordCommand();
		//commands.put(changePasswordCommand.getName().toLowerCase(),
		//		changePasswordCommand);
 

		//UploadImageCommand uploadImageCommand = new UploadImageCommand();
		//commands.put(uploadImageCommand.getName().toLowerCase(),
		//		uploadImageCommand);


		UserEditCommand userEditCommand = new UserEditCommand();
		commands.put(userEditCommand.getName().toLowerCase(), userEditCommand);

		UserRegisterCommand userRegisterCommand = new UserRegisterCommand();
		commands.put(userRegisterCommand.getName().toLowerCase(),
				userRegisterCommand);
		
		UserLogoutCommand userLogoutCommand = new UserLogoutCommand();   //�û�ע��
		commands.put(userLogoutCommand.getName().toLowerCase(),
				userLogoutCommand);
        
		OrdersAddCommand OrdersAddCommand = new OrdersAddCommand();      //��������
		commands.put(OrdersAddCommand.getName().toLowerCase(),
				OrdersAddCommand);
		
		OrdersListCommand OrdersListCommand = new OrdersListCommand();   //�����б�
		commands.put(OrdersListCommand.getName().toLowerCase(),
				OrdersListCommand);
		
		OrdersEditCommand OrdersEditCommand = new OrdersEditCommand();   //�����޸�
		commands.put(OrdersEditCommand.getName().toLowerCase(),
				OrdersEditCommand);
		
		OrdersDelCommand OrdersDelCommand = new OrdersDelCommand();      //����ɾ��
		commands.put(OrdersDelCommand.getName().toLowerCase(),
				OrdersDelCommand);
		
		OrdersQueryCommand OrdersQueryCommand=new OrdersQueryCommand();  //�����鿴��user��
		commands.put(OrdersQueryCommand.getName().toLowerCase(),
				OrdersQueryCommand);
		
		MessageAddCommand MessageAddCommand = new MessageAddCommand();      //��������
		commands.put(MessageAddCommand.getName().toLowerCase(),
				MessageAddCommand);
		
		MessageListCommand MessageListCommand = new MessageListCommand();   //�����б�
		commands.put(MessageListCommand.getName().toLowerCase(),
				MessageListCommand);
		
		MessageEditCommand MessageEditCommand = new MessageEditCommand();   //�����޸�
		commands.put(MessageEditCommand.getName().toLowerCase(),
				MessageEditCommand);
		
		MessageDelCommand MessageDelCommand = new MessageDelCommand();      //����ɾ��
		commands.put(MessageDelCommand.getName().toLowerCase(),
				MessageDelCommand);
		
		MessageQueryCommand MessageQueryCommand=new MessageQueryCommand();  //����鿴
		commands.put(MessageQueryCommand.getName().toLowerCase(),
				MessageQueryCommand);
		
		ManufacturersinfoAddCommand ManufacturersinfoAddCommand = new ManufacturersinfoAddCommand();      //������Ϣ����
		commands.put(ManufacturersinfoAddCommand.getName().toLowerCase(),
				ManufacturersinfoAddCommand);
		
		ManufacturersinfoListCommand ManufacturersinfoListCommand = new ManufacturersinfoListCommand();   //������Ϣ�б�
		commands.put(ManufacturersinfoListCommand.getName().toLowerCase(),
				ManufacturersinfoListCommand);
		
		ManufacturersinfoEditCommand ManufacturersinfoeditCommand = new ManufacturersinfoEditCommand();   //������Ϣ�޸�
		commands.put(ManufacturersinfoeditCommand.getName().toLowerCase(),
				ManufacturersinfoeditCommand);
		
		ManufacturersinfoDelCommand ManufacturersinfoDelCommand = new ManufacturersinfoDelCommand();      //������Ϣɾ��
		commands.put(ManufacturersinfoDelCommand.getName().toLowerCase(),
				ManufacturersinfoDelCommand);
		
		ManufacturersinfoQueryCommand ManufacturersinfoQueryCommand = new ManufacturersinfoQueryCommand();      //������Ϣ�鿴
		commands.put(ManufacturersinfoQueryCommand.getName().toLowerCase(),
				ManufacturersinfoQueryCommand);
		
		ManufacturersinfoChangeCommand ManufacturersinfoChangeCommand = new ManufacturersinfoChangeCommand();      //������Ϣ�鿴
		commands.put(ManufacturersinfoChangeCommand.getName().toLowerCase(),
				ManufacturersinfoChangeCommand);
		
		FeedbackListCommand FeedbackListCommand = new FeedbackListCommand();   //�����б�
		commands.put(FeedbackListCommand.getName().toLowerCase(),
				FeedbackListCommand);
		
		FeedbackEditCommand FeedbackEditCommand = new FeedbackEditCommand();   //�����޸�
		commands.put(FeedbackEditCommand.getName().toLowerCase(),
				FeedbackEditCommand);
		
		FeedbackQueryCommand FeedbackQueryCommand=new FeedbackQueryCommand();  //���ֲ鿴��user��
		commands.put(FeedbackQueryCommand.getName().toLowerCase(),
				FeedbackQueryCommand);
	    
		UserDelCommand userdelCommand=new UserDelCommand();//�û�ɾ��
		commands.put(userdelCommand.getName().toLowerCase(), userdelCommand);
		
		UserRegisterCommand userregeditCommand = new UserRegisterCommand();//�û�ע��
		commands.put(userregeditCommand.getName().toLowerCase(), userregeditCommand);
		
		UserloginCommand userloginCommand = new UserloginCommand();//�û���¼
		commands.put(userloginCommand.getName().toLowerCase(),userloginCommand);
		
		UserEditCommand usereditCommand = new UserEditCommand();//�û������޸�
		commands.put(usereditCommand.getName().toLowerCase(), usereditCommand);
		
		UserFreezeCommand userfreezeCommand = new UserFreezeCommand();//�û�״̬�޸�
		commands.put(userfreezeCommand.getName().toLowerCase(), userfreezeCommand);
		
		UserChangePasswordCommand userchangepasswordCommand = new UserChangePasswordCommand();//�û������޸�
		commands.put(userchangepasswordCommand.getName().toLowerCase(), userchangepasswordCommand);
		
		UserListCommand userListCommand = new UserListCommand();//�û��б�
		commands.put(userListCommand.getName().toLowerCase(), userListCommand);
		
		UserQueryCommand userQueryCommand = new UserQueryCommand();//�û��鿴
		commands.put(userQueryCommand.getName().toLowerCase(), userQueryCommand);
		
		AdminLoginCommand adminloginCommand = new AdminLoginCommand();//����Ա��¼
		commands.put(adminloginCommand.getName().toLowerCase(),adminloginCommand);
		
		AdminAddCommand adminaddCommand = new AdminAddCommand();//����Ա���
		commands.put(adminaddCommand.getName().toLowerCase(),adminaddCommand);
		
		AdminListCommand adminlistCommand = new AdminListCommand();//����Ա�б�
		commands.put(adminlistCommand.getName().toLowerCase(),adminlistCommand);
		
		AdminQueryCommand adminqueryCommand = new AdminQueryCommand();//����Ա�鿴
		commands.put(adminqueryCommand.getName().toLowerCase(),adminqueryCommand);
		
		AdminEditCommand admineditCommand = new AdminEditCommand();//����Ա�޸�
		commands.put(admineditCommand.getName().toLowerCase(),admineditCommand);
		
		AdminDeleteCommand admindeleteCommand = new AdminDeleteCommand();//����Աɾ��
		commands.put(admindeleteCommand.getName().toLowerCase(),admindeleteCommand);
		
		PictureListCommand picturelistCommand = new PictureListCommand();//�鿴ָ���û��ϴ�ͼƬ�б�
		commands.put(picturelistCommand.getName().toLowerCase(),picturelistCommand);
		
		PicListAllCommand piclistCommand = new PicListAllCommand();//�鿴����ͼƬ
		commands.put(piclistCommand.getName().toLowerCase(),piclistCommand);
		
		PictureFavouritCommand picturefavouritCommand = new PictureFavouritCommand();//�ղ�ͼƬ
		commands.put(picturefavouritCommand.getName().toLowerCase(), picturefavouritCommand);
		
		PictureReportCommand picturereportCommand = new PictureReportCommand();//�ٱ�ͼƬ
		commands.put(picturereportCommand.getName().toLowerCase(), picturereportCommand);
		
		PicAddListCommand picaddlistCommand = new PicAddListCommand();//����Ա�鿴ͼƬ
		commands.put(picaddlistCommand.getName().toLowerCase(),picaddlistCommand);
		
		PictureSearchCommand picturesearchCommand = new PictureSearchCommand();//ͼƬ����
		commands.put(picturesearchCommand.getName().toLowerCase(),picturesearchCommand);
		
		PictureRCCommand picturerccommand = new PictureRCCommand();//�Ƽ�ͼƬ
		commands.put(picturerccommand.getName().toLowerCase(),picturerccommand);
		
		PicRCsuccCommand picturercsuccCommand = new PicRCsuccCommand();//ͼƬ�Ƽ��ɹ�
		commands.put(picturercsuccCommand.getName().toLowerCase(),picturercsuccCommand);
		
		PicCustomCommand piccustomCommand = new PicCustomCommand();//�Ļ�������ҳ��
		commands.put(piccustomCommand.getName().toLowerCase(),piccustomCommand);
		
		PicAdminRemoveListCommand picadminremovelistCommand = new PicAdminRemoveListCommand();//ͼƬ�����б�
		commands.put(picadminremovelistCommand.getName().toLowerCase(),picadminremovelistCommand);
		
		PicReportListCommand picreportlistCommand = new PicReportListCommand();//ͼƬ�ٱ��б�
		commands.put(picreportlistCommand.getName().toLowerCase(),picreportlistCommand);
		
		PicAdminRemoveCommand picadminremoveCommand = new PicAdminRemoveCommand();//ͼƬɾ��
		commands.put(picadminremoveCommand.getName().toLowerCase(),picadminremoveCommand);
		
		PicturetreatCommand picturetreatCommand = new PicturetreatCommand();//ͼƬ�ٱ�����
		commands.put(picturetreatCommand.getName().toLowerCase(),picturetreatCommand);
		
		PicFavListCommand picfavlistCommand = new PicFavListCommand();//�鿴�û��ղ�ͼƬ�б�
		commands.put(picfavlistCommand.getName().toLowerCase(),picfavlistCommand);
		
		PictureRCShowCommand picturercshowCommand = new PictureRCShowCommand();//�鿴�û��ղ�ͼƬ�б�
		commands.put(picturercshowCommand.getName().toLowerCase(),picturercshowCommand);
		
		ShirtListAllCommand shirtlistallCommand = new ShirtListAllCommand();//ȫ���Ļ����б�
		commands.put(shirtlistallCommand.getName().toLowerCase(), shirtlistallCommand);
		
		ShirtCustomCommand shirtcustomCommand = new ShirtCustomCommand();//�Ļ������Ƴɹ�
		commands.put(shirtcustomCommand.getName().toLowerCase(),shirtcustomCommand);
		
		ShirtCustomListCommand shirtcustomlistCommand = new ShirtCustomListCommand();//ȫ�������Ļ����б�
		commands.put(shirtcustomlistCommand.getName().toLowerCase(),shirtcustomlistCommand);
		
		ShirtCommendedCommand shirtcommendedCommand = new ShirtCommendedCommand();//�Ļ����Ƽ�
		commands.put(shirtcommendedCommand.getName().toLowerCase(),shirtcommendedCommand);

		ShirtSearchCommand shirtsearchCommand = new ShirtSearchCommand();//�Ļ�������
		commands.put(shirtsearchCommand.getName().toLowerCase(),shirtsearchCommand);
		
		ShirtRecommendedCommand shirtrecommendedCommand = new ShirtRecommendedCommand();//�Ļ����Ƽ��ɹ�
		commands.put(shirtrecommendedCommand.getName().toLowerCase(),shirtrecommendedCommand);
		
		ShirtCommendShowCommand shirtcommendshowCommand = new ShirtCommendShowCommand();//�Ļ����Ƽ�ҳ����ʾ
		commands.put(shirtcommendshowCommand.getName().toLowerCase(),shirtcommendshowCommand);
		
		ShirtEditCommand shirteditCommand = new ShirtEditCommand();//�Ļ�������
		commands.put(shirteditCommand.getName().toLowerCase(),shirteditCommand);
		
		ShirtEditalongCommand shirteditalongCommand = new ShirtEditalongCommand();//�Ļ����༭
		commands.put(shirteditalongCommand.getName().toLowerCase(),shirteditalongCommand);
		
		ShirtChangeStatusCommand shirtchangestatusCommand = new ShirtChangeStatusCommand();//�Ļ���״̬�޸�
		commands.put(shirtchangestatusCommand.getName().toLowerCase(),shirtchangestatusCommand);
		
		ShirtFavListCommand shirtfavlistCommand = new ShirtFavListCommand();//�鿴�û��ղ��Ļ���
		commands.put(shirtfavlistCommand.getName().toLowerCase(),shirtfavlistCommand);
		
		ShirtUserCustomListCommand shirtusercustomlistCommand = new ShirtUserCustomListCommand();//�鿴�û������Ļ����б�
		commands.put(shirtusercustomlistCommand.getName().toLowerCase(),shirtusercustomlistCommand);
		
		ShirtUploadCommand shirtuploadCommand = new ShirtUploadCommand();//�Ļ����ϴ�
		commands.put(shirtuploadCommand.getName().toLowerCase(),shirtuploadCommand);
	}

	public static CommandFactory getInstance() {
		if (instance == null)
			instance = new CommandFactory();
		return instance;
	}

	public Command create(String cmdType) {
		// System.out.println("Command: "+cmdType);
		String commandName = cmdType.toLowerCase();

		Command cmd = (Command) commands.get(commandName);

		if (cmd != null) {
			if (commandTimes.containsKey(commandName)) {
				long t = ((Long) commandTimes.get(commandName)).longValue();
				commandTimes.put(commandName, new Long(t + 1));
				
			} else {
				commandTimes.put(commandName, new Long(1));
			}
		}
		return cmd;
	}

	public static void commandUsedTime(String commandName, long usedtime) {
		if (commandUsedTime.containsKey(commandName)) {
			long t = ((Long) commandUsedTime.get(commandName)).longValue();
			commandUsedTime.put(commandName, new Long(t + usedtime));
		} else {
			commandUsedTime.put(commandName, new Long(usedtime));
		}
	}

	public static void showCommandHistory() {
		logger.info("showCommandHistory...");
		logger.info("Commands invoked times: "+commandTimes.toString());
		logger.info("Commands cost time (ms): "+commandUsedTime.toString());
		logger.info("showCommandHistory end.");
	}

}
