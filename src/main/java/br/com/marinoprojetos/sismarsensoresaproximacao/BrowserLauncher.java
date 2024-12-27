package br.com.marinoprojetos.sismarsensoresaproximacao;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class BrowserLauncher implements CommandLineRunner {

    @Override
    public void run(String... args) {

        try {

            String url = "http://localhost:5000";

            String os = System.getProperty("os.name").toLowerCase();

            if (os.contains("nix") || os.contains("nux")) {
                Runtime.getRuntime().exec("pkill firefox");
                Runtime.getRuntime().exec("firefox -new-instance --kiosk " + url);
            }

        } catch (Exception ex){}

    }

}