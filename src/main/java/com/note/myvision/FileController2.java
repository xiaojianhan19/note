package com.note.myvision;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.core.io.FileSystemResource;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/file2")
public class FileController2 {

    // 上传文件存储的目录
    @Value("${file.upload-dir}")
    private String uploadDir;
    private List<FileSystemResource> files = new ArrayList<>();

    @PostConstruct
    public void init() throws IOException {
        File uploadFiles = new File(uploadDir);
        if (!uploadFiles.exists()) {
          uploadFiles.mkdir();
        } else {
          File[] filesArray = uploadFiles.listFiles(File::isFile);
          if (filesArray != null) {
              files.addAll(Arrays.asList(filesArray)
                      .stream()
                      .map(FileSystemResource::new)
                      .collect(Collectors.toList()));
          }
        }
    }

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("files", files);
        return "file_upload";
    }

    @PostMapping("/")
    public String uploadFile(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) throws IOException {
      FileSystemResource resource = storeFile(file);
      files.add(resource);
      redirectAttributes.addFlashAttribute("message", "You successfully uploaded " + file.getOriginalFilename() + "!");
      return "redirect:/file2/";
    }

    @GetMapping("/download")
    public ResponseEntity<Resource> downloadFile(@RequestParam String filename) throws IOException {
        File file = new File(uploadDir, filename);
        Resource resource = new UrlResource(file.toURI());

        return ResponseEntity.ok()
            .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
            .body(resource);
    }

    public FileSystemResource storeFile(MultipartFile file) throws IOException {
      String filename = StringUtils.cleanPath(file.getOriginalFilename());
      Path filePath = Paths.get(uploadDir, filename).normalize();
      Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
      return new FileSystemResource(filePath.toFile());
  }
    
}
