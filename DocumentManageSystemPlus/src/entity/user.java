package entity;

/**
 * �����User��(�����û���д�߻��ǹ���Ա)
 *
 */
public class user {

	private int userType;		//0Ϊд�ߣ�1Ϊ����Ա
	
	private String name;		//����
	private String sex;			//�Ա�
	private String birthday;	//��������
	private String address;		//��ͥסַ
	private String telephone;	//��ϵ��ʽ
	private String inviter;		//�Ƽ���(ѡ��)
	private String industryBranch;	//��ҵ�ֻ�
	private String specialCommittee;	//רί��
	private String password;	//����
	
	public user() {
		
	}
	
	//�������Ĺ��췽��(û��userType��inviter)
	public user(String name, String sex, String birthday, String address,
			String telephone, String industryBranch, String specialCommittee,
			String password) {
		this.name = name;
		this.sex = sex;
		this.birthday = birthday;
		this.address = address;
		this.telephone = telephone;
		this.industryBranch = industryBranch;
		this.specialCommittee = specialCommittee;
		this.password = password;
	}



	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getInviter() {
		return inviter;
	}
	public void setInviter(String inviter) {
		this.inviter = inviter;
	}
	public String getIndustryBranch() {
		return industryBranch;
	}
	public void setIndustryBranch(String industryBranch) {
		this.industryBranch = industryBranch;
	}
	public String getSpecialCommittee() {
		return specialCommittee;
	}
	public void setSpecialCommittee(String specialCommittee) {
		this.specialCommittee = specialCommittee;
	}
	
	public String toString() {
		String str = inviter==null?"����":this.getInviter();
		return "����:"+this.getName()+"�Ա�:"+this.getSex()+"��������:"+this.getBirthday()+
				"��ͥסַ:"+this.getAddress()+"��ϵ��ʽ:"+this.getTelephone()
				+"�Ƽ���:"+str+"��ҵ�ֻ�:"+this.getIndustryBranch()+"רί��:"+this.getSpecialCommittee();
	}
}
