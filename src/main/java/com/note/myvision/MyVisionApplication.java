package com.note.myvision;

import java.io.InputStream;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Optional;
import java.util.Timer;
import java.util.TimerTask;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class MyVisionApplication {

	private static final long PEROID_DAY = 24 * 60 * 60 * 1000;
	public static void main(String[] args) {
		SpringApplication.run(MyVisionApplication.class, args);

		LocalDateTime now = LocalDateTime.now();
		long delay = ((23 - now.getHour()) * 60 + 59 - now.getMinute()) * 60 * 1000 - 600000; //10min before day break
		Timer t = new Timer();
		t.schedule(new BackupTask(), delay, PEROID_DAY);
	}

	private static class BackupTask extends TimerTask {
		@override
		public void run() {
			LocalDateTime now = LocalDateTime.now();
			System.out.println("Backup Task Timer:" + now);

			try {
				String fileName = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")) + "_Auto.sql";
				//String cmd = "D:\\Development\\PostgreSQL\\bin\\pg_dump -c --dbname=postgresql://postgres:123456@localhost:5432/myvision2022 -f D:\\Project\\myvision\\data\\sql\\" + fileName;
				String cmd = "/usr/bin/pg_dump -c --dbname=postgresql://postgres:123456@localhost:5432/myvision2022 -f /home/myvision/sql/" + fileName;
				Process ps = Runtime.getRuntime().exec(cmd);
				InputStream eS = ps.getErrorStream();
				// int ret = ps.waitFor();
				// if(ret != 0) {
				// 	System.out.println("Backup Error : " + ret);
				// }
				//backupService.DBDump();
			} catch(Exception e) {}


		}
	}
}
