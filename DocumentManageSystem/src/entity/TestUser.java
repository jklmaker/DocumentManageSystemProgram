package entity;

/**
 * 与用户信息相关的测试类
 * @author LENOVO
 *
 */
public class TestUser {

	public static void main(String[] args) {
		user u1 = new author();
		u1.setName("张三");
		u1.setSex("男");
		u1.setBirthday("1997-02-21");
		u1.setAddress("北京");
		u1.setTelephone("888888");
		u1.setIndustryBranch("AAA");
		u1.setSpecialCommittee("BBB");
		System.out.println(u1.toString());
		
		user u2 = new manager();
		u2.setName("李四");
		u2.setSex("女");
		u2.setBirthday("1997-02-21");
		u2.setAddress("北京");
		u2.setTelephone("888888");
		u2.setIndustryBranch("AAA");
		u2.setSpecialCommittee("BBB");
		System.out.println(u2.toString());
	}
}
