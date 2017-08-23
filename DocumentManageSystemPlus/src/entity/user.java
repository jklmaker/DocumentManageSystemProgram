package entity;

/**
 * 抽象的User类(表明用户是写者还是管理员)
 *
 */
public class user {

	private int userType;		//0为写者，1为管理员
	
	private String name;		//名字
	private String sex;			//性别
	private String birthday;	//出生日期
	private String address;		//家庭住址
	private String telephone;	//联系方式
	private String inviter;		//推荐人(选填)
	private String industryBranch;	//行业分会
	private String specialCommittee;	//专委会
	private String password;	//密码
	
	public user() {
		
	}
	
	//带参数的构造方法(没有userType和inviter)
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
		String str = inviter==null?"暂无":this.getInviter();
		return "姓名:"+this.getName()+"性别:"+this.getSex()+"出生日期:"+this.getBirthday()+
				"家庭住址:"+this.getAddress()+"联系方式:"+this.getTelephone()
				+"推荐人:"+str+"行业分会:"+this.getIndustryBranch()+"专委会:"+this.getSpecialCommittee();
	}
}
