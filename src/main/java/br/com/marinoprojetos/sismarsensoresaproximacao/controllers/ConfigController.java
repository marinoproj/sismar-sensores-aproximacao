package br.com.marinoprojetos.sismarsensoresaproximacao.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.marinoprojetos.sismarsensoresaproximacao.models.Config;
import br.com.marinoprojetos.sismarsensoresaproximacao.services.ConfigService;

@Controller
@RequestMapping("/config")
public class ConfigController {	
	
	@Autowired
	private ConfigService configService;	
	
	@PostMapping("/change")
	public String saveConfig(@ModelAttribute("config") Config config) {		
		configService.save(config);
		return "redirect:/";
	}	
	
	@GetMapping
    public String config(Model model) {		
		Config config = configService.getConfig();
		config = config == null ? new Config() : config;				
		
		model.addAttribute("config", config);
		
        return "config";        
    }
		
}