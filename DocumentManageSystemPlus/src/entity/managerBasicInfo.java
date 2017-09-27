package entity;

public class managerBasicInfo {

	int adminType;		//管理员身份(1为专委会,2为行业分会,3为研究会)
	String adminName;	//管理员姓名(user表里的name属性)
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
