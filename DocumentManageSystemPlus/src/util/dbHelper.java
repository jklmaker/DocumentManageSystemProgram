package util;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import dao.apply;

import entity.author;
import entity.build;
import entity.comment;
import entity.managerBasicInfo;
import entity.proposal;
import entity.recommendProposal;
import entity.record;
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
	
	public void addApply(String recommendedPerson,String recommender){
		String sql = "insert into apply"+"(recommendedPerson,recommender) values(?,?)";
		PreparedStatement preStmt = null;
		Statement stmt = null;
		try {
			Connection conn = this.getConnection();
			conn.setAutoCommit(false);
			
			preStmt = conn.prepareStatement(sql);
			
			preStmt.setString(1, recommendedPerson);
			preStmt.setString(2, recommender);
			
			preStmt.executeUpdate();
			preStmt.executeBatch();
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				preStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void addBuild(build b) {
		String sql = "insert into build"+"(buildProposalId,buildReviewerName,buildTimeStamp,buildTitle,buildContent) values(?,?,?,?,?)";
		PreparedStatement preStmt = null;
		Statement stmt = null;
		
		try {
			Connection conn = this.getConnection();
			conn.setAutoCommit(false);
			
			preStmt = conn.prepareStatement(sql);
			
			preStmt.setInt(1, b.getBuildProposalId());
			preStmt.setString(2, b.getBuildReviewerName());
			preStmt.setString(3, b.getBuildTimeStamp());
			preStmt.setString(4, b.getBuildTitle());
			preStmt.setString(5, b.getBuildContent());
			
			preStmt.executeUpdate();
			
			preStmt.executeBatch();
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				preStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void addRecord(record r) {
		String sql = "insert into record"+"(recordProposalId,recordReviewerName,recordTimeStamp,recordTitle,recordContent) values(?,?,?,?,?)";
		PreparedStatement preStmt = null;
		Statement stmt = null;
		
		try {
			Connection conn = this.getConnection();
			conn.setAutoCommit(false);
			
			preStmt = conn.prepareStatement(sql);
			
			preStmt.setInt(1, r.getRecordProposalId());
			preStmt.setString(2, r.getRecordReviewerName());
			preStmt.setString(3, r.getRecordTimeStamp());
			preStmt.setString(4, r.getRecordTitle());
			preStmt.setString(5, r.getRecordContent());
			
			preStmt.executeUpdate();
			
			preStmt.executeBatch();
			conn.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				preStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void addUser(user u) throws SQLException {
		String userSQL1 = "insert into user"+"(userType,name,sex,birthday,address,telephone,inviter,industryBranch,specialCommittee,password) values(?,?,?,?,?,?,?,?,?,?)";
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
	
	public void addComment(comment c) {
		String sql = "insert into comment"+"(commentProposalId,commentProposalTitle,commentReviewerName,commentContent,commentTimeStamp,commentType) values(?,?,?,?,?,?)";
		PreparedStatement preStmt = null;
		Statement stmt = null;
		
		try {
			Connection conn = this.getConnection();
			conn.setAutoCommit(false);
			
			preStmt = conn.prepareStatement(sql);
			
			preStmt.setInt(1, c.getCommentProposalId());
			preStmt.setString(2, c.getCommentProposalTitle());
			preStmt.setString(3, c.getCommentReviewerName());
			preStmt.setString(4, c.getCommentContent());
			preStmt.setString(5, c.getCommentTimeStamp());
			preStmt.setInt(6, c.getCommentType());
			
			preStmt.executeUpdate();
			
			preStmt.executeBatch();
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				preStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void addRecommendProposal(recommendProposal rp) {
		String sql = "insert into recommend"+"(recommendProposalId,recommendProposalTitle,recommendReviewerName,recommendReason,recommendTimeStamp) values(?,?,?,?,?)";
		PreparedStatement preStmt = null;
		Statement stmt = null;
		
		try {
			Connection conn = this.getConnection();
			conn.setAutoCommit(false);
			
			preStmt = conn.prepareStatement(sql);
			
			preStmt.setInt(1, rp.getRecommendProposalId());
			preStmt.setString(2, rp.getRecommendProposalTitle());
			preStmt.setString(3, rp.getRecommendReviewerName());
			preStmt.setString(4, rp.getRecommendReason());
			preStmt.setString(5, rp.getRecommendTimeStamp());
			
			preStmt.executeUpdate();
			
			preStmt.executeBatch();
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				preStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
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
	
	//功能:根据管理员名字查询manager表，获得managerBasicInfo对象
	public managerBasicInfo showManagerBasicQueryInfo(String adminName) {
		managerBasicInfo mbi = null;
		ResultSet rs = null;
		PreparedStatement preStmt = null;
		String sql = "select * from manager where adminName=?";
		
		try{
			Connection conn = this.getConnection();
			
			preStmt = conn.prepareStatement(sql);
			preStmt.setObject(1, adminName);
			
			rs = preStmt.executeQuery();
			
			if(rs.first()){
				adminName = rs.getString("adminName");
				int adminType = rs.getInt("adminType");
				mbi = new managerBasicInfo(adminType, adminName);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				preStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return mbi;
	}
	
	public apply showApplyQueryInfo(String recommendedPerson) {
		apply a = null;
		ResultSet rs = null;
		PreparedStatement preStmt = null;
		String sql = "select * from apply where recommendedPerson=?";
		
		try{
			Connection conn = this.getConnection();
			
			preStmt = conn.prepareStatement(sql);
			preStmt.setObject(1, recommendedPerson);
			
			rs = preStmt.executeQuery();
			
			if(rs.first()){
				recommendedPerson = rs.getString("recommendedPerson");
				String recommender = rs.getString("recommender");
				String applyReason = rs.getString("applyReason");
				String recommendReason = rs.getString("recommendReason");
				
				a = new apply(recommendedPerson, recommender, applyReason, recommendReason);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				preStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return a;
	}
	
	//传入用户名返回user对象
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
	
	public List<build> listBuild() {
		List<build> list = new ArrayList<build>();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from build";
		
		try {
			Connection conn = this.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				build b = new build();
				b.setBuildContent(rs.getString("buildContent"));
				b.setBuildProposalId(rs.getInt("buildProposalId"));
				b.setBuildReviewerName(rs.getString("buildReviewerName"));
				b.setBuildTimeStamp(rs.getString("buildTimeStamp"));
				b.setBuildTitle(rs.getString("buildTitle"));
				
				list.add(b);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<record> listRecord() {
		List<record> list = new ArrayList<record>();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from record";
		
		try {
			Connection conn = this.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				record r = new record();
				r.setRecordContent(rs.getString("recordContent"));
				r.setRecordProposalId(rs.getInt("recordProposalId"));
				r.setRecordReviewerName(rs.getString("recordReviewerName"));
				r.setRecordTimeStamp(rs.getString("recordTimeStamp"));
				r.setRecordTitle(rs.getString("recordTitle"));
				
				list.add(r);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
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
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}	
		return list;	
	}
	
	public List<apply> listApplyByRecommender(String recommender) {
		List<apply> list = new ArrayList<apply>();
		String sql = "select * from apply where recommender=?";
		PreparedStatement preStmt = null;
		ResultSet rs = null;
		
		try {
			Connection conn = this.getConnection();
			
			preStmt = conn.prepareStatement(sql);
			preStmt.setObject(1, recommender);
			
			rs = preStmt.executeQuery();
			
			while(rs.next()){
				apply a = new apply();
				a.setApplyReason(rs.getString("applyReason"));
				a.setRecommendedPerson(rs.getString("recommendedPerson"));
				a.setRecommender(rs.getString("recommender"));
				a.setRecommendReason(rs.getString("recommendReason"));
				
				list.add(a);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<comment> listCommentByCommentProposalId(int commentProposalId) {
		List<comment> list = new ArrayList<comment>();
		String sql = "select * from comment where commentProposalId=?";
		PreparedStatement preStmt = null;
		ResultSet rs = null;
		
		try {
			Connection conn = this.getConnection();
			
			preStmt = conn.prepareStatement(sql);
			preStmt.setObject(1, commentProposalId);
			
			rs = preStmt.executeQuery();
			
			while(rs.next()){
				comment c = new comment();
				c.setCommentContent(rs.getString("commentContent"));
				c.setCommentProposalId(rs.getInt("commentProposalId"));
				c.setCommentProposalTitle(rs.getString("commentProposalTitle"));
				c.setCommentReviewerName(rs.getString("commentReviewerName"));
				c.setCommentTimeStamp(rs.getString("commentTimeStamp"));
				c.setCommentType(rs.getInt("commentType"));
				
				list.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				preStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return list;
	}
	
	public List<recommendProposal> listRecommendProposalByRecommendReviewerName(String recommendReviewerName) {
		List<recommendProposal> list = new ArrayList<recommendProposal>();
		String sql = "select * from recommend where recommendReviewerName=?";
		PreparedStatement preStmt = null;
		ResultSet rs = null;
		
		try {
			Connection conn = this.getConnection();
			
			preStmt = conn.prepareStatement(sql);
			preStmt.setObject(1, recommendReviewerName);
			
			rs = preStmt.executeQuery();
			
			while(rs.next()){
				recommendProposal rp = new recommendProposal();
				rp.setRecommendProposalId(rs.getInt("recommendProposalId"));
				rp.setRecommendProposalTitle(rs.getString("recommendProposalTitle"));
				rp.setRecommendReason(rs.getString("recommendReason"));
				rp.setRecommendReviewerName(rs.getString("recommendReviewerName"));
				rp.setRecommendTimeStamp(rs.getString("recommendTimeStamp"));
				
				list.add(rp);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<recommendProposal> listRecommendByRecommendProposalId(int recommendProposalId) {
		List<recommendProposal> list = new ArrayList<recommendProposal>();
		String sql = "select * from recommend where recommendProposalId=?";
		PreparedStatement preStmt = null;
		ResultSet rs = null;
		
		try {
			Connection conn = this.getConnection();
			
			preStmt = conn.prepareStatement(sql);
			preStmt.setObject(1, recommendProposalId);
			
			rs = preStmt.executeQuery();
			
			while(rs.next()){
				recommendProposal rp = new recommendProposal();
				rp.setRecommendProposalId(rs.getInt("recommendProposalId"));
				rp.setRecommendProposalTitle(rs.getString("recommendProposalTitle"));
				rp.setRecommendReason(rs.getString("recommendReason"));
				rp.setRecommendReviewerName(rs.getString("recommendReviewerName"));
				rp.setRecommendTimeStamp(rs.getString("recommendTimeStamp"));
				
				list.add(rp);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				preStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	public List<user> listUserByUserType(int userType) throws SQLException {
		List<user> list = new ArrayList<user>();
		String sql = "select * from user where userType=?";
		PreparedStatement preStmt = null;
		ResultSet rs = null;
		
		try {
			Connection conn = this.getConnection();
			
			preStmt = conn.prepareStatement(sql);
			preStmt.setObject(1, userType);
			
			rs = preStmt.executeQuery();
			
			while(rs.next()){
				user u = new user();
				u.setUserType(rs.getInt("userType"));
				u.setName(rs.getString("name"));
				u.setSex(rs.getString("sex"));
				u.setBirthday(rs.getString("birthday"));
				u.setAddress(rs.getString("address"));
				u.setTelephone(rs.getString("telephone"));
				u.setInviter(rs.getString("inviter"));
				u.setIndustryBranch(rs.getString("industryBranch"));
				u.setSpecialCommittee(rs.getString("specialCommittee"));
				u.setPassword(rs.getString("password"));
				
				list.add(u);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<user> listUser() throws SQLException{
		List<user> list = new ArrayList<user>();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from user";
		
		try{
			//设置基本信息
			Connection conn = this.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				user u = new user();
				u.setUserType(rs.getInt("userType"));
				u.setName(rs.getString("name"));
				u.setSex(rs.getString("sex"));
				u.setBirthday(rs.getString("birthday"));
				u.setAddress(rs.getString("address"));
				u.setTelephone(rs.getString("telephone"));
				u.setInviter(rs.getString("inviter"));
				u.setIndustryBranch(rs.getString("industryBranch"));
				u.setSpecialCommittee(rs.getString("specialCommittee"));
				u.setPassword(rs.getString("password"));
				
				list.add(u);
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}	
		return list;	
	}
	
	public proposal showQueryInfoPlus(int proposalId){
		proposal p = null;
		ResultSet rs = null;
		PreparedStatement preStmt = null;
		String sql = "select * from proposal where proposalId=?";

		try{
			Connection conn = this.getConnection();
			
			preStmt = conn.prepareStatement(sql);
			preStmt.setObject(1, proposalId);
			
			rs = preStmt.executeQuery();
			
			if(rs.first()){
				
				p = new proposal();
				p.setAgree(rs.getInt("agree"));
				p.setDisagree(rs.getInt("disagree"));
				p.setAuthor(rs.getString("author"));
				p.setContent(rs.getString("content"));
				p.setDeadline(rs.getString("deadline"));
				p.setProposalId(rs.getInt("proposalId"));
				p.setState(rs.getInt("state"));
				p.setTitle(rs.getString("title"));
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return p;
	}
	
	public boolean delApply(String recommendedPerson) {
		Connection conn = null;
		PreparedStatement preStmt = null;
		String sql = "delete from apply where recommendedPerson=?";
		if(showApplyQueryInfo(recommendedPerson)==null)
			return false;
		else{
			try {
				conn = this.getConnection();
				preStmt = conn.prepareStatement(sql);
				preStmt.setString(1, recommendedPerson);
				preStmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					preStmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			return true;
		}
	}
	
	public boolean delProposal(int proposalId) throws SQLException {
		Connection conn = null;
		PreparedStatement preStmt = null;
		String sql = "delete from proposal where proposalId=?";
		if(showQueryInfoPlus(proposalId)==null)
			return false;
		else{
			try {
				conn = this.getConnection();
				preStmt = conn.prepareStatement(sql);
				preStmt.setInt(1, proposalId);
				preStmt.executeUpdate();
				preStmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return true;
		}
	}
	
	//功能：proposal表中ID为proposalId的提案赞同数+1
	public void altAgreeNum(int proposalId) {
		//先取得现有的proposal对象
		proposal p = this.showQueryInfoPlus(proposalId);
		int agreeNum = p.getAgree();
		//赞同数+1
		agreeNum++;
		
		String sql = "update proposal set agree=? where proposalId=?";
		PreparedStatement preStmt = null;
		
		try {
			Connection conn = this.getConnection();
			preStmt = conn.prepareStatement(sql);
			
			preStmt.setInt(1, agreeNum);
			preStmt.setInt(2, proposalId);
			
			preStmt.executeUpdate();		//更新数据
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				preStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
		//功能：proposal表中ID为proposalId的提案反对数+1
		public void altDisagreeNum(int proposalId) {
			//先取得现有的proposal对象
			proposal p = this.showQueryInfoPlus(proposalId);
			int disagreeNum = p.getDisagree();
			//反对数+1
			disagreeNum++;
			
			String sql = "update proposal set disagree=? where proposalId=?";
			PreparedStatement preStmt = null;
			
			try {
				Connection conn = this.getConnection();
				preStmt = conn.prepareStatement(sql);
				
				preStmt.setInt(1, disagreeNum);
				preStmt.setInt(2, proposalId);
				
				preStmt.executeUpdate();		//更新数据
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					preStmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	
	public void altUserType(int newType,String name) {
		String sql = "update user set userType=? where name=?";
		PreparedStatement preStmt = null;
		
		try {
			Connection conn = this.getConnection();
			preStmt = conn.prepareStatement(sql);
			
			preStmt.setInt(1, newType);
			preStmt.setString(2, name);
			
			preStmt.executeUpdate();		//更新数据
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				preStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//这里重载altApplyInfo方法
	public void altApplyInfo(String recommendedPerson,String recommendReason) {
		String sql = "update apply set recommendReason=? where recommendedPerson=?";
		PreparedStatement preStmt = null;
		
		try {
			Connection conn = this.getConnection();
			preStmt = conn.prepareStatement(sql);
			
			preStmt.setString(1, recommendReason);
			preStmt.setString(2, recommendedPerson);
			
			preStmt.executeUpdate();		//更新数据
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				preStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void altApplyInfo(String recommendedPerson,String recommender,String applyReason) {
		String sql = "update apply set recommender=?,applyReason=? where recommendedPerson=?";
		PreparedStatement preStmt = null;
		
		try {
			Connection conn = this.getConnection();
			preStmt = conn.prepareStatement(sql);
			
			preStmt.setString(1, recommender);
			preStmt.setString(2, applyReason);
			preStmt.setString(3, recommendedPerson);
			
			preStmt.executeUpdate();		//更新数据
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				preStmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public static void main(String[] args) {
		dbHelper db = new dbHelper();
		System.out.println("===");
		List<comment> list = db.listCommentByCommentProposalId(1);
		System.out.println(list.size());
	}
}
