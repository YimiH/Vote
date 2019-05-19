package com.yimm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserBean {
    private String id;
    private String name;
    private String pwd;
    Connection conn=null;
    Statement st=null;
    ResultSet rs=null;
    PreparedStatement pst = null;
    
    public UserBean(){
        
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    
    public int userCheck(String name,String pwd) {
    	try {
    	    Class.forName("com.mysql.jdbc.Driver");
    	}catch (ClassNotFoundException e) {
    	    e.printStackTrace();
    	}

    	try{	
    		String jdbcUrl = "jdbc:mysql://localhost:3306/vote";
    		//数据库用户名
    		String jdbcUser = "root";
    		//数据库密码
    		String jdbcPwd = "123";

    		conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPwd);
    	    st=conn.createStatement();
    	    rs=st.executeQuery("select* from user");
    	    
    	    while(rs.next()){
    	    	String dbPwd=rs.getString(2);
    	    	String dbName=rs.getString(3);
    	    	if(dbName.equals(name)&& dbPwd.equals(pwd)){
    	    		return 1;
    	    	}else if(dbName.equals(name)&& !dbPwd.equals(pwd)){
    	    		return 0;
    	    	}
    	    }
    	}catch(SQLException e){
    		e.printStackTrace();
    	}finally{
    		try{
    			if(rs!=null){
    				rs.close();
    			}
    			if(st!=null){
    				st.close();
    			}
    			if(conn!=null){
    				conn.close();
    			}
    		}catch(SQLException e){
    			e.printStackTrace();
    		}
    		
    		
    	}
    	 return -1;    
	}
    
  
    public void addUser(String id,String pwd,String name) {
		    try {
		        Class.forName("com.mysql.jdbc.Driver");
		    }catch (ClassNotFoundException e) {
		        e.printStackTrace();
		    }
		    try{	
			    	String jdbcUrl = "jdbc:mysql://localhost:3306/vote";
			    	//数据库用户名
			    	String jdbcUser = "root";
			    	//数据库密码
			    	String jdbcPwd = "123";
			    	String sql = "insert into user values(?,?,?)";
			    	
			    	conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPwd);
			    	pst = conn.prepareStatement(sql);
			    	
			    	pst.setString(1, id);
			    	pst.setString(2, pwd);
			    	pst.setString(3,name);
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
