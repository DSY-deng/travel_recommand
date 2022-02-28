package org.edu.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 分类实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tab_category")
public class Category {

    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer cid;//分类id
    private String cname;//分类名称
}
