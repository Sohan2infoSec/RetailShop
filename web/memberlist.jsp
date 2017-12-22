<%@page import="java.sql.*"%>
<%
            String connectionURL = "jdbc:mysql://localhost:3306/retailshop?user=root;password=123456";
            Connection connection = null; //step 3
            Statement statement = null; //step 4
            ResultSet rs = null;
            //Class.forName("org.gjt.mm.mysql.Driver").newInstance();
//            try {
            Class.forName("com.mysql.jdbc.Driver").newInstance(); //step 1
            connection = DriverManager.getConnection(connectionURL, "root", "123456");
            statement = connection.createStatement();
            rs = statement.executeQuery("SELECT * FROM user"); //step 5
            while (rs.next()) {
                out.println(rs.getInt("idUser"));
                out.println(rs.getString("nameUser"));
                out.println(rs.getString("passUser"));
                out.println(rs.getBoolean("pendingUser")+ "<br>");
            } //step 6
            rs.close();
//                }
//                if (connection != null) {
//                    out.println("connected to database");
//                }
//            } catch (Exception e) {
//                out.println("not connected to database");
//            }
%>