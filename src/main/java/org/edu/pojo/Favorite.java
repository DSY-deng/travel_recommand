package org.edu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * 收藏实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "tab_favorite")
public class Favorite {
   /* private Route route;//旅游线路对象
    private String date;//收藏时间
    private User user;//所属用户*/
    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer rid;//旅游线路对象id
    private Date date;//收藏时间
    private Integer uid;//所属用户id

    @Transient
    private Route route;//所属路线

    @Transient
    private Category category;//所属路线

}
