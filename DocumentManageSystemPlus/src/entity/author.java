package entity;

public class author extends user{
	
	public author() {
		this.setUserType(0);	//��д��,userTypeΪ0
	}
	
	public String toString() {
		return "����:д��"+super.toString();
	}

}
