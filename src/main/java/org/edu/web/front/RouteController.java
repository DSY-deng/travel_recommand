package org.edu.web.front;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.edu.pojo.*;
import org.edu.service.FavoriteService;
import org.edu.service.RouteService;
import org.edu.utils.JsonResult;
import org.springframework.lang.UsesSunMisc;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

@Controller
public class RouteController {

    @Resource
    private RouteService routeService;

    @Resource
    private FavoriteService favoriteService;

    //查询并分页
    @RequestMapping("/pageQuery")
    @ResponseBody
    public List<Route> queryList(HttpSession session,Integer cid,@RequestParam(defaultValue = "1")Integer currentPage, String rname){
        System.out.println("---------进入pageQuery-----------");

        PageInfo<Route> routePageInfo = routeService.queryAllRoute(cid,currentPage,rname);
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
        session.setAttribute("rname",rname);
        System.out.println("-------total----------"+total);
        System.out.println("-------sumPage----------"+sumPage);
        System.out.println("-------currentPage----------"+currentPage);
        System.out.println("-------rname----------"+rname);
        System.out.println("-------list----------"+list);

        return list;
    }

    @RequestMapping("/findDetail")
    @ResponseBody
    public Route findDetail(Integer rid){
        System.out.println("------findDetail------"+rid);
        Route detail = routeService.findDetail(rid);
        System.out.println("------findDetail------"+detail);
        return detail;
    }

    @RequestMapping("/addFavorite")
    @ResponseBody
    public JsonResult addFavorite(Integer rid,HttpSession session){
        User loginUser = (User) session.getAttribute("loginUser");
        Favorite favorite = new Favorite();
        favorite.setUid(loginUser.getUid());
        favorite.setRid(rid);
        favorite.setDate(new Date());
        boolean fSuccess = favoriteService.addFavorite(favorite);
        if(fSuccess){
            boolean cSuccess = favoriteService.addCount(rid);
            System.out.println("cSuccess:"+cSuccess);
            if(cSuccess){
                return new JsonResult().message("收藏成功").success(true);
            }else{
                return new JsonResult().message("更新收藏次数失败").success(false);
            }
        }else{
            return new JsonResult().message("收藏失败").success(false);
        }
    }

    @RequestMapping("/isFavorite")
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
        boolean favorite = favoriteService.isFavorite(rid, uid);

        if(favorite){
            //灰
            return new JsonResult().message("已收藏").success(true);
        }else{
            //红
            return new JsonResult().message("未收藏").success(false);
        }

    }

    @RequestMapping("/selectTop")
    @ResponseBody
    public List<Route> selectTop(){
        List<Route> routes = routeService.selectBySortAll();
        return routes;
    }

    @RequestMapping("/selectInternalTop")
    @ResponseBody
    public List<Route> selectInTop(){
        List<Route> routes = routeService.selectTopByCid(5);
        return routes;
    }

    @RequestMapping("/selectOutTop")
    @ResponseBody
    public List<Route> selectOutTop(){
        List<Route> routes = routeService.selectTopByCid(4);
        return routes;
    }

    @RequestMapping("/selectTopByCid")
    @ResponseBody
    public List<Route>  selectTopByCid(Integer cid){
        List<Route> routes = routeService.selectTopByCid(cid);
        return routes;
    }


}
