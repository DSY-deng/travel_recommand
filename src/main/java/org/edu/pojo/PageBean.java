package org.edu.pojo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author: ZhouCong
 * @date: Create in 2020/1/10 13:42
 * @description: 分页对象
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageBean {

    /**
     * @description: 总记录数
     */
    private Integer totalCount;

    /**
     * @description: 总页数
     */
    private Integer totalPage;

    /**
     * @description: 当前页码
     */
    private Integer currentPage;

    /**
     * @description: 每页显示的条数
     */
    private Integer pageSize;

    /**
     * @description: 每页显示的数据集合
     */
    private List list;
}
