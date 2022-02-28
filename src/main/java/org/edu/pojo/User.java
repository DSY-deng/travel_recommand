package org.edu.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 用户实体类
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tab_user")
public class User {

    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer uid;//用户id

    private String username;//用户名，账号
    private String password;//密码
    private String name;//真实姓名
    private String birthday;//出生日期
    private String sex;//男或女
    private String telephone;//手机号
    private String email;//邮箱
    private String status;//激活状态，Y代表激活，N代表未激活


    private String code;//激活码（要求唯一）
}
