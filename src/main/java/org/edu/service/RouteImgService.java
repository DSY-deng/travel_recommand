package org.edu.service;


import org.edu.mapper.RouteImgMapper;
import org.edu.pojo.RouteImg;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional(propagation = Propagation.SUPPORTS)
public class RouteImgService {

    @Resource
    private RouteImgMapper routeImgMapper;

    /**
     * 添加详情大小图
     */
    //增加
    @Transactional
    public boolean addDetailPic(Integer routeid,String bigpic,String smapic){
        //System.out.println("addDetailPicService:"+routeid);
        RouteImg routeImg = new RouteImg();
        //routeImg.setRgid(null);
        routeImg.setRid(routeid);
        routeImg.setBigpic(bigpic);
        routeImg.setSmallpic(smapic);
        System.out.println("routeImg:"+routeImg);
        int insert = routeImgMapper.insertSelective(routeImg);
        if(insert>0){
            System.out.println("addDetailPic添加成功");
            return true;
        }else{
            return false;
        }
    }

  /*  *//**
     * 添加小图
     *//*
    public boolean addSmaPic(Integer rid,String smapic){
        RouteImg routeImg = new RouteImg();
        routeImg.setRid(rid);
        RouteImg routeImgTar = routeImgMapper.selectOne(routeImg);
        routeImgTar.setSmallpic(smapic);
        int i = routeImgMapper.updateByPrimaryKeySelective(routeImgTar);
        if(i>0){
            return true;
        }else{
            return false;
        }
    }
*/

}
