/**
 * 
 */
package controllers;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import forms.Arac;
import forms.Kullanici;
import service.AracService;

/**
 * @author Emrah Denizer
 *
 */
@Controller
@RequestMapping(value = "/arazi-cikislari")
public class AracController {
	@Autowired
	AracService aracService;

	@RequestMapping(value = "/arac-islemleri")
	public String aracTakip(ModelMap model) {
		model.put("title", "Araç Takip");

		return "AraziCikis/AracTakip";
	}

	@RequestMapping(value = "/araziCikisEkle")
	public String kaydet() {
		Arac arac = new Arac();
		Kullanici kullanici = new Kullanici();
		kullanici.setId(1);
		arac.setIlce("");
		arac.setMahalle("");
		arac.setTarih(new Date());
		arac.setKullanici(kullanici);
		System.out.println("ekleye basıldı");
		try {
			System.out.println("eklemeye çalışıyor");

			aracService.kaydet(arac);

			System.out.println("ekledi");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("ekleme başarısız...");
			System.err.println(e);
		}

		return "redirect:/arazi-cikislari/arac-islemleri";
	}
}
