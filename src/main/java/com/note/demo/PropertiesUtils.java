package com.note.demo;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
 
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Properties;
 
/**
 * @author candy
 * @version 1.0
 * @createDate 2020/5/16 22:58
 * @description 获取文件配置信息
 */
public class PropertiesUtils {
 
    protected Logger logger = LoggerFactory.getLogger(getClass());
    public Properties properties;
    private String[] resourcesPaths;
 
    // 无参构造
    public PropertiesUtils() {
    }
 
    // 传入配置文件名称，可以多个
    public PropertiesUtils(String... resourcesPaths) {
        load(resourcesPaths);
    }
 
    // 加载配置文件信息
    private void load(String[] resourcesPaths) {
        this.resourcesPaths = resourcesPaths;
        properties = new Properties();
        for (String location : resourcesPaths) {
            InputStream is = null;
            try {
                is = new FileInputStream(getAbsolutePath(location));
                properties.load(is);
                //is.close();
            } catch (IOException ex) {
                logger.info("Could not load properties from path:" + location + ", " + ex.getMessage());
            } catch (Exception ex) {
                logger.info("Could not load properties from path:" + location + ", " + ex.getMessage());
            } finally {
                //IOUtils.closeQuietly(is);
            }
        }
    }
 
    // 获取根据key获取value
    public Object getValue(String key) {
        if (properties.containsKey(key)) {
            return properties.getProperty(key);
        }
        return "";
    }
 
    // 获取文件绝对路径
    public String getAbsolutePath(String filename) throws URISyntaxException {
        return PropertiesUtils.class.getClassLoader().getResource(filename).toURI().getPath();
    }
 
}
