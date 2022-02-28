package org.edu.web.home;


import org.edu.pojo.Route;
import org.edu.service.RoleService;
import org.edu.service.RouteImgService;
import org.edu.service.RouteService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.*;

import java.util.Date;
import java.util.UUID;

@Controller
public class FileController {

    @Resource
    private RouteService routeService;

    @Resource
    private RouteImgService routeImgService;


@GetMapping("/fileUpload")
public String file() {
//return "file/upload";
    return "jsp/test";

}

@PostMapping("/addDetailPic")
public String fileUpload(@RequestParam(value = "files") MultipartFile[] files,Integer routeid, Model model) {
    System.out.println("routeid==="+routeid);
    System.out.println("uploadImage==="+files);
    if (files != null && files.length > 0) {
        //循环获取file数组中得文件
        for (int i = 0; i < files.length; i++) {
            MultipartFile file  = files[i];

            String fileName = file.getOriginalFilename();

            //控制格式.jpg
            String suffixName = fileName.substring(fileName.lastIndexOf("."));

            String fileBigPicPath = "D://ideal//travel_bili//src//main//webapp//img//product//size4//";

            String fileSmaPicPath = "D://ideal//travel_bili//src//main//webapp//img//product//size2//";

            long time = new Date().getTime();
            System.out.println("time：" + time);
            fileName = time + suffixName;

            /*File destBigPic = new File(fileBigPicPath + fileName);
            File destSmaPic = new File(fileSmaPicPath + fileName);

            if (!destBigPic.getParentFile().exists()) {
                destBigPic.getParentFile().mkdirs();
            }

            if (!destSmaPic.getParentFile().exists()) {
                destSmaPic.getParentFile().mkdirs();

            }*/

            try {
                this.inputStreamToFile((FileInputStream) file.getInputStream(), new File(fileBigPicPath+ fileName));
                this.inputStreamToFile((FileInputStream) file.getInputStream(), new File(fileSmaPicPath+ fileName));

                /*file.transferTo(destBigPic);
                file.transferTo(destSmaPic);*/
            } catch (IOException e) {
                e.printStackTrace();

            }




            System.out.println("fileBigPicPath==:"+fileBigPicPath);
            System.out.println("fileSmaPicPath==:"+fileSmaPicPath);
            System.out.println("fileName==:"+fileName);

            /*更新数据库图片信息*/
            String routeBigPicPath="img/product/size4/"+fileName;
            String routeSmaPicPath="img/product/size2/"+fileName;
            System.out.println("routeBigPicPath==:"+routeBigPicPath);
            System.out.println("routeSmaPicPath==:"+routeSmaPicPath);
            //Route route = new Route();
            boolean issuccess = routeImgService.addDetailPic(routeid, routeBigPicPath, routeSmaPicPath);
            if(issuccess){
                System.out.println("addDetailPic===添加成功:"+issuccess);
            }else{
                System.out.println("addDetailPic===添加失败:"+issuccess);

            }
        }


    }
    return "forward:/addRImage";

}

    @RequestMapping("/addRImage")
    public String addRImage(MultipartFile fileAddRImage,Integer rid, Model model) {
        System.out.println("addRImagerid:"+rid);
        System.out.println("addRImage==="+fileAddRImage);
        if (fileAddRImage != null ) {


                String fileName = fileAddRImage.getOriginalFilename();

                String suffixName = fileName.substring(fileName.lastIndexOf("."));

                String filePath = "D://ideal//travel_bili//src//main//webapp//img//product//small//";

                long time = new Date().getTime();
                System.out.println("time：" + time);
                fileName = time + suffixName;

                File dest = new File(filePath + fileName);

                if (!dest.getParentFile().exists()) {
                    dest.getParentFile().mkdirs();

                }

                try {
                    fileAddRImage.transferTo(dest);

                } catch (IOException e) {
                    e.printStackTrace();

                }

                System.out.println("filePath==:"+filePath);
                System.out.println("fileName==:"+fileName);

                /*更新数据库图片信息*/
                String routeImagePath="img/product/small/"+fileName;
                System.out.println("routeImagePath==:"+routeImagePath);

            int i = routeService.updateRouteByRid(rid, routeImagePath);
            if(i>0){
                System.out.println("addRImage===添加成功:"+i);
            }else{
                System.out.println("addRImage===添加失败:"+i);

            }
        }

       return "redirect:homeRouteList";
    }

    public void inputStreamToFile(InputStream ins, File file) {
        try {
            OutputStream os = new FileOutputStream(file);
            int bytesRead = 0;
            byte[] buffer = new byte[8192];
            while ((bytesRead = ins.read(buffer, 0, 8192)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            os.close();
            ins.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
