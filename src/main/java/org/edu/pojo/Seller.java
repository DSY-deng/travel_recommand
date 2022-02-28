package org.edu.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 商家实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tab_seller")
public class Seller {
    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer sid;//商家id
    private String sname;//商家名称
    private String consphone;//商家电话
    private String address;//商家地址
}
