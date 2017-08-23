package entity;

public class author extends user{
	
	public author() {
		this.setUserType(0);	//是写者,userType为0
	}
	
	public String toString() {
		return "属性:写者"+super.toString();
	}

}
