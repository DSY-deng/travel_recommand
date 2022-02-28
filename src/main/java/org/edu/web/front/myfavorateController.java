package org.edu.web.front;


import com.github.pagehelper.PageInfo;
import org.edu.mapper.FavoriteMapper;
import org.edu.mapper.RouteMapper;
import org.edu.pojo.Category;
import org.edu.pojo.Favorite;
import org.edu.pojo.Route;
import org.edu.pojo.User;
import org.edu.service.CategoryService;
import org.edu.service.FavoriteService;
import org.edu.service.RouteService;
import org.edu.utils.JsonResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class myfavorateController {

    @Resource
    private CategoryService categoryService;

    @Resource
    private RouteService routeService;

    @Resource
    private FavoriteService favoriteService;


    @RequestMapping("/selectFavoriteTop")
    @ResponseBody
    public List<Route> selectTop(HttpSession session,@RequestParam(defaultValue = "1")Integer currentPage,String searchroute,Integer pricelow,Integer pricehigh){

        PageInfo<Route> routePageInfo = favoriteService.selectFavoriteAll(currentPage, searchroute,pricelow,pricehigh);
        List<Route> list = routePageInfo.getList();
        int total = (int)routePageInfo.getTotal();
        int sumPage = total/10 + 1;
       /* Route route = new Route();
        route.setTotal(total);
        route.setSumPage(sumPage);
        list.add(route);*/
        session.setAttribute("total",total);
        session.setAttribute("sumPage",sumPage);
        session.setAttribute("currentPage",currentPage);
        session.removeAttribute("searchroute");
        session.removeAttribute("pricelow");
        session.removeAttribute("pricehigh");
        session.setAttribute("searchroute",searchroute);
        session.setAttribute("pricelow",pricelow);
        session.setAttribute("pricehigh",pricehigh);
        System.out.println(searchroute+pricelow+pricehigh);
        return list;
    }

    @RequestMapping("/isLogin")
    @ResponseBody
    public JsonResult isLogin(HttpSession session){
        User loginUser = (User)session.getAttribute("loginUser");
        if(loginUser!=null){
            String uid = loginUser.getUid().toString();
            System.out.println("==isLogin===:"+uid);
            return new JsonResult().message(uid).success(true);
        }else{
            return new JsonResult().message("未有用户登录,请登录").success(false);
        }
    }


    @RequestMapping("/showMyfavorite")
    @ResponseBody
    public List<Favorite> showMyfavorite(HttpSession session, Integer uid){
        List<Favorite> routesByCid = favoriteService.findRoutesByCid(uid);
        System.out.println("showMyfavorite==routesByCid:"+routesByCid);
        return routesByCid;
    }

}
