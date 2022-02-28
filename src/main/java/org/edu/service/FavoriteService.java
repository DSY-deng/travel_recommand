package org.edu.service;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.edu.mapper.CategoryMapper;
import org.edu.mapper.FavoriteMapper;
import org.edu.mapper.RouteMapper;
import org.edu.mapper.UserMapper;
import org.edu.pojo.Category;
import org.edu.pojo.Favorite;
import org.edu.pojo.Route;
import org.edu.pojo.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional(propagation = Propagation.SUPPORTS)
public class FavoriteService {


    @Resource
    private FavoriteMapper favoriteMapper;

    @Resource
    private RouteMapper routeMapper;

    @Resource
    private RouteService routeService;

    @Resource
    private CategoryMapper categoryMapper;

    public boolean isFavorite(Integer rid,Integer uid){
        Favorite favorite = new Favorite();
        favorite.setRid(rid);
        favorite.setUid(uid);
        Favorite favoriteOne = favoriteMapper.selectOne(favorite);
        if(favoriteOne!=null){
            return true;
        }else{
            return false;
        }
    }


    //修改收藏次数
    @Transactional
    public boolean addCount(Integer rid){
        Route route = routeService.findDetail(rid);
        Integer count = route.getCount();
        //System.out.println("count前:"+count);
        count++;
        //System.out.println("count后:"+count);
        route.setCount(count);
        int i = routeMapper.updateByPrimaryKeySelective(route);
        if(i>0){
            return true;
        }else{
            return false;
        }
    }

    //添加收藏
    @Transactional
    public boolean addFavorite(Favorite favorite){
        int insert = favoriteMapper.insert(favorite);
        if(insert>0){
            return true;
        }else{
            return false;
        }
    }


    //查询我的收藏路线
    //通过uid查询路线信息
    public List<Favorite> findRoutesByCid(Integer uid){
        Example example = new Example(Favorite.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("uid",uid);
        List<Favorite> favoriteList = favoriteMapper.selectByExample(example);
        for(Favorite favoriteTar:favoriteList){
            Route route = routeMapper.selectByPrimaryKey(favoriteTar.getRid());
            Category category = categoryMapper.selectByPrimaryKey(route.getCid());
            System.out.println("findRoutesByCid======route:"+route);
            favoriteTar.setRoute(route);
            favoriteTar.setCategory(category);
            System.out.println("findRoutesByCid======favoriteTar:"+favoriteTar);
        }
        //System.out.println("selectAbroadBySortAll====routes==="+routes);
        return favoriteList;
    }


    /**
     * 收藏排行榜页面
     * @return
     */
    /*按收藏次数排序查询总旅游路线*/
    public PageInfo<Route> selectFavoriteAll(Integer currentPage,String searchroute,Integer pricelow,Integer pricehigh){

        PageHelper.startPage(currentPage,10);

        Example example = new Example(Route.class);
//排序使用的是列名，数据库里面的列名
        example.orderBy("count").desc();

        Example.Criteria criteria = example.createCriteria();

        if(!StringUtils.isEmpty(searchroute)){
            criteria.andLike("rname",'%'+searchroute+'%');
        }
        System.out.println("+++++++serachroute+++++++:"+searchroute);

        if(pricelow!=null && pricehigh!=null){
            if(pricelow<pricehigh){
                criteria.andBetween("price",pricelow,pricehigh);
            }
        }

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

        System.out.println("selectFavoriteAll:"+routes);

        PageInfo<Route> pageInfo = new PageInfo<Route>(routes);


        System.out.println("前台数据pageInfo展示："+pageInfo);

        return pageInfo;
    }
}
