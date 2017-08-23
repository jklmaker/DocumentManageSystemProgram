package util;

import java.sql.*;

import entity.author;
import entity.user;

public class dbHelper {

	private static final String URL = "jdbc:mysql://127.0.0.1:3306/documentmanagedb";
	private static final String USER = "root";
	private static final String PASSWORD = "369326";
	
	public Connection getConnection() throws ClassNotFoundException,SQLException{
		//1. 加载驱动程序
		Class.forName("com.mysql.jdbc.Driver");
		//2. 获得数据库的连接
		Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
		
		return con;	
	}
	
	public void addUser(user u) throws SQLException {
		String userSQL1 = "insert into user"+"(userType,name,sex,birthday,address,telephone,inviter,industryBranch,specialCommittee,password) values(?,?,?,?,?,?,?,?,?,?)";
	//	String userSQL2 = "insert into user"+"(pname,type,quantity,price,pid) values(?,?,?,?,?)";
		PreparedStatement preStmt = null;
		Statement stmt = null;
		
		try{
			Connection conn = this.getConnection();
			conn.setAutoCommit(false);
			
			preStmt = conn.prepareStatement(userSQL1);
			
			preStmt.setInt(1, u.getUserType());					//userType
			preStmt.setString(2, u.getName());					//name
			preStmt.setString(3, u.getSex());					//sex
			preStmt.setString(4, u.getBirthday());				//birthday
			preStmt.setString(5, u.getAddress());				//address
			preStmt.setString(6, u.getTelephone());				//telephone
			preStmt.setString(7, u.getInviter());				//inviter
			preStmt.setString(8, u.getIndustryBranch());		//industryBranch
			preStmt.setString(9, u.getSpecialCommittee());		//specialCommittee
			preStmt.setString(10, u.getPassword());				//password
			preStmt.executeUpdate();
			
			preStmt.executeBatch();
			conn.commit();
			
		}catch(Exception e){
			e.printStackTrace();
			
			
		}finally{
			preStmt.close();
		}
	}
	
	//传入用户名返回密码或null
	public user showQueryInfo(String name){
		user u = null;
		ResultSet rs = null;
		PreparedStatement preStmt = null;
		String sql = "select * from user where name=?";

		try{
			Connection conn = this.getConnection();
			
			preStmt = conn.prepareStatement(sql);
			preStmt.setObject(1, name);
			
			rs = preStmt.executeQuery();
			
			if(rs.first()){
				int userType = rs.getInt("userType");
				name = rs.getString("name");
				String sex = rs.getString("sex");
				String birthday = rs.getString("birthday");
				String address = rs.getString("address");
				String telephone = rs.getString("telephone");
				String inviter = rs.getString("inviter");
				String industryBranch = rs.getString("industryBranch");
				String specialCommittee = rs.getString("specialCommittee");
				String password = rs.getString("password");
				
				u = new user(name, sex, birthday, address, telephone, industryBranch, specialCommittee, password);
				u.setUserType(userType);
				if(inviter != null) {
					u.setInviter(inviter);
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return u;
	}
	
	public static void main(String[] args) {
		dbHelper db = new dbHelper();
		System.out.println("===");
		
		user u1 = new author();
		u1.setName("张三");
		u1.setSex("男");
		u1.setBirthday("1997-02-21");
		u1.setAddress("北京");
		u1.setTelephone("888888");
		u1.setInviter("李四");
		u1.setIndustryBranch("AAA");
		u1.setSpecialCommittee("BBB");
		u1.setUserType(1);
		u1.setPassword("123456");
		
//		try {
//			db.addUser(u1);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		
		System.out.println(u1.toString());
		System.out.println(db.showQueryInfo("张三"));
		
	}
}
