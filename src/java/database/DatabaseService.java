/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import obj.Product;

/**
 *
 * @author junnguyen
 */
public class DatabaseService
{

    private Connection conn;
    private PreparedStatement preparedStatement;

    public DatabaseService()
    {

        preparedStatement = null;
        conn = Connector.getConn();
        //System.out.println("[+] Conn is okie || " + conn);

    }

    public String getPassword(String email) throws SQLException
    {

        String sqlQuery = "SELECT * FROM mydb.user WHERE email = ?";

        String passwd = null;
        try
        {
            conn = Connector.createConnection();
            preparedStatement = conn.prepareStatement(sqlQuery);
            preparedStatement.setString(1, email);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next())
            {
                passwd = rs.getString("password");
                //System.out.println("PASS IS " + passwd);
            }
        }

        catch (SQLException ex)
        {
            Logger.getLogger(DatabaseService.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {

            if (preparedStatement != null)
            {
                preparedStatement.close();
            }

            if (conn != null)
            {
                conn.close();
            }

        }
        return passwd;
    }

    public Integer getUID(String email) throws SQLException
    {

        String sqlQuery = "SELECT * FROM mydb.user WHERE email = ?";

        Integer uid = null;
        try
        {
            conn = Connector.createConnection();
            preparedStatement = conn.prepareStatement(sqlQuery);
            preparedStatement.setString(1, email);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next())
            {
                uid = rs.getInt("uid");
            }
        }

        catch (SQLException ex)
        {
            Logger.getLogger(DatabaseService.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {

            if (preparedStatement != null)
            {
                preparedStatement.close();
            }

            if (conn != null)
            {
                conn.close();
            }

        }
        return uid;
    }

    public void addProduct(Product p) throws SQLException
    {

        String sqlQuery = "INSERT INTO `mydb`.`product` "
                + "(`pName`, `pPrice`, `pStockNum`, `pCategory`, `pImage`, `pDesc`) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try
        {
            conn = Connector.createConnection();
            preparedStatement = conn.prepareStatement(sqlQuery);
            
            preparedStatement.setString(1, p.getpName());
            preparedStatement.setInt(2, p.getpPrice());
            preparedStatement.setInt(3, p.getpStockNum());
            preparedStatement.setString(4, p.getpCategory());
            preparedStatement.setString(5, p.getpImage());
            preparedStatement.setString(6, p.getpDescription());
            
            preparedStatement .executeUpdate();
        }
        catch (SQLException ex)
        {
            Logger.getLogger(DatabaseService.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {

            if (preparedStatement != null)
            {
                preparedStatement.close();
            }

            if (conn != null)
            {
                conn.close();
            }

        }
    }
}
