package org.edu.service;


import com.alibaba.druid.util.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.edu.mapper.UserMapper;
import org.edu.pojo.Role;
import org.edu.pojo.User;
import org.edu.utils.JsonResult;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@Transactional(propagation = Propagation.SUPPORTS)
public class UserService {

    @Resource
    private UserMapper userMapper;

    //通过用户名查询用户
    public User findUserByUserName(String userName){
        User user = new User();
        user.setUsername(userName);
        //System.out.println(userName+"\t"+user);
        return userMapper.selectOne(user);
    }

    //激活用户，修改用户状态
    @Transactional
    public int updateStatus(String code){
        User user = new User();
        user.setCode(code);
        //System.out.println("_____进入修改状态程序______");
       //查找唯一编码用户
        User userStatus = userMapper.selectOne(user);
       // System.out.println(userStatus);
        userStatus.setStatus("Y");
        //System.out.println("Status修改后"+userMapper.updateByPrimaryKey(userStatus));
        return userMapper.updateByPrimaryKey(userStatus);
    }

    //增加，注册新用户
    @Transactional
    public int registerUser(User user){
        return userMapper.insertSelective(user);
    }

    //检验验证码是否正确
    public boolean checkRegisterCode(String checkByCode,HttpSession session){

        System.out.println("验证码："+checkByCode);

        //获取程序存放在session中的验证码
        String checkcode_server =(String)session.getAttribute("CHECKCODE_SERVER");

        //立即删除验证码，以免同一验证码反复使用
        session.removeAttribute("CHECKCODE_SERVER");

        //将前端用户输入的验证码与session中的进行比对，是否一致
        if(checkByCode != null && checkByCode.equalsIgnoreCase(checkcode_server)){
            //验证码正确
            return true;
        }else{
            //验证码错误
            return false;
        }


    }

    //test
    //查询所有
    public List<User> queryAllUser(){
        List<User> users = userMapper.selectAll();

        return users;
    }


    /*
    * 后台管理开始
    *
    * */
    //用户管理的分页并查询
    public PageInfo<User> queryhomeUserList(String name,String sex, Integer pageNum){

        PageHelper.startPage(pageNum,5);

        Example example = new Example(User.class);

        Example.Criteria criteria = example.createCriteria();

        if(!StringUtils.isEmpty(name)){
            criteria.andLike("name",'%'+name+'%');
        }
        /*if(userrole!=null && userrole!=0){
            criteria.andEqualTo("userrole",userrole);
        }*/
        if(!StringUtils.isEmpty(sex)){
            criteria.andLike("sex",'%'+sex+'%');
        }

        List<User> users = userMapper.selectByExample(example);

        System.out.println(users);
       /* //设置多表联合查询属性
        bindRole(smbmsUsers);*/

        PageInfo<User> pageInfo = new PageInfo<User>(users);

        return pageInfo;
    }

    //通过id查询用户信息
    public User queryUserByUId(Integer uid){
        User user = userMapper.selectByPrimaryKey(uid);
        //bindRole2(smbmsUser);
        return  user;
    }

    //修改
    @Transactional
    public int updateUser(User user){
        System.out.println("进入updateUserService");
        return userMapper.updateByPrimaryKeySelective(user);
    }

    //增加
    @Transactional
    public int addUser(User user){
        return userMapper.insertSelective(user);
    }


    //删除
    @Transactional
    public int deleteUser(User user){
        return userMapper.delete(user);
    }


    //通过userName查询用户信息
    public boolean queryUserByusername(String username){
        User user = new User();
        user.setUsername(username);
        User userTar = userMapper.selectOne(user);
        System.out.println("queryUserByusername:"+userTar);
        if(userTar!=null){
            return true;
        }else{
            return false;
        }

    }


}
