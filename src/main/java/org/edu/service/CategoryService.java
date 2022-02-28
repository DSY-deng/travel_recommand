package org.edu.service;


import org.edu.mapper.CategoryMapper;
import org.edu.pojo.Category;
import org.edu.utils.JedisUtil;
import org.edu.utils.JsonResult;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Tuple;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
@Transactional(propagation = Propagation.SUPPORTS)
public class CategoryService {


    @Resource
    private CategoryMapper categoryMapper;

    //查询所有商品栏目
    public List<Category> showAllCategory(){

        //1.从redis中查询
        //1.1获取jedis客户端
        Jedis jedis = JedisUtil.getJedis();
        //1.2可使用sortedset排序查询
        //Set<String> categorys = jedis.zrange("category", 0, -1);
        //1.3查询sortedset中的分数(cid)和值(cname)
        Set<Tuple> categorys = jedis.zrangeWithScores("category", 0, -1);

        List<Category> cs = null;
        //2.判断查询的集合是否为空
        if(categorys == null ||categorys.size() == 0){
            //3.如果为空，需要从数据库查询，再将数据存入redis
            //3.1从数据库查询
            System.out.println("----从数据库查询-----");
            cs = categoryMapper.selectAll();
            //3.2将集合存储到redis中的category的key
            for(int i=0;i<cs.size();i++){
                jedis.zadd("category",cs.get(i).getCid(),cs.get(i).getCname());
            }
        }else{
            //4.如果不为空，将set的数据存入list
            System.out.println("----从redis中查询-----");
            cs = new ArrayList<Category>();
            for(Tuple tuple:categorys){
                Category category = new Category();
                category.setCname(tuple.getElement());
                category.setCid((int)tuple.getScore());
                cs.add(category);
            }
        }
        return cs;
    }


    /*根据商品id查询商品姓名*/
    public Category findCnameByCid(Integer cid){
        Category category = new Category();
        category.setCid(cid);
        //  System.out.println("findCnameByCid====service:"+category);
        Category categoryResult = categoryMapper.selectOne(category);
        return categoryResult;
    }


}
