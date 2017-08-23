package entity;

public class manager extends user{
	
	public manager() {
		this.setUserType(1);	//是管理者，userType为1
	}
	
	public String toString() {
		return "属性:管理者"+super.toString();
	}

}
