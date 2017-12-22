/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package obj;

/**
 *
 * @author Cpt_Snag
 */
public class User
{
    private Integer uID;
    private String email;
    private String password;

    public User()
    {
    }

    public User(Integer uID, String email, String password)
    {
        this.uID = uID;
        this.email = email;
        this.password = password;
    }

    public Integer getuID()
    {
        return uID;
    }

    public String getEmail()
    {
        return email;
    }

    public String getPassword()
    {
        return password;
    }

    public void setuID(Integer uID)
    {
        this.uID = uID;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }
    
}
