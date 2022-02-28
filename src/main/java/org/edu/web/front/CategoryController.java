package org.edu.web.front;


import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.edu.mapper.CategoryMapper;
import org.edu.pojo.Category;
import org.edu.service.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class CategoryController {

    @Resource
    private CategoryService categoryService;

    //查询所有商品类别
    @RequestMapping("/showAllCategory")
    @ResponseBody
    public List<Category> showAllCategory(){
        //System.out.println("————————进入showAllCategory———————");
        List<Category> categories = categoryService.showAllCategory();
        System.out.println(categories);
        return categories;
    }


}
