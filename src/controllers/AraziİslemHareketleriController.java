/**
 * 
 */
package controllers;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.AraziService;
import araclar.Genel;

import com.google.gson.Gson;

import forms.AraziİslemHareketleri;
import forms.Kullanici;

/**
 * @author Emrah Denizer
 *
 */

@Controller
@RequestMapping(value = "/satis-cesitleri")
public class AraziİslemHareketleriController {
	@Autowired
	AraziService araziService;
	public AraziİslemHareketleri arazi;
	public String tusYazisi = "Kaydet";
	public List<AraziİslemHareketleri> islemTipineGöreListe;
	public Long id = null;

	@RequestMapping(value = "/satis")
	public ModelAndView Satis(ModelMap model,
			@ModelAttribute("araziIslem") AraziİslemHareketleri islemHareketleri) {

		Genel.setKullaniciBean(null);
		if (arazi == null) {
			arazi = new AraziİslemHareketleri();
		}

		ModelAndView modelAndView = new ModelAndView("Satis");

		modelAndView.addObject("tusYazisi", tusYazisi);
		modelAndView.addObject("ilceler", araclar.Genel.ilcelers());
		modelAndView.addObject("title", "Satış Yoluyla Devir");
		modelAndView.addObject("islemListesi",
				araziService.islemHareketleriListesi());
		modelAndView.addObject("araziIslem", arazi);
		modelAndView.addObject("islemTipineGöreListe", islemTipineGöreListe);
		modelAndView.addObject("id", araziService.sonIdGetir());
		tusYazisi = "Kaydet";
		islemHareketleri.setId(0);
		arazi = null;
		return modelAndView;
	}

	@RequestMapping(value = "/ekle")
	public ModelAndView Satis2(@CookieValue(value = "id") Long id,
			AraziİslemHareketleri islemHareketleri, ModelMap model)
			throws ParseException {
		
		Kullanici kullanici = new Kullanici();
		kullanici.setId(id);

		System.out.println(islemHareketleri.getTarih());
		islemHareketleri.setKullanici(kullanici);
		islemHareketleri.setIslemZamani(new Date());
		araziService.save(islemHareketleri);

		islemHareketleri.setId(0);
		ModelAndView modelAndView = new ModelAndView(
				"redirect:/satis-cesitleri/satis");

		islemHareketleri.setDevriIstenenParselAlani(null);
		islemHareketleri.setDevriIstenenParselSayisi(0);
		islemHareketleri.setEvrakNo(0);
		islemHareketleri.setIlce(null);
		islemHareketleri.setIslemZamani(null);
		islemHareketleri.setIzinVerilenParselAlani(null);
		islemHareketleri.setIzinVerilenParselSayisi(0);
		islemHareketleri.setIzinVerilmeyenParselAlani(null);
		islemHareketleri.setIzinVerilmeyenParselSayisi(0);
		islemHareketleri.setKullanici(null);
		islemHareketleri.setMahalle(null);
		islemHareketleri.setNitelik(null);
		islemHareketleri.setTarih(null);
		arazi = null;

		System.out.println(arazi + "güncellendi");
		modelAndView.addObject("araziIslem", arazi);
		tusYazisi = "Kaydet";
		modelAndView.addObject("tusYazisi", tusYazisi);
		return new ModelAndView("redirect:/satis-cesitleri/satis");
	}

	@RequestMapping(value = "/araziIslemDuzelt/{id}")
	public String düzenle(@PathVariable("id") Long id) {
		arazi = araziService.araziİslemGetir(id);
		tusYazisi = "Güncelle";
		System.out.println(arazi.getIlce());

		return "redirect:/satis-cesitleri/satis";
	}

	@RequestMapping(value = "/vazgec")
	public String vazgec(
			@ModelAttribute("araziIslem") AraziİslemHareketleri islemHareketleri) {

		tusYazisi = "Kaydet";

		// islemHareketleri.setEvrakNo((Integer) null);
		// islemHareketleri.setDevriIstenenParselSayisi((Integer) null);
		// islemHareketleri.setIzinVerilenParselSayisi((Integer) null);
		// islemHareketleri.setIzinVerilmeyenParselSayisi((Integer) null);
		islemHareketleri.setId(0);
		arazi = islemHareketleri;
		System.out.println(islemHareketleri.getIlce());

		return "redirect:/satis-cesitleri/satis";
	}

	@RequestMapping(value = "/islemTipineGöreListeGetir", method = RequestMethod.GET)
	public @ResponseBody String islemTipineGöreListeGetir(
			@RequestParam(value = "islemTipi", required = true) String islemTipi) {
		Gson gson = new Gson();

		return gson.toJson(araziService.islemTipineGöreListele(islemTipi));
	}

	@RequestMapping(value = "/id", method = RequestMethod.GET)
	public @ResponseBody Long sonIdNo() {
		System.out.println("id çalıştı");

		return araziService.sonIdGetir().longValue();
	}

}
