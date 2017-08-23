package util;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import entity.author;
import entity.proposal;
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
	
	public int getMaxProposalId() throws ClassNotFoundException, SQLException {
		int maxProposalId = 0;
		String sql = "select max(proposalId) from proposal";
		Statement stmt = null;
		ResultSet rs = null;
		
		Connection conn = this.getConnection();
		conn.setAutoCommit(false);
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		if(rs != null) {
			rs.next();
			maxProposalId = rs.getInt(1);
		}
		return maxProposalId;
	}
	
	public void addProposal(proposal p) throws SQLException {
		String userSQL1 = "insert into proposal"+"(proposalId,title,author,deadline,state,agree,disagree,content) values(?,?,?,?,?,?,?,?)";
		PreparedStatement preStmt = null;
		Statement stmt = null;
		
		try{
			Connection conn = this.getConnection();
			conn.setAutoCommit(false);
			
			preStmt = conn.prepareStatement(userSQL1);
			
			preStmt.setInt(1, p.getProposalId());
			preStmt.setString(2, p.getTitle());
			preStmt.setString(3, p.getAuthor());
			preStmt.setString(4, p.getDeadline());
			preStmt.setInt(5, p.getState());
			preStmt.setInt(6, p.getAgree());
			preStmt.setInt(7, p.getDisagree());
			preStmt.setString(8, p.getContent());

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
	
	public List<proposal> listProposal() throws SQLException{
		List<proposal> list = new ArrayList<proposal>();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from proposal";
		
		try{
			//设置基本信息
			Connection conn = this.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				proposal p = new proposal();
				p.setAgree(rs.getInt("agree"));
				p.setDisagree(rs.getInt("disagree"));
				p.setAuthor(rs.getString("author"));
				p.setContent(rs.getString("content"));
				p.setDeadline(rs.getString("deadline"));
				p.setProposalId(rs.getInt("proposalId"));
				p.setState(rs.getInt("state"));
				p.setTitle(rs.getString("title"));
				
				list.add(p);
				
//				Product product = new Product();
//				/*person.setId(rs.getInt("id"));
//				person.setAge(rs.getInt("age"));
//				person.setName(rs.getString("name"));*/
//				product.setPname(rs.getString("pname"));
//				product.setPrice(rs.getInt("price"));
//				product.setStoreQuantity(rs.getInt("quantity"));
//				product.setType(rs.getString("type"));
//				product.setPid(rs.getInt("pid"));
//				
//				list.add(product);	
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}	
		return list;	
	}
	
	public static void main(String[] args) {
		dbHelper db = new dbHelper();
		System.out.println("===");

		try {
			System.out.println(db.getMaxProposalId());
			System.out.println(db.listProposal().size());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
