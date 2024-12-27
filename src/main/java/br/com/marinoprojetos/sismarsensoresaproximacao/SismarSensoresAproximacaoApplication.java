package br.com.marinoprojetos.sismarsensoresaproximacao;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableAsync
@EnableScheduling
@EnableFeignClients
public class SismarSensoresAproximacaoApplication{

	public static void main(String[] args) {

		System.out.println("testeee");
		try {

			String os = System.getProperty("os.name").toLowerCase();

			if (os.contains("nix") || os.contains("nux")) {
				Runtime.getRuntime().exec("pkill firefox");
				Runtime.getRuntime().exec("firefox -new-instance --kiosk file:///home/pi/startup.html");
			}

		} catch (Exception ex) {}

		SpringApplication.run(SismarSensoresAproximacaoApplication.class, args);

	}

}
