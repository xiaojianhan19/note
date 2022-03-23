package com.note.myvision;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;

public class Utl {

    //status
    public enum Status {
        EV1_ONPROCESS("OnProcess"),
        EV2_CURRENT("Current"),
        EV3_FINISHED("Finished"),
        EV4_GIVEUP("GiveUp"),
        EV5_PLANNING("Planning"),
        EV6_LOOKBACK("LookBack"),
        EV7_COMPLETE("Complete"),
        EV9_REGULAR("Regular"),
        COL1_ONPROCESS("OnProcess");

        // フィールドの定義
        private String name;
        
        // コンストラクタの定義
        private Status(String name) {
            this.name = name;
        }

        public String getValue() {
            return this.name;
        }        
    }

    //sorted
    public enum Sorted {
        ST1_EVENT("Event"),
        ST2_PERSON("Person"),
        ST3_COLLECTION("Collection"),
        ST4_ACHIEVEMENT("Achievement");

        // フィールドの定義
        private String name;
        
        // コンストラクタの定義
        private Sorted(String name) {
            this.name = name;
        }

        public String getValue() {
            return this.name;
        }        
    }


    //parser
    public static Boolean isNullOrEmpty(String str)
    {
        if(str == null || str.trim().equals(""))
            return true;
        else
            return false;
    }

    public static Boolean isNullOrEmpty(int str)
    {
        if(str <= 0)
            return true;
        else
            return false;
    }  

    public static Boolean check(String str)
    {
        if(isNullOrEmpty(str))
            return false;
        else
            return true;
    }

    public static Boolean check(int str)
    {
        if(isNullOrEmpty(str))
            return false;
        else
            return true;
    }

    public static Boolean check(double d)
    {
        if(d == 0.0)
            return false;
        else
            return true;
    }    

    public static int parseInt(String str)
    {
        try {
            return Integer.parseInt(str);
        } catch (Exception e) {
            //e.printStackTrace();
            return 0;
        }
    }

    public static double parseDouble(String str)
    {
        try {
            return Double.parseDouble(str);
        } catch (Exception e) {
            //e.printStackTrace();
            return 0;
        }
    }

    public static String parseIdToString(int id)
    {
        return (id == 0) ? "" : String.valueOf(id);
    }

    public static String parseTimeToString(double time)
    {
        return (time == 0.0) ? "" : String.format("%.2f", time);
    }

    //date
    public static LocalDate MAX_DATE = LocalDate.of(9999,12,31);

    public static LocalDate convertDate(String str)
    {
        try {
            return LocalDate.parse(str);
        } catch (Exception e) {
            //e.printStackTrace();
            return LocalDate.MIN;
        }
    }

    //int
    public static boolean isNumeric(String str) {
        for(int i=0; i < str.length(); i++) {
            if(!Character.isDigit(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    //map
    public static String getMapKeyByValue(Map<String, String> map, String value) {
        for (Entry<String, String> entry : map.entrySet()) {
            if (entry.getValue().equals(value)) {
                return entry.getKey();
            }
        }
        return "";
    }
    // BidiMap<Integer, String> flipMap = bidiMap.inverseBidiMap();
    // flipMap.get(200);           // "キャベツ"
    // flipMap.getKey("レタス");   // null
    // flipMap.getKey("キャベツ"); // 200

    // public static String ToString(LocalDate date)
    // {
    //     try {
    //         return date.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
    //     } catch (Exception e) {
    //         e.printStackTrace();
    //         return LocalDate.MIN.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
    //     }

    // } 


    // ngsql
    // Install-Package Npgsql -Version 4.1.2

    // string conn_str = "Server=gnm-devrtft01;Port=5432;User ID=postgres;Database=note;Password=TSSummit00#;Enlist=true";

    // using (NpgsqlConnection conn = new NpgsqlConnection(conn_str))
    // {
    //     //PostgreSQLへ接続
    //     conn.Open();

    //     string cmd_str = "DELETE FROM person where id=1 ";
    //     NpgsqlCommand cmd = new NpgsqlCommand(cmd_str, conn);
    //     cmd.ExecuteNonQuery();
    //     Console.WriteLine("Connection success!");

    //     conn.Close();
    // }


/**
     * @author 郑明亮
     * @Email zhengmingliang911@gmail.com
     * @Time 2017年2月14日 下午5:14:25
     * @Description <p>获取到对象中属性为null的属性名  </P>
     * @param source 要拷贝的对象
     * @return
     */
    public static String[] getNullPropertyNames(Object source) {
        final BeanWrapper src = new BeanWrapperImpl(source);
        java.beans.PropertyDescriptor[] pds = src.getPropertyDescriptors();
 
        Set<String> emptyNames = new HashSet<String>();
        for (java.beans.PropertyDescriptor pd : pds) {
            Object srcValue = src.getPropertyValue(pd.getName());
            if (srcValue == null) {
                emptyNames.add(pd.getName());
            }
            else if(srcValue instanceof Integer) {
                int value = ((Integer) srcValue).intValue();
                if(value == 0)
                    emptyNames.add(pd.getName());
            }
            else if(srcValue instanceof Double) {
                double value = ((Double) srcValue).doubleValue();
                if(value == 0.0)
                    emptyNames.add(pd.getName());
            }
            else if(srcValue instanceof String) {
                String value = ((String) srcValue);
                if(value.equals(""))
                    emptyNames.add(pd.getName());
            }
        }
        String[] result = new String[emptyNames.size()];
        return emptyNames.toArray(result);
    }
 
    /**
     * @author 郑明亮
     * @Email zhengmingliang911@gmail.com
     * @Time 2017年2月14日 下午5:15:30
     * @Description <p> 拷贝非空对象属性值 </P>
     * @param source 源对象
     * @param target 目标对象
     */
    public static void copyPropertiesIgnoreNull(Object source, Object target) {
        BeanUtils.copyProperties(source, target, getNullPropertyNames(source));
    }

}