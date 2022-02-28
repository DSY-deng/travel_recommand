package org.edu.service;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.edu.mapper.CategoryMapper;
import org.edu.mapper.RouteImgMapper;
import org.edu.mapper.RouteMapper;
import org.edu.mapper.SellerMapper;
import org.edu.pojo.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Service
@Transactional(propagation = Propagation.SUPPORTS)
public class RouteService {

    @Resource
    private RouteMapper routeMapper;

    @Resource
    private CategoryMapper categoryMapper;

    @Resource
    private SellerMapper sellerMapper;

    @Resource
    private RouteImgMapper routeImgMapper;

    /*查询某一商品号全部路线*/
    public PageInfo<Route> queryAllRoute(Integer cid,Integer currentPage,String rname){
        System.out.println("-------进入RouteService--------");

      /*  Route route = new Route();
        route.setCid(cid);
        List<Route> routes = routeMapper.select(route);

        System.out.println("RouteService:"+routes);

        return routes;*/

        PageHelper.startPage(currentPage,8);

        Example example = new Example(Route.class);

        Example.Criteria criteria = example.createCriteria();

        if(!StringUtils.isEmpty(rname)){
            criteria.andLike("rname",'%'+rname+'%');
        }
        System.out.println("+++++++rname前+++++++:"+rname);
        if(cid!=null && cid!=0){
            criteria.andEqualTo("cid",cid);
        }

        //rname = new String(rname.getBytes("iso-8859-1"),"utf-8");
        //System.out.println("+++++++rname后+++++++:"+rname);


        List<Route> routes = routeMapper.selectByExample(example);

        System.out.println(routes);
        //设置多表联合查询属性
        //bindRole(routes,cid);

        PageInfo<Route> pageInfo = new PageInfo<Route>(routes);
        System.out.println("前台数据pageInfo展示："+pageInfo);

        return pageInfo;

    }

    /*public void bindRole(List<Route> routes,Integer cid){
        for (Route route:routes){
            route.setCid(cid);
            //smbmsUser.setRolename(smbmsRoleService.queryById(smbmsUser.getUserrole()).getRolename());
        }
    }*/

    public Route findDetail(Integer rid){
        Route route = routeMapper.selectByPrimaryKey(rid);
        //设置seller属性
        Seller seller = sellerMapper.selectByPrimaryKey(route.getSid());
        System.out.println("-----------seller------------:"+seller);
        route.setSeller(sellerMapper.selectOne(seller));

        //catelogory属性
        Category category = categoryMapper.selectByPrimaryKey(route.getCid());
        System.out.println("-----------category------------:"+category);
        route.setCategory(categoryMapper.selectOne(category));

        RouteImg routeImg = new RouteImg();
        routeImg.setRid(route.getRid());
        List<RouteImg> routeImgs = routeImgMapper.select(routeImg);
        System.out.println("-----------routeImgs------------:"+routeImgs);

        route.setRouteImgList(routeImgs);

        System.out.println(route);


        return route;
    }

    /*按收藏次数排序查询总旅游路线*/
    public List<Route> selectBySortAll(){
        Example example = new Example(Route.class);
//排序使用的是列名，数据库里面的列名
        example.orderBy("count").desc();
        //System.out.println("selectBySortAll====count==="+example);
        List<Route> routes = routeMapper.selectByExample(example);
        for(Route routeTar:routes){
            Integer cid = routeTar.getCid();
            Category category = new Category();
            category.setCid(cid);
            Category routeCategory = categoryMapper.selectOne(category);
            //System.out.println("routeCategory============selectBySortAll============="+routeCategory);
            routeTar.setCategory(routeCategory);
        }
        //System.out.println("selectBySortAll====routes==="+routes);
        return routes;
    }

/*    *//*按收藏次数排序查询国内旅游路线*//*
    public List<Route> selectInternalBySort(){
        Example example = new Example(Route.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("cid",5);
        //排序使用的是列名，数据库里面的列名
        example.orderBy("count").desc();
        System.out.println("selectInternalBySort====count==="+example);
        List<Route> routes = routeMapper.selectByExample(example);
        System.out.println("selectInternalBySort====routes==="+routes);
        return routes;
    }*/

   /* *//*按收藏次数排序查询国外旅游路线*//*
    public List<Route> selectAbroadBySortAll(){
        Example example = new Example(Route.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("cid",4);
        //排序使用的是列名，数据库里面的列名
        example.orderBy("count").desc();
        System.out.println("selectAbroadBySortAll====count==="+example);
        List<Route> routes = routeMapper.selectByExample(example);
        System.out.println("selectAbroadBySortAll====routes==="+routes);
        return routes;
    }*/

    /*根据导航栏类别按收藏次数排序查询旅游路线*/
    public List<Route> selectTopByCid(Integer cid){
        Example example = new Example(Route.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("cid",cid);
        //排序使用的是列名，数据库里面的列名
        example.orderBy("count").desc();
        //System.out.println("selectAbroadBySortAll====count==="+example);
        List<Route> routes = routeMapper.selectByExample(example);
        for(Route routeTar:routes){
            Category category = new Category();
            category.setCid(cid);
            Category routeCategory = categoryMapper.selectOne(category);
            //System.out.println("selectAbroadBySortAll============selectBySortAll============="+routeCategory);
            routeTar.setCategory(routeCategory);
        }
        //System.out.println("selectAbroadBySortAll====routes==="+routes);
        return routes;
    }


    /*
    *路线后端管理部分
    *
    */

    //路线管理的分页并查询
    public PageInfo<Route> queryhomeRouteList(String rname,Integer pricelow,Integer pricehigh, Integer pageNum){

        PageHelper.startPage(pageNum,4);

        Example example = new Example(Route.class);

        Example.Criteria criteria = example.createCriteria();
        System.out.println("queryhomeRouteList===rname:"+rname);
        System.out.println("queryhomeRouteList===pricelow:"+pricelow);
        System.out.println("queryhomeRouteList===pricehigh:"+pricehigh);

        if(!StringUtils.isEmpty(rname)){
            criteria.andLike("rname",'%'+rname+'%');
        }

        if(pricelow!=null && pricehigh!=null){
            if(pricelow<pricehigh){
                criteria.andBetween("price",pricelow,pricehigh);
            }
        }


        List<Route> routes = routeMapper.selectByExample(example);

        System.out.println(routes);
       /* //设置多表联合查询属性
        bindRole(smbmsUsers);*/

        PageInfo<Route> pageInfo = new PageInfo<Route>(routes);

        return pageInfo;
    }

    //增加
    @Transactional
    public int addRoute(Route route){
        return routeMapper.insertSelective(route);
    }
    //更新路线信息
    @Transactional
    public int updateRoute(Route route){
        return routeMapper.updateByPrimaryKeySelective(route);
    }

    //删除路线信息
    @Transactional
    public int deleteRoute(Route route) {
        return routeMapper.delete(route);
    }


    //更新路线信息
    @Transactional
    public int updateRouteByRid(Integer rid,String pathname){
        Route route = new Route();
        route.setRid(rid);
        Route routeTar = routeMapper.selectOne(route);
        System.out.println("pathname:"+pathname);
        routeTar.setRimage(pathname);
        return routeMapper.updateByPrimaryKeySelective(routeTar);
    }



}
