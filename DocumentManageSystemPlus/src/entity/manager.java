package entity;

public class manager extends user{
	
	public manager() {
		this.setUserType(1);	//�ǹ����ߣ�userTypeΪ1
	}
	
	public String toString() {
		return "����:������"+super.toString();
	}

}
