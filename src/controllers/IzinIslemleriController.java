/**
 * 
 */
package controllers;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import forms.IzinIslemleri;
import forms.Kullanici;
import service.IzinIslemleriService;
import service.KullaniciService;

/**
 * @author Emrah Denizer
 *
 */

@Controller
@RequestMapping(value = "/izin-islemleri")
public class IzinIslemleriController {
	@Autowired
	KullaniciService kullaniciService;
	@Autowired
	IzinIslemleriService izinIslemleriService;
	private IzinIslemleri izin = null;

	public int toplamİzinHakki = 0;
	public int toplamGörevSüresi = 0;
	public Date yilDonumu = new Date();
	public Kullanici kullanici1;

	@RequestMapping(value = "/izin-formu")
	public ModelAndView izin(@ModelAttribute("izinFormu") IzinIslemleri izinIslem, Long id, ModelMap model) {
		// Genel.setKullaniciBean(null);

		if (izin == null) {
			izin = new IzinIslemleri();
		}
		Map<String, Object> modelAndView = new HashMap<String, Object>();
		modelAndView.put("izinFormu", izin);
		modelAndView.put("title", "İzin Formu");
		modelAndView.put("kullaniciListesi", kullaniciService.kullanici());
		modelAndView.put("izinListesi", izinIslemleriService.izinListesi());
		izin = null;
		return new ModelAndView("Izinler/IzinFormu", modelAndView);
	}

	@ResponseBody
	@RequestMapping(value = "/kullaniciGetir", method = RequestMethod.GET)
	public List<Kullanici> kullaniciGetir(@RequestParam(value = "id") Long id) {

		// System.out.println(kullanici1.getIsimSoyisim());
		return kullaniciService.kullanGetir(id);
	}

	@RequestMapping(value = "/izinEkle", method = RequestMethod.GET)
	public String izinEkle(IzinIslemleri izinIslemleri, Kullanici kullanici) {

		System.out.println(izinIslemleri.getDevirIzinGunSayisi());
		System.out.println(izinIslemleri.getKalanIzinGunSayisi());
		System.out.println(izinIslemleri.getTalepEdilenIzinGunSayisi());

		izinIslemleri.setIslemZamani(new Date());

		izinIslemleriService.izinEkle(izinIslemleri);
		return "redirect:/izin-islemleri/izin-formu";
	}

	@RequestMapping(value = "/yazdir")
	public String yazdir() {

		return "Izinler/IzinFormuYazdir";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/izinGetir", method = RequestMethod.GET)
	public @ResponseBody String izinGetir(@RequestParam(value = "id") Long id) {
		Gson gson = new Gson();
		System.out.println("basıldı");

		JSONArray array = new JSONArray();

		IzinIslemleri izinler = new IzinIslemleri();
		izinler = izinIslemleriService.izinGetir(id);

		JSONObject nesne = new JSONObject();

		nesne.put("id", izinler.getId());
		nesne.put("izinTuru", izinler.getIzinTuru());
		nesne.put("mazeretNedeni", izinler.getMazeretNedeni());
		nesne.put("olurSayisi", izinler.getOlurSayisi());
		nesne.put("isimSoyisim", izinler.getPersonelId().getIsimSoyisim());
		// nesne.put("birim", izinler.getPersonelId().getBirim());
		// nesne.put("unvan", izinler.getPersonelId().getUnvan());
		nesne.put("sicilNo", izinler.getPersonelId().getSicilNo());
		nesne.put("izineCikisTarihi", izinler.getIzineCikisTarihi());
		nesne.put("izindenDonusTarihi", izinler.getIzindenDonusTarihi());
		nesne.put("kalanİzinSayisi", izinler.getKalanIzinGunSayisi());
		nesne.put("devirİzinSayisi", izinler.getDevirIzinGunSayisi());
		nesne.put("istenenIzinGunSayisi", izinler.getTalepEdilenIzinGunSayisi());
		nesne.put("cepTelefonu", izinler.getPersonelId().getCepTelefonu());
		nesne.put("ePosta", izinler.getPersonelId().getePosta());
		nesne.put("yedekPersonelAdi", izinler.getYedekPersonel().getIsimSoyisim());
		// nesne.put("yedekPersonelUnvan",
		// izinler.getYedekPersonel().getUnvan());
		array.add(nesne);

		return gson.toJson(array);
	}

	@RequestMapping(value = "/izinGetirr/{id}")
	public String izinGuncelle(@PathVariable("id") Long id) {

		izin = izinIslemleriService.izinGetir(id);

		// izin.setOlurSayisi(null);
		return "redirect:/izin-islemleri/izin-formu";
	}

	@RequestMapping(value = "/izinVazgec")
	public String izinVazgec() {
		if (izin != null) {

			izin.setId(0);
			izin.setDevirIzinGunSayisi(0);
			izin.setIslemZamani(null);
			izin.setIzindenDonusTarihi(null);
			izin.setIzineCikisTarihi(null);
			izin.setIzinTuru(null);
			izin.setKalanIzinGunSayisi(0);
			izin.setMazeretNedeni(null);
			izin.setOlurSayisi(null);
			izin.setPersonelId(null);
			izin.setTalepEdilenIzinGunSayisi(0);
			izin.setYedekPersonel(null);

		}

		return "redirect:/izin-islemleri/izin-formu";
	}

}
