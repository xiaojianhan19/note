package com.note.demo;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mobile.device.DeviceResolverHandlerInterceptor;
import org.springframework.mobile.device.DeviceWebArgumentResolver;
import org.springframework.mobile.device.site.SitePreferenceHandlerInterceptor;
import org.springframework.mobile.device.site.SitePreferenceWebArgumentResolver;
import org.springframework.mobile.device.view.LiteDeviceDelegatingViewResolver;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.mvc.method.annotation.ServletWebArgumentResolverAdapter;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.thymeleaf.spring5.view.ThymeleafViewResolver;

import java.util.ArrayList;
import java.util.List;

/**
 * @author SLY
 * @description TODO
 * @date 2020/1/18
 */
@Configuration
public class LiteDeviceConfig implements WebMvcConfigurer {

    @Bean
    public LiteDeviceDelegatingViewResolver liteDeviceDelegatingViewResolver(ThymeleafViewResolver thymeleafViewResolver) {
        LiteDeviceDelegatingViewResolver liteDeviceDelegatingViewResolver = new LiteDeviceDelegatingViewResolver(thymeleafViewResolver);
        //liteDeviceDelegatingViewResolver.setMobilePrefix("mobile_");
        //liteDeviceDelegatingViewResolver.setMobileSuffix("_mobile");
        //liteDeviceDelegatingViewResolver.setTabletPrefix("mobile_");
        //liteDeviceDelegatingViewResolver.setNormalPrefix("");
        return liteDeviceDelegatingViewResolver;
    }

    @Bean
    public ContentNegotiatingViewResolver contentNegotiatingViewResolver(LiteDeviceDelegatingViewResolver liteDeviceDelegatingViewResolver){
        ContentNegotiatingViewResolver contentNegotiatingViewResolver = new ContentNegotiatingViewResolver();
        List<ViewResolver> viewResolvers = new ArrayList<>();
        viewResolvers.add(liteDeviceDelegatingViewResolver);
        contentNegotiatingViewResolver.setViewResolvers(viewResolvers);
        return contentNegotiatingViewResolver;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //注册TestInterceptor拦截器
        InterceptorRegistration registration1 = registry.addInterceptor(new DeviceResolverHandlerInterceptor());
        registration1.addPathPatterns("/**");
        registration1.excludePathPatterns("**/*.js,**/*.css,**/*.woff,**/*.ttf");

        InterceptorRegistration registration2 = registry.addInterceptor(new SitePreferenceHandlerInterceptor());
        registration2.addPathPatterns("/**");
        registration2.excludePathPatterns("**/*.js,**/*.css,**/*.woff,**/*.ttf");
    }

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        argumentResolvers.add(new ServletWebArgumentResolverAdapter(new DeviceWebArgumentResolver()));
        argumentResolvers.add(new ServletWebArgumentResolverAdapter(new SitePreferenceWebArgumentResolver()));
    }
}