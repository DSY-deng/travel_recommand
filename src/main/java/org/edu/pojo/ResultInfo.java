package org.edu.pojo;


/**
 * 用于封装后端返回前端数据对象
 */
public class ResultInfo {
    private boolean flag;//后端返回结果正常为true，发生异常返回false
    private Object data;//后端返回结果数据对象
    private String errorMsg;//发生异常的错误消息
}
