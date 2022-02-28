package org.edu.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;
import java.util.List;

/**
 * 旅游线路商品实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tab_route")
public class Route {

    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer rid;//线路id，必输
    private String rname;//线路名称，必输
    private Integer price;//价格，必输
    private String routeintroduce;//线路介绍
    private String rflag;   //是否上架，必输，0代表没有上架，1代表是上架
    private String rdate;   //上架时间
    private String isthemetour;//是否主题旅游，必输，0代表不是，1代表是
    private Integer count;//收藏数量
    private Integer cid;//所属分类，必输
    private String rimage;//缩略图
    private Integer sid;//所属商家
    private String sourceid;//抓取数据的来源id

    @Transient
    private Category category;//所属分类
    @Transient
    private Seller seller;//所属商家
    @Transient
    private List<RouteImg> routeImgList;//商品详情图片列表

    //表中没有  注解表示忽略映射
    @Transient
    private Integer total;
    @Transient
    private Integer sumPage;


}
