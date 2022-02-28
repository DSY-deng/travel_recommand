package org.edu.web.front;


import org.edu.pojo.User;
import org.edu.service.UserService;
import org.edu.utils.JsonResult;
import org.edu.utils.MailUtils;
import org.edu.utils.UuidUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    @Resource
    private UserService userService;

    //测试
    @RequestMapping("/hello")
    public String test(Model model){
        List<User> users = userService.queryAllUser();
        System.out.println(users);
        model.addAttribute("test","测试完成");

        return "jsp/front/test";
    }

    //登录
    @RequestMapping("/login")
    @ResponseBody
    public JsonResult loginUser(String username,String password,String checkByCode,HttpSession session){
        //校验账号，密码是否正确
        /*System.out.println("username:"+username);
        System.out.println("password:"+password);
        System.out.println("checkByCode:"+checkByCode);*/
        User user = userService.findUserByUserName(username);
        //System.out.println("loginUser:"+user);

        //获取程序存放在session中的验证码
        String checkcode_server =(String)session.getAttribute("CHECKCODE_SERVER");

        //System.out.println("checkcode_server:"+checkcode_server);
        //立即删除验证码，以免同一验证码反复使用
        session.removeAttribute("CHECKCODE_SERVER");

        if(user==null){
            return new JsonResult().message("该用户不存在").success(false);
        }

        if("".equals(password) || !password.equalsIgnoreCase(user.getPassword())){
            return new JsonResult().message("用户名或密码错误").success(false);
        }

        if("".equals(checkByCode) || checkcode_server == null || !checkcode_server.equalsIgnoreCase(checkByCode)){
            return new JsonResult().message("验证码错误,请更新验证码并重新输入").success(false);
        }

        if("".equals(user.getStatus()) || !user.getStatus().equalsIgnoreCase("Y")){
            return new JsonResult().message("该用户尚未激活，请登录邮箱前往激活").success(false);
        }
        session.setAttribute("loginUser",user);
        return new JsonResult().message("登陆成功").success(true);
    }

    //展示正在登陆用户名
    @RequestMapping("/showUsername")
    @ResponseBody
    public JsonResult showUsername(HttpSession session){
        User loginUser = (User) session.getAttribute("loginUser");
        //System.out.println("showUsername:"+loginUser);
        if(loginUser!=null) {
            return new JsonResult().message(loginUser.getName()).success(true);
        }else{
            return new JsonResult().message("用户未登录").success(false);
        }
    }

    //退出登录
    @RequestMapping("/loginOut")
    public String loginOut(HttpSession session){
        session.removeAttribute("loginUser");
        return "jsp/front/index";
    }



    //查询注册用户名是否存在
    @RequestMapping("/findUserByUserName")
    @ResponseBody
    public JsonResult findUserByUserName(String username){

        User user = userService.findUserByUserName(username);
        System.out.println("findUserByUserName"+user);
        if(user!=null){
            return new JsonResult().message("查找成功").success(true);
        }else{
            return new JsonResult().message("查找失败").success(false);
        }

    }

    //激活用户
    @RequestMapping("/activeUser")
    public String activeUser(String code,HttpSession session){
        System.out.println("-------进入activeUser--------");
        System.out.println("code"+code);
        if(code!=null){
            //调用UserService,将用户状态修改为"Y"
            int i = userService.updateStatus(code);
            String msg=null;
            if(i>0){
                //激活成功
                System.out.println("激活成功");
                msg = "激活成功,请登录";
            }else{
                //激活失败
                System.out.println("激活失败");
                msg = "激活失败，请联系管理员!";
            }
            session.setAttribute("msg",msg);
        }
        return "jsp/front/activeuser";
    }

    //注册，增加
    @RequestMapping("/registerUser")
    @ResponseBody
    public JsonResult registerUser(User user,String check,HttpSession session){
        System.out.println("進入注冊方法-----");
        System.out.println(user);
        System.out.println("-------check-------"+check);
        boolean checkRegisterCode = userService.checkRegisterCode(check, session);
        System.out.println("checkRegisterCode:"+checkRegisterCode);
        int i=0;
        if(checkRegisterCode){
            //设置用户激活状态
            user.setStatus("N");
            //设置用户激活码，唯一字符串
            user.setCode(UuidUtil.getUuid());
            System.out.println("设置后："+user);
            i = userService.registerUser(user);
            //发送激活邮件，邮件正文
            String emailContent = "<a href='http://localhost:8080/activeUser?code="+user.getCode()+"'>点击激活【515旅游网】</a>";
            //发送邮件
            MailUtils.sendMail(user.getEmail(),emailContent,"激活邮件");
        }else{
            return new JsonResult().message("验证码错误").success(false);
        }

        if(i>0){
            return new JsonResult().message("注册成功").success(true);
        }else{
            return new JsonResult().message("注册失败").success(false);
        }

    }
}
