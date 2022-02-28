package org.edu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 购物车
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tab_cart")
public class Cart {

    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer cartid;  //购物车订单编号
    private Integer uid;    //当前登录的用户id
    private Integer rid;  //旅游路线id号
    private Integer number;  //几人游
}
