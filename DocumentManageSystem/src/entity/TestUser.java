package entity;

/**
 * ���û���Ϣ��صĲ�����
 * @author LENOVO
 *
 */
public class TestUser {

	public static void main(String[] args) {
		user u1 = new author();
		u1.setName("����");
		u1.setSex("��");
		u1.setBirthday("1997-02-21");
		u1.setAddress("����");
		u1.setTelephone("888888");
		u1.setIndustryBranch("AAA");
		u1.setSpecialCommittee("BBB");
		System.out.println(u1.toString());
		
		user u2 = new manager();
		u2.setName("����");
		u2.setSex("Ů");
		u2.setBirthday("1997-02-21");
		u2.setAddress("����");
		u2.setTelephone("888888");
		u2.setIndustryBranch("AAA");
		u2.setSpecialCommittee("BBB");
		System.out.println(u2.toString());
	}
}
