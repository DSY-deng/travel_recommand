package org.edu.web.front;


import org.edu.pojo.Cart;
import org.edu.pojo.Favorite;
import org.edu.pojo.User;
import org.edu.service.CartService;
import org.edu.utils.JsonResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
public class CartServlet {

    @Resource
    private CartService cartService;

    @RequestMapping("/addCart")
    @ResponseBody
    public JsonResult addFavorite(Integer rid, HttpSession session){
        User loginUser = (User) session.getAttribute("loginUser");
        Cart cart = new Cart();
        cart.setUid(loginUser.getUid());
        cart.setRid(rid);
        Integer number = cart.getNumber();
        number++;
        cart.setNumber(number);
        boolean cSuccess = cartService.addCart(cart);
        if(cSuccess){
            return new JsonResult().message("加入购物车成功").success(true);
            //boolean cSuccess = cartService.addCount(rid);
           /* System.out.println("cSuccess:"+cSuccess);
            if(cSuccess){
                return new JsonResult().message("收藏成功").success(true);
            }else{
                return new JsonResult().message("更新收藏次数失败").success(false);
            }*/
        }else{
            return new JsonResult().message("加入购物车失败").success(false);
        }
    }


    @RequestMapping("/isCart")
    @ResponseBody
    public JsonResult isFavorite(Integer rid,HttpSession session){
        User loginUser = (User)session.getAttribute("loginUser");
        Integer uid = 0;
        if(loginUser!=null){
            uid = loginUser.getUid();
        }else{
            //红
            return new JsonResult().message("尚未有用户登录").success(false);
        }

        System.out.println("-----进入isFavorite------:");
        System.out.println("-----rid------:"+rid);
        System.out.println("-----uid------:"+uid);
        System.out.println("---------isFavorite结束------------");
        boolean cart = cartService.isCart(rid, uid);

        if(cart){
            //灰
            return new JsonResult().message("已加入购物车").success(true);
        }else{
            //红
            return new JsonResult().message("未加入购物车").success(false);
        }

    }

}
