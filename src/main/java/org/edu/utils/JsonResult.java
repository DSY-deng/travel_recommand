package org.edu.utils;


import java.util.HashMap;
import java.util.List;

/**
 * Json数据返回的工具类
 * 用来接收数据
 */
public class JsonResult extends HashMap<String,Object> {


    public List list;

    public JsonResult message(String message){
        this.put("message",message);
        return this;
    }

    //flag:true  or false
    public JsonResult success(Boolean success){
        this.put("flag",success);
        return this;
    }
}
