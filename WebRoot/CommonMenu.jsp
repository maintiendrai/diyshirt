<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%> 
<link rel="StyleSheet" href="css/dtree.css" type="text/css" />
<script type="text/javascript" src="js/dtree.js"></script>
 
<table width=170 cellSpacing=0 cellPadding=0 border=1	borderColorDark=#ffffff borderColorLight=#999999 >
				<tr>
					<td>
						<table width=100% cellSpacing=1 cellPadding=2 border=0 >
<tr  ><td  background='image/cb_blue.gif'>  ��ӭ���� </td></tr>
<tr><td >
<div class="dtree"> 
	<a href="javascript: d.openAll();">չ��</a> | 
	<a href="javascript: d.closeAll();">����</a> <br>
	<script type="text/javascript">
		<!--
		d = new dTree('d');
		d.add(0,-1,'�ҵĲ˵�');
		
		d.add(1,0,'��������ҳ','workMain.jsp','test','_self'); 
		d.add(11,0,'ϵͳ����','qy.act?operation=notice','test','_self'); 
		
		d.add(3,0,'ר�һ�����Ϣ','','test','_self');
		d.add(4,3,'������Ϣ','qy.act?operation=expertinfo&editType=1','test','_self');
		d.add(5,3,'רҵ��Ϣ','qy.act?operation=expertinfo&editType=2','test','_self'); 
		d.add(7,3,'�޸�����','changePassword.jsp','test','_self'); 
		d.add(8,3,'�޸�ͷ��ͼƬ','uploadImg2.jsp','test','_self');  
		
		d.add(10,0,'��Ϣ����','','test','_self');
		
		d.add(12,10,'����������Ϣ','sendMessage.jsp','test','_self');
		d.add(13,10,'���յ�����Ϣ','qy.act?operation=listmessage&direction=false','test','_self');
		d.add(14,10,'�ҷ��͵���Ϣ','qy.act?operation=listmessage&direction=true','test','_self');
		
		d.add(15,0,'��ѵ�γ�','','test','_self');
		d.add(16,15,'����µ���ѵ�γ�','qy.act?operation=trainingdetail&action=add','test','_self');
		d.add(17,15,'�ҵ���ѵ�γ�','qy.act?operation=traininglist','test','_self'); 
		 
		
		d.add(25,0, '��ҵ��Ʒ','','test','_self');
		d.add(26,25,'����µ���Ʒ','qy.act?operation=workdetail&action=add','test','_self');
		d.add(27,25,'���ṩ����Ʒ','qy.act?operation=worklist','test','_self');
		 
		
		d.add(35,0,'ί�й���','','test','_self');   
		 
		d.add(44,0,'�ҵ������ʵ�','qy.act?operation=outbilllist','','_self');
		
		d.add(45,0,'�����Ͷ��','sendSysMessage.jsp','','_self','');
		d.add(46,0,'������Ϣ','help.jsp','','_self','');
		d.add(47,0,'��ϵ��վ����Ա','mailto:qunyingnet@gmail.com','','_self','');
			
		d.add(48,0,'�˳�ϵͳ','qy.act?operation=logout','','_top','image/trash.gif');
		document.write(d);
		 
		 
		//-->
	</script> 
</div>

</td></tr> 
</table>
</td>
				</tr>
			</table>
 
   
 