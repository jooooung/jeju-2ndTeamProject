package com.lec.jeju.util;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CvsTest {
	 public static void main(String[] args) {
	        BufferedReader reader = null;
	        Reader r = null;
	        List<String> list = null;
	        Connection con = null;
	        PreparedStatement stmt =null;
	        int count =0;
	        try {
	            r = new FileReader("data.txt");
	            reader = new BufferedReader(r);
	            list = new ArrayList<String>(); // 자료 담을 자료구조 생성
	            while (true) {
	                String data = reader.readLine();
	                if (data == null) 
	                    break;
	                String[] arr = data.split(",");
	                count++;// 배열에서 값을 하나씩 꺼내어 insert하기 좋은 형태로 저장 // ex) map, list
	                // 여기까지 ,를 구분으로 배열이 만들어졌는데
	 
	                for (String string : arr) { // 하나씩 뽑아서 리스트에 add
	                    list.add(string);
	 
	                }
	                System.out.println(list);
	 
	            }
	            //디비연결 후 넣기
	    		
	            Class.forName("oracle.jdbc.driver.OracleDriver"); 
	            String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";	
	            String uid		= "jeju";
	            String upw		= "island";
	            con = DriverManager.getConnection(url, uid, upw); // Connection
	 
	            StringBuffer query = new StringBuffer(); 
	            query.append("INSERT INTO Student VALUES (?,?,?,?)"); 
	            stmt = con.prepareStatement(query.toString());
	 
	            
	            
	            for (int i = 0; i < count; i++) { // 데이터 길이만큼
	                stmt.setInt(1, i + 1);
	                stmt.setString(2, list.get((3 * i) + 0)); // 또넣으면 프라이머리키 중복되서 안되고.
	                stmt.setString(3, list.get((3 * i) + 1));
	                stmt.setString(4, list.get((3 * i) + 2)); // insert, update, delete 값(데이터)에 변화를 주는. executeQuery()는 조회시/
	                stmt.executeUpdate();
	            }
	            
	            
	            
	            
	            
	            
	        } catch (FileNotFoundException e) {
	            e.printStackTrace();
	        } // 데이터 파일준비
	        catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (ClassNotFoundException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	 
	        finally {
	            if (reader != null) {
	                try {
	                    reader.close();
	                } catch (IOException e) {
	                    // TODO Auto-generated catch block
	                    e.printStackTrace();
	                }
	            }
	            if (r!= null) //이렇게 하는 경우 r이 생성되는 단계에서 오류가 발생할 수 있다
	            try {
	                r.close();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	            
	            try {
	                stmt.close();
	            } catch (SQLException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (NullPointerException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	            try {
	                con.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	            catch (NullPointerException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
	 
	        // 파일을 읽어들이고 저장까지
	        // 그리고 저장까지 하고 데이터베이스에 담는건 다음 소스코드부터
	 
	 
	    }
}
