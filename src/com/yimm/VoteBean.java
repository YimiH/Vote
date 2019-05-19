package com.yimm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;


public class VoteBean {
	private String title;
	private String username;
	private String voteTime;
	private String userIp;
	public VoteBean(){}
	
	public String getTitle() {
	    return title;
	}
	
	public void setTitle(String title) {
	    this.title = title;
	}
	
	public String getUsername() {
	    return username;
	}
	
	public void setUsername(String username) {
	    this.username = username;
	}
	
	public String getVoteTime() {
	    return voteTime;
	}
	
	public void setVoteTime(String voteTime) {
	    this.voteTime = voteTime;
	}
	
	public String getUserIp() {
	    return userIp;
	}
	
	public void setUserIp(String userIp) {
	    this.userIp = userIp;
	}
	
	public void addRecord(String title,String username,String voteTime,String userIp) {
		try {
		    Class.forName("com.mysql.jdbc.Driver");
		}catch (ClassNotFoundException e) {
		    e.printStackTrace();
		}
		Connection conn=null;
		PreparedStatement pst = null;
		
		try{	
			String jdbcUrl = "jdbc:mysql://localhost:3306/vote";
			//数据库用户名
			String jdbcUser = "root";
			//数据库密码
			String jdbcPwd = "123";
			String sql = "insert into vote values(?,?,?,?)";
			
			conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPwd);
			pst = conn.prepareStatement(sql);
			pst.setString(1, title);
			pst.setString(2, username);
			pst.setString(3,voteTime);
			pst.setString(4,userIp);				
			pst.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(pst!=null){
					pst.close();
				}
				if(conn!=null){
					conn.close();
				}
			}catch(SQLException e){
				e.printStackTrace();
			}	
		}

	}
	

}