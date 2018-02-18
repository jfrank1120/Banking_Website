<%-- 
    Document   : Bank_Backend
    Created on : Nov 29, 2017, 7:54:44 PM
    Author     : Jared
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="/ExceptionHandler.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bank of Prague</title>
    </head>
    <body>
        <h1>Hello Bank!</h1>
        <%
            String username;
            String password;
            String firstName;
            String lastName;
            String address;
            try
            {
                Driver driver = new com.mysql.jdbc.Driver();
                String url = "jdbc:mysql://148.137.9.28/CS3";
                Connection connect = DriverManager.getConnection(url, "jaf51313", "Husky2017");
                Statement sm = connect.createStatement();
                if(connect != null)
                {
                    System.out.println("Connected To The Bank of Prague DataBase");
                }
                username = request.getParameter("username");
                password = request.getParameter("password");
                firstName = request.getParameter("f_name");
                lastName = request.getParameter("l_name");
                address = request.getParameter("address");
                String sql = "";
                //String sql = "Create Table Customers(username VARCHAR(25), fname VARCHAR(25), lname VARCHAR(25), address VARCHAR(25), PRIMARY KEY (username));";
                //sm.executeUpdate(sql);               
                
                sql = "DROP TABLE Accounts;";
                sm.executeUpdate(sql);
                System.out.println("Table Dropped");
                
                sql = "Create Table Accounts (username VARCHAR(25), balance DOUBLE(6,2), accountType VARCHAR(8), PRIMARY KEY (username), FOREIGN KEY (username) REFERENCES Customers(username));";
                sm.executeUpdate(sql);
                System.out.println("Table Accounts Created");
                
                
                sql = "SELECT * FROM Customers;";
                ResultSet rs = sm.executeQuery(sql);
                System.out.println("Result Set Created");
                
                // Creates new Customer
                if (rs.getString(username) == null)
                {
                    sql = "INSERT INTO Customers VALUES('" + username + "', '" + firstName + "', '" + lastName + "', '" + address + "');";
                    sm.executeUpdate(sql);
                    System.out.println("New Customer Created");
                }
                
                if (request.getParameter("checkingAcct") != null)
                {
                    System.out.println("Checking Located");
                    System.out.println("INSERT INTO Accounts VALUES('" + username + "', 0.00, 'Checking');");
                    sql = "INSERT INTO Accounts VALUES('" + username + "', 0.00, 'Checking');";
                    sm.executeUpdate(sql);
                    System.out.println("Checking account for " + username + " created");
                }
                else if (request.getParameter("savingsAcct") != null)
                {
                    System.out.println("Savings Located");
                    sql = "INSERT INTO Accounts VALUES('" + username + "', 0.00, 'Savings');";
                    sm.executeUpdate(sql);
                    System.out.println("Savings account for " + username + " created");
                }
            }
                catch (SQLException e)
                {
                
                }
            throw new RuntimeException("Error condition!!!");
        %>
    </body>
</html>
