package com.note.myvision;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 自定义配置
 *
 * @copyright www.codecoord.com Inc. All rights reserved.
 * @author tianxincode@163.com
 * @date 2019/8/31
 */
@Component
public class CustomWebConfiguration implements WebMvcConfigurer {
    @Value("${user.file.path}")
    private String filePath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        // 注意如果filePath是写死在这里，一定不要忘记尾部的/或者\\，这样才能读取其目录下的文件
        registry.addResourceHandler("/**").addResourceLocations(
                "classpath:/META-INF/resources/",
                "classpath:/resources/",
                "classpath:/static/",
                "classpath:/public/",
                "file:/" + filePath, // use //tmp or D:\
                "classpath:/webapp/");
    }
}
