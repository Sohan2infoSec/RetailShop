/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ultilities;

import obj.Product;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author junnguyen
 */
public class SessionService
{
    private final HttpSession httpSession;

    public SessionService(HttpSession httpSession)
    {
        this.httpSession = httpSession;
    }

    public void setAtt(String name, Object obj)
    {
        httpSession.setAttribute(name, obj);
    }

    public Object getUIDUser()
    {
        return httpSession.getAttribute("user");
    }

    public Object getUIDAdmin()
    {
        return httpSession.getAttribute("admin");
    }

    public ArrayList<Product> getCart()
    {
        ArrayList<Product> cartList = (ArrayList<Product>) httpSession.getAttribute("cart");

        if (cartList == null)
        {
            cartList = new ArrayList<Product>();
        }
        return cartList;
    }

    public void addCart(Product p)
    {
        ArrayList<Product> cartList = (ArrayList<Product>) httpSession.getAttribute("cart");
        if (cartList == null)
        {
            cartList = new ArrayList<Product>();
            cartList.add(p);         
        }
        else
        {
            cartList.add(p);
        }
        httpSession.setAttribute("cart", cartList);
    }

//    public void addMember(String memberName)
//    {
//
//        ArrayList<String> memberList = (ArrayList) httpSession.getAttribute("memberList");
//
//        if (memberList == null)
//        {
//            memberList = new ArrayList<String>();
//            memberList.add(memberName);
//            httpSession.setAttribute("memberList", memberList);
//
//        }
//        else
//        {
//            memberList.add(memberName);
//        }
//
//    }
//
//    public ArrayList<String> getMemberList()
//    {
//        ArrayList<String> memberList = (ArrayList) httpSession.getAttribute("memberList");
//
//        if (memberList == null)
//        {
//            memberList = new ArrayList<String>();
//        }
//        return memberList;
//    }

}
