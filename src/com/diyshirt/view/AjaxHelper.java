package com.diyshirt.view;

import com.diyshirt.model.*;

public class AjaxHelper {
	public String isUserExist(String userID) {
		if(UserManager.getInstance().isExist(userID)){
			return "�Բ��𣬸��ʺ��Ѵ��ڣ����������롣";
		}else{
			return "��ϲ�������ʺŲ����ڣ��������롣";
		}
	}
	public String isExpertExist(String expertID) {
		if(UserManager.getInstance().isExist(expertID)){
			return "�Բ��𣬸��ʺ��Ѵ��ڣ����������롣";
		}else{
			return "��ϲ�������ʺŲ����ڣ��������롣";
		}
	}
}
