package org.edu.service;


import org.edu.mapper.CartMapper;
import org.edu.pojo.Cart;
import org.edu.pojo.Favorite;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional(propagation = Propagation.SUPPORTS)
public class CartService {

    @Resource
    private CartMapper cartMapper;

    public boolean isCart(Integer rid,Integer uid){
        Cart cart = new Cart();
        cart.setUid(uid);
        cart.setRid(rid);
        Cart cartOne = cartMapper.selectOne(cart);
        if(cartOne!=null){
            return true;
        }else{
            return false;
        }
    }


    //添加收藏
    @Transactional
    public boolean addCart(Cart cart){
        int insert = cartMapper.insert(cart);
        if(insert>0){
            return true;
        }else{
            return false;
        }
    }
}