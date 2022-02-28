package org.edu.web.home;

import com.github.pagehelper.PageInfo;
import org.edu.mapper.UserMapper;
import org.edu.pojo.Role;
import org.edu.pojo.User;
import org.edu.service.UserService;
import org.edu.utils.JsonResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class homeUserController {

    @Resource
    private UserService userService;


    //查询并分页
    @RequestMapping("/homeUserList")
    public String queryhomeUserList(Model model, String name,String sex,@RequestParam(defaultValue = "1")Integer pageIndex){
        //System.out.println("______________userList________________");
        PageInfo<User> userPageInfo = userService.queryhomeUserList(name,sex,pageIndex);
        //模糊查询
       // List<SmbmsRole> smbmsRoles = smbmsRoleService.queryAllRole();
        //数据回选
        model.addAttribute("name",name);
        //数据回选结束
        /*手机号数据回选*/
        model.addAttribute("sex",sex);
        //model.addAttribute("roleList",smbmsRoles);
        //模糊查询结束
       // System.out.println(userPageInfo);
        model.addAttribute("userPageInfo",userPageInfo);
        return "jsp/home/userlist";
    }

    //1.查询显示
    @GetMapping("/viewUser")
    public String viewUser(Integer uid,Model model){
        User user = userService.queryUserByUId(uid);
        //System.out.println("viewUser===:"+user);
        model.addAttribute("user",user);
        return "jsp/home/userview";
    }

    //修改查询
    //1.查询显示
    @GetMapping("/showUser")
    public String showUser(Integer uid,Model model){
        User user = userService.queryUserByUId(uid);
        //System.out.println("homeshowUser===:"+user);
        model.addAttribute("user",user);
        return "jsp/home/usermodify";
    }
    //2.提交修改内容
    @GetMapping("/updateUser")
    public String updateUser(User user){
        //System.out.println("updateUser=====："+user);
        int i=userService.updateUser(user);
        if(i>0){
           // System.out.println("updateUser:====更新成功");
            return "redirect:homeUserList";
        }else{
            return "jsp/home/usermodify";
        }
    }

    //删除
    @RequestMapping("/deleteUser")
    @ResponseBody
    public JsonResult deleteUser(@RequestParam("uid") Integer uid){
        //System.out.println("----deleteUser-----");
        User user = userService.queryUserByUId(uid);
        //System.out.println("deleteUser=========:"+user);
        int i = userService.deleteUser(user);
        if(i>0){
            return new JsonResult().message("删除成功").success(true);
        }else{
            return new JsonResult().message("删除失败").success(false);
        }
    }

    //1.查询显示
    @GetMapping("/isUserName")
    @ResponseBody
    public JsonResult isUserName(String username){
        boolean isUserName = userService.queryUserByusername(username);
        //System.out.println("homeshowUser===:"+isUserName);
        if(isUserName){
            return new JsonResult().message("该用户名称已被使用").success(true);
        }else{
            return new JsonResult().message("该用户名未被使用").success(false);
        }
    }


    @RequestMapping("/homeAddUser")
    public String homeAddUser(User user){
        //System.out.println("homeAddUser===:"+user);
        int i = userService.addUser(user);
        if(i>0){
            return "redirect:homeUserList";
        }else{
            return "jsp/home/useradd";
        }
    }


}
