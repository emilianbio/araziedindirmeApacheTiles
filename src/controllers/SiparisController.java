package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/siparis")
public class SiparisController {

	@RequestMapping(value = "/siparis-control")
	public String sipariskontrol(ModelMap model) {

		model.put("title", "Siparis Kontrol");

		return "sipariscontrol";
	}

	@RequestMapping(value = "/siparis-listesi")
	public String siparislistesi(ModelMap model) {

		model.put("title", "Siparis Listesi");

		return "siparislistesi";
	}

	@RequestMapping(value = "/siparis-onay")
	public String siparisonay(ModelMap model) {

		model.put("title", "Siparis Onay");

		return "siparisonay";
	}

	@RequestMapping(value = "/siparis-ver")
	public String siparisver(ModelMap model) {

		model.put("title", "Siparis Ver");

		return "siparisver";
	}

}
