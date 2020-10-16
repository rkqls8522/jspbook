package jspbook.ch14;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

public class DBManager {
    private Connection con;
    public DBManager() {
        try{
        	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
        	String jdbc_url = "jdbc:mysql://localhost:3306/dbtest?serverTimezone=UTC&useSSL=false";
        	
            Driver CTDriver = (Driver) Class.forName(jdbc_driver).newInstance();
            Properties info = new Properties();
            info.setProperty("user","root");
            info.setProperty("password","1234");
            con = CTDriver.connect (jdbc_url,info);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
public int regist(User user) {
        String sql = "INSERT INTO USERS VALUES(?,?,?,?,?,?) ";
		String name, addr;
		int cnt=0;
        PreparedStatement pstmt = null;
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,user.getLoginid());
            pstmt.setString(2,user.getPassword());
			name = new String(user.getName().getBytes("8859_1"),"EUC-KR");
			pstmt.setString(3,name);
			pstmt.setInt(4,user.getSex());
			addr = new String(user.getAddress().getBytes("8859_1"),"EUC-KR");
			pstmt.setString(5,addr);
            pstmt.setString(6,user.getTel());
            cnt = pstmt.executeUpdate();
           	con.commit();
            pstmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }
        return (cnt);
    }

public User getUser(String loginid) {
        String sql = "SELECT * FROM USERS WHERE LOGINID = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        User user = null;
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,loginid);
            rs = pstmt.executeQuery();
            if(rs.next())
                user = new User (rs.getString(1),rs.getString(2),rs.getString(3)
, rs.getInt(4),rs.getString(5),rs.getString(6));
            con.commit();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }
        return user;
    }
}