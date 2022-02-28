package org.edu.pojo;


import com.sun.xml.internal.ws.spi.db.DatabindingException;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 后端管理员验证信息
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tab_role")
public class Role {
    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer roleid;  //管理员id编号
    private String rolename;  //管理员姓名
    private String password;  //管理员密码
    private String sex;    //管理员性别
    private String birthday; //出生日期
    private String telephone;  //管理员联系方式
    private Integer type;  //管理员职称，1--经理，2--普通管理员（经理可以管理经理、普通管理员和用户；普通管理员只能管理用户）
    private String createtime;  //创建时间
}
