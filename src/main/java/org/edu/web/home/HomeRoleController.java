package org.edu.web.home;


import com.github.pagehelper.PageInfo;
import com.sun.deploy.net.HttpResponse;
import org.edu.mapper.UserMapper;
import org.edu.pojo.Role;
import org.edu.pojo.Route;
import org.edu.pojo.User;
import org.edu.service.RoleService;
import org.edu.service.RouteService;
import org.edu.utils.JsonResult;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import redis.clients.jedis.Response;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@Controller
public class HomeRoleController {

    @Resource
    private RouteService routeService;

    @Resource
    private UserMapper userMapper;

    @Resource
    private RoleService roleService;


    //登录
    @RequestMapping("/homelogin")
    public String login(HttpServletResponse response, @RequestParam("rolename") String rolename, @RequestParam("password") String password, Model model, HttpSession session) throws IOException {
        System.out.println("homelogin=====进入"+rolename);

       /* if("".equals(rolename)){
            model.addAttribute("message","用户名不能为空");
            return ;
        }*/
        Role role = roleService.loginUser(rolename,password);

        if (role!=null){

            /*管理员登录账号*/
            session.setAttribute("roleSession",role);
            return "redirect:/jsp/home/frame.jsp";
            //return "jsp/frame";   //跳转 页面：重定向  转发（默认）
            //重定向不识别视图解析器，jsp
            //写法："redirect:/jsp/frame.jsp";

        }
        //model.addAttribute("message","您填写的信息错误，请重新填写");
        /*response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write("<script languge=javascript>alert('您填写的信息错误，请重新登陆！')</script>");*/
        return "jsp/home/login";
    }

    //退出
    //只能get请求
    @RequestMapping("/homeloginOut")
    public String loginOut(HttpSession session){
        //1.销毁session,两种方式
        // session.invalidate();
        session.removeAttribute("roleSession");
        return "redirect:jsp/home/login.jsp";
    }

    /**
     * 用户密码修改
     */
    //1.检查当前输入密码是否与现登录账号密码相同
    @RequestMapping("/checkOldPassword")
    @ResponseBody
    public JsonResult checkOldPassword(String oldpassword, HttpSession session){
        Role role = (Role) session.getAttribute("roleSession");
        if(oldpassword.equals(role.getPassword())){
            System.out.println("--------旧密码与所输入密码一致--------");
            return new JsonResult().message("旧密码与所输入密码一致").success(true);
        }
        return new JsonResult().message("旧密码与所输入密码不一致").success(false);
    }

    //2.更新旧密码
    @RequestMapping("/updateNewPassword")
    public String updateNewPassword(String newpassword,HttpSession session){

        Role roleSession = (Role)session.getAttribute("roleSession");

        Role role = roleService.queryRoleById(roleSession.getRoleid());

        role.setPassword(newpassword);

        int i = roleService.updateRole(role);

        if (i>0){
            System.out.println("------------修改密码成功--------------");
            return "jsp/home/login";
        }
        return "jsp/home/pwdmodify";


    }
    /*后端管理部分*/
    //查询并分页
    @RequestMapping("/homeRoleList")
    public String queryhomeRoleList(Model model, String rolename, Integer type, @RequestParam(defaultValue = "1")Integer pageIndex){
        //System.out.println("______________userList________________");
        PageInfo<Role> rolePageInfo = roleService.queryhomeRoleList(rolename,type,pageIndex);
        //模糊查询
        // List<SmbmsRole> smbmsRoles = smbmsRoleService.queryAllRole();
        //数据回选
        model.addAttribute("rolename",rolename);
        //数据回选结束
        model.addAttribute("type",type);
        //模糊查询结束
        // System.out.println(routePageInfo);
        model.addAttribute("rolePageInfo",rolePageInfo);
        return "jsp/home/providerlist";
    }

    @RequestMapping("/isRoleName")
    @ResponseBody
    public JsonResult isRoleName(String rolename){
        boolean isrolename = roleService.queryRoleByrolename(rolename);
        if(isrolename){
            return new JsonResult().message("该管理员用户名已被使用").success(true);
        }else{
            return new JsonResult().message("该管理员用户名未被使用").success(false);
        }
}


    @RequestMapping("/viewRole")
    public String viewRole(Integer roleid , Model model){
        Role role = roleService.queryRoleById(roleid);
        System.out.println("viewRole==="+role);
        model.addAttribute("role",role);
        return "jsp/home/providerview";
    }

    @RequestMapping("/addRole")
    public String addRole(Role role){
        Date date = new Date();
        int year = date.getYear()+1900;
        int month = date.getMonth()+1;
        int day = date.getDate();
        String createdate = year+"-"+month+"-"+day;
        System.out.println("addRole==createdate:"+createdate);
        role.setCreatetime(createdate);
        int i = roleService.addRole(role);
        if(i>0){
            return "redirect:homeRoleList";
        }else{
            return "jsp/home/probideradd";
        }

    }

    //修改查询
    //1.查询显示
    @RequestMapping("/showRole")
    public String showRole(Integer roleid,Model model){
        Role role = roleService.queryRoleById(roleid);
        System.out.println("showRole===:"+role);
        model.addAttribute("role",role);
        return "jsp/home/providermodify";
    }
    //2.提交修改内容
    @RequestMapping("/updateRole")
    public String updateRole(Role role){
        //System.out.println("updateUser=====："+user);
        int i=roleService.updateRole(role);
        if(i>0){
            // System.out.println("updateUser:====更新成功");
            return "redirect:homeRoleList";
        }else{
            return "jsp/home/rolemodify";
        }
    }

    //删除
    @RequestMapping("/deleteRole")
    @ResponseBody
    public JsonResult deleteRole(@RequestParam("roleid") Integer roleid){
        //System.out.println("----deleteUser-----");
        Role role = roleService.queryRoleById(roleid);
        //System.out.println("deleteUser=========:"+user);
        int i = roleService.deleteRole(role);
        if(i>0){
            return new JsonResult().message("删除管理员信息成功").success(true);
        }else{
            return new JsonResult().message("删除管理员信息失败").success(false);
        }
    }




}
