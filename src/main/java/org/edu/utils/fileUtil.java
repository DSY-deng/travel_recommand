package org.edu.utils;

import com.fasterxml.jackson.core.json.ByteSourceJsonBootstrapper;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;

public class fileUtil {

    public String fileUpload(MultipartFile file) {

        if (file.isEmpty()) {
            //return "file/upload";
            return "";

        }

        String fileName = file.getOriginalFilename();

        String suffixName = fileName.substring(fileName.lastIndexOf("."));

        String filePath = "D://ideal//travel_bili//src//main//webapp//img//product//small//";

        long time =new Date().getTime();
        System.out.println("time："+time);
        fileName = time + suffixName;

        File dest = new File(filePath + fileName);

        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();

        }

        try {
            file.transferTo(dest);

        } catch (IOException e) {
            e.printStackTrace();

        }

        //String filename = "testimages/" + fileName;
        return fileName;

    }
}
