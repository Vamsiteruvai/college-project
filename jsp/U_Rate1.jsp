


<title>U_Opinion</title>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*" %>
<%@ page import="java.security.MessageDigest,java.security.NoSuchAlgorithmException"%>
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>


<%

			try
				{

					String uname=(String)application.getAttribute("uname");
					String oby=request.getParameter("oby");
					String rating=request.getParameter("rating");
    				String oon=request.getParameter("oon");
      	
							SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
							SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
					
							Date now = new Date();
					
							String strDate = sdfDate.format(now);
							String strTime = sdfTime.format(now);
							String dt = strDate + "   " + strTime;
							
							
							
						
						PreparedStatement ps=connection.prepareStatement("insert into rating(user_name,rating,rated_by,dt) values(?,?,?,?)");
						ps.setString(1,oby);
						ps.setString(2,rating);
						ps.setString(3,oon);	
						ps.setString(4,dt);
						
					
						int x=ps.executeUpdate();
						if(x>0){
							//request.setAttribute("msg","successfull");
							out.print("Rating Given Successfully");
							
			%>
			         <a href="UserMain.jsp">Home</a> </p>

			
			<%
					}
						} 
					catch (Exception e) 
					{
						out.println(e.getMessage());
						e.printStackTrace();
					}
				%>
