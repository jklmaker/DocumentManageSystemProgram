package entity;

public class managerBasicInfo {

	int adminType;		//����Ա���(1Ϊרί��,2Ϊ��ҵ�ֻ�,3Ϊ�о���)
	String adminName;	//����Ա����(user�����name����)
	public int getAdminType() {
		return adminType;
	}
	public void setAdminType(int adminType) {
		this.adminType = adminType;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	
	public managerBasicInfo() {
		
	}
	
	public managerBasicInfo(int adminType, String adminName) {
		super();
		this.adminType = adminType;
		this.adminName = adminName;
	}
	
}
