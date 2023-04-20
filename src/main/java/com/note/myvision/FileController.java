package com.note.myvision;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/file")
public class FileController {

    @Value("${file.upload.url}")
    private String uploadFilePath;

    @Value("${user.file.path}")
    private String downLoadFilePath;

    @Autowired
    ItemRepository itemRepository;

    @Autowired
    ResourceRepository resourceRepository;    

    @RequestMapping("/upload")
    public String httpUpload(MultipartFile files[], Integer itemId, String resType) {

        if (files == null) {
            return "redirect:/item/item?itemId="+itemId;
        }

        for (int i = 0; i < files.length; i++) {
            
            Optional<Item> res = itemRepository.findById(itemId);
            if(!res.isPresent()) continue;

            try{
                Item item = res.get();
                String fileName = files[i].getOriginalFilename(); // 文件名
                String url = '/' + item.getName() + '/' + fileName;
                File dest = new File(uploadFilePath + url);
                if (!dest.getParentFile().exists()) {
                    dest.getParentFile().mkdirs();
                }
                files[i].transferTo(dest);

                Resource newRes = new Resource();
                newRes.setType(resType);
                newRes.setParentId(item.getId());
                newRes.setUrl(url);
                newRes.setName(fileName);
                newRes.setDate(LocalDate.now().toString());
                newRes.setUpdateDate(LocalDate.now().toString());
                resourceRepository.save(newRes);
                
            } catch (Exception e) {

            }

        }

        return "redirect:/item/view?id="+itemId;
    }

    @RequestMapping(value = "/download", method = RequestMethod.GET)
    public ResponseEntity<FileSystemResource> getFile(String url, Integer itemId, String fileName) throws FileNotFoundException,
            UnsupportedEncodingException {

        String filePath = "";
        if(Utl.check(url)) {
            filePath = downLoadFilePath + url;
        } else {
            Optional<Item> res = itemRepository.findById(itemId);
            if(!res.isPresent()) return null;
            filePath = downLoadFilePath + "/" + res.get().getName() + "/" + fileName;
        }
        File file = new File(filePath);
        if (file.exists()) {
            return export(file);
        }
        System.out.println(file);
        return null;
    }

    public ResponseEntity<FileSystemResource> export(File file) throws UnsupportedEncodingException {
        if (file == null) {
            return null;
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Cache-Control", "no-cache, no-store, must-revalidate");
        headers.add("Content-Disposition", "attachment; filename=" + URLEncoder.encode(file.getName(),"UTF-8")); //+ file.getName()); //filename*=UTF-8''"+URLEncoder.encode("中国","UTF-8")+".txt");
        headers.add("Pragma", "no-cache");
        headers.add("Expires", "0");
        headers.add("Last-Modified", new Date().toString());
        headers.add("ETag", String.valueOf(System.currentTimeMillis()));
        return ResponseEntity.ok().headers(headers).contentLength(file.length()).contentType(MediaType.parseMediaType("application/octet-stream")).body(new FileSystemResource(file));
    }

    @RequestMapping(value = "/testR", method = RequestMethod.GET)  //, method = RequestMethod.GET
    public String testR(Model model) {
        return "redirect:/item/";
    }

}