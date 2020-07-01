package com.note.demo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

@Service
@Transactional
public class BackupService {

	public void DBDump() throws Exception
	{

		try {
            String delStr = " \"C:\\note\\backup.bat\" ";
			Process pro = Runtime.getRuntime().exec(delStr);
			
            if(pro.waitFor() == 0)
            {
                System.out.println("Backup complete.");
			}
            else
            {
				printInputStream(pro.getErrorStream());
                System.out.println("Backup failed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println( "DBDump関数に未知のエラーが発生しました。");
        }
    }
  

	public void DBImport() throws Exception
	{
        String delStr = " \"C:\\note\\import.bat\" ";
        Process pro = Runtime.getRuntime().exec(delStr);
        
        if(pro.waitFor() == 0)
        {
            System.out.println("Import complete.");
        }
        else
        {
            printInputStream(pro.getErrorStream());
            System.out.println("Import failed.");
        }
	}

	public void printInputStream(InputStream is) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(is, "US-ASCII"));
		try {
			for (;;) {
				String line = br.readLine();
				if (line == null) break;
				System.out.println(line);
			}
		} finally {
			br.close();
		}
	}

}