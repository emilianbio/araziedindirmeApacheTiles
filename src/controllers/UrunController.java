package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "urunler")
public class UrunController {

	@RequestMapping(value = "/urun-tanimlama")
	public String urun(ModelMap model) {
		model.put("title", "Ürün Tanımlama");

		return "uruntanimlama";
	}

}
