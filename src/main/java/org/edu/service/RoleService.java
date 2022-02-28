package org.edu.service;


import com.alibaba.druid.util.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.edu.mapper.RoleMapper;
import org.edu.pojo.Role;
import org.edu.pojo.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional(propagation = Propagation.SUPPORTS)
public class RoleService {

    @Resource
    private RoleMapper roleMapper;

    //管理员登录
    public Role loginUser(String rolename,String password){

        Role role = new Role();
        role.setRolename(rolename);
        role.setPassword(password);
        Role roleTar = roleMapper.selectOne(role);
        System.out.println("roleTar===:"+roleTar);
        return roleTar;
    }

    /*通过id查询管理员信息*/
    public Role queryRoleById(Integer rid){
        Role role = roleMapper.selectByPrimaryKey(rid);
        return role;
    }

    /*更新管理员密码信息*/
    /*及更新后端管理信息*/
    public int updateRole(Role role){
        int i = roleMapper.updateByPrimaryKeySelective(role);
        return i;
    }


    /**
     *
     * 后台管理页面
     *
     * */

    //用户管理的分页并查询
    public PageInfo<Role> queryhomeRoleList(String rolename, Integer type, Integer pageNum){

        PageHelper.startPage(pageNum,5);

        Example example = new Example(Role.class);

        Example.Criteria criteria = example.createCriteria();

        if(!StringUtils.isEmpty(rolename)){
            criteria.andLike("rolename",'%'+rolename+'%');
        }
        if(type!=null && type!=0){
            criteria.andEqualTo("type",type);
        }
        /*if(!StringUtils.isEmpty(sex)){
            criteria.andLike("sex",'%'+sex+'%');
        }*/

        List<Role> roles = roleMapper.selectByExample(example);

        System.out.println(roles);
       /* //设置多表联合查询属性
        bindRole(smbmsUsers);*/

        PageInfo<Role> pageInfo = new PageInfo<Role>(roles);

        return pageInfo;
    }

    //通过userName查询用户信息
    public boolean queryRoleByrolename(String rolename){
        Role role = new Role();
        role.setRolename(rolename);
        Role roleTar = roleMapper.selectOne(role);
        System.out.println("queryRoleByrolename:"+roleTar);
        if(roleTar!=null){
            return true;
        }else{
            return false;
        }

    }

    //增加
    @Transactional
    public int addRole(Role role){
        return roleMapper.insertSelective(role);
    }

    //删除
    @Transactional
    public int deleteRole(Role role){
        return roleMapper.delete(role);
    }




}
