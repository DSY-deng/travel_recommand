package org.edu.pojo;



/**
 * 旅游线路图片实体类
 */

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tab_route_img")
public class RouteImg {

    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer rgid;//商品图片id
    private Integer rid;//旅游商品id
    private String bigpic;//详情商品大图
    private String smallpic;//详情商品小图
}
