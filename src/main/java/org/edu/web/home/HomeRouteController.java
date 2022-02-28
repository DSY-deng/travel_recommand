package org.edu.web.home;


import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Mod;
import com.sun.scenario.effect.impl.sw.java.JSWPerspectiveTransformPeer;
import lombok.Data;
import org.aspectj.asm.IModelFilter;
import org.edu.pojo.Role;
import org.edu.pojo.Route;
import org.edu.pojo.User;
import org.edu.service.RouteService;
import org.edu.utils.JsonResult;
import org.edu.utils.fileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.jws.WebParam;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
public class HomeRouteController {


    @Resource
    private RouteService routeService;


    //查询并分页
    @RequestMapping("/homeRouteList")
    public String queryhomeUserList(Model model, String rname, Integer homepricelow,Integer homepricehigh,@RequestParam(defaultValue = "1")Integer pageIndex){
        //System.out.println("______________userList________________");
        PageInfo<Route> routePageInfo = routeService.queryhomeRouteList(rname,homepricelow,homepricehigh,pageIndex);
        //模糊查询
        // List<SmbmsRole> smbmsRoles = smbmsRoleService.queryAllRole();
        //数据回选
        model.addAttribute("rname",rname);
        //数据回选结束
        model.addAttribute("homepricelow",homepricelow);
        model.addAttribute("homepricehigh",homepricehigh);
        //模糊查询结束
       // System.out.println(routePageInfo);
        model.addAttribute("routePageInfo",routePageInfo);
        return "jsp/home/billlist";
    }


    //路线详情信息展示
    @RequestMapping("/routeView")
    public String routeView(Integer rid, Model model){
        Route route = routeService.findDetail(rid);
        model.addAttribute("route", route);
        return "jsp/home/billview";
    }

    /**
     * 添加旅游路线
     */
    @RequestMapping("/addRoute")
    public String addRoute(Route route, Model model,HttpSession session){
        System.out.println("刚开始addRoute："+route);
        /*System.out.println("刚开始addRoute："+route.getRimage());
        fileUtil fileUtil = new fileUtil();
        String filename= fileUtil.fileUpload(route.getRimage());
        if("".equals(filename)||filename!=null){
            String rimagename = "img/product/smalladd/"+filename;
            route.setRimage(rimagename);
            System.out.println("filename:"+rimagename);
        }else{

        }*/
        route.setSid(1);
        route.setRflag("1");
        route.setIsthemetour("0");
        route.setCount(0);
        /*获取当前日期*/
        Date date = new Date();
        int year = date.getYear()+1900;
        int month = date.getMonth()+1;
        int day = date.getDate();
        String rdate = year+"-"+month+"-"+day;
        System.out.println("addRoute===rdate:"+rdate);
        route.setRdate(rdate);
        int i = routeService.addRoute(route);
        if(i>0){
            System.out.println("更新后addRoute："+route);
            model.addAttribute("routeid",route.getRid());
            session.setAttribute("routesessionid",route.getRid());
            return "jsp/home/routeimage";
        }else{
            return "jsp/home/billadd";
        }

    }

    /*修改路线*/
    //1.显示路线信息
    //路线详情信息展示
    @RequestMapping("/viewRoute")
    public String viewRoute(Integer rid, Model model){
        Route route = routeService.findDetail(rid);
        model.addAttribute("route", route);
        return "jsp/home/billmodify";
    }
    //2.提交路线修改数据
    @RequestMapping("/updateRoute")
    public String update(Route route){
        int i = routeService.updateRoute(route);
        if(i>0){
            return "redirect:homeRouteList";
        }else{
            return "redirect:viewRoute";
        }
    }


    //删除路线信息
    @RequestMapping("/deleteRoute")
    @ResponseBody
    public JsonResult deleteRoute(Integer rid, Model model){
        Route route = new Route();
        route.setRid(rid);
        route.setCategory(null);
        route.setSeller(null);
        route.setRouteImgList(null);
        int i = routeService.deleteRoute(route);
        System.out.println("deleteRoute==="+i);
       if(i>0){
           return new JsonResult().message("删除成功").success(true);
       }else{
           return new JsonResult().message("删除失败").success(false);
       }
    }


}
