/**
 * 
 */
package controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
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

import forms.Arac;
import forms.Kullanici;
import forms.Yerler;
import service.AracService;
import service.KullaniciService;
import service.YerEklemeService;

/**
 * @author Emrah Denizer
 *
 */
@Controller
@RequestMapping(value = "/arazi-cikislari")
public class AracController {
	@Autowired
	YerEklemeService yerEklemeService;
	@Autowired
	KullaniciService kullaniciService;
	@Autowired
	private AracService aracService;
	private Arac arac;

	@RequestMapping(value = "/arac-islemleri")
	public String aracTakip(ModelMap model, @CookieValue(value = "id") Long id) {

		if (arac == null) {

			arac = new Arac();

		}
		model.put("arac", arac);
		model.put("title", "Araç Takip ");
		model.put("kullaniciListesi", kullaniciService.aktifKullaniciListesi('1'));
		model.put("ilceListesi", yerEklemeService.altTipGetir(2l, true));

		if (id == 1 || id == 9) {
			model.put("aracCikisListesi", aracService.tumAracCikislari());
			model.put("girisYapanKullanici", kullaniciService.kullanici());
		} else {
			model.put("girisYapanKullanici", kullaniciService.kullanGetir(id));
			model.put("aracCikisListesi", aracService.kullaniciyaGoreCikisListesi(id));
		}
		arac = null;

		return "aractakip";
	}

	@RequestMapping(value = "/araziCikisEkle")
	public String araziCikisEkle(@ModelAttribute("arac") Arac arac, @CookieValue(value = "id") Long id) {

		Kullanici islemyapan = new Kullanici();
		islemyapan.setId(id);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		// String girilenTarih = (arac.getTarih());
		System.out.println("girilen tarih : " + sdf);
		// arac.getKullanici().getAdi();
		// arac.getOzelPlaka();
		// arac.getResmiPlaka();
		// arac.getIlce();
		// arac.getMahalle();
		// arac.getCikisSaati();
		// arac.getGirisSaati();
		// arac.getAciklama();
		// arac.setIslemZamani(new Date());
		// System.out.println("arayüzden girilen bilgiler: " + arac);
		try {

			if (!arac.getOzelPlaka().equals("")) {

				arac.setResmiPlaka(null);
			}
			System.out.println("ekleme başlangıç");
			System.out.println("işlem yapan : " + islemyapan.getAdi());
			arac.setIslemyapan(islemyapan);
			arac.setIslemZamani(new Date());
			// arac.setOzelPlaka("01R9669");
			// arac.setResmiPlaka("01R1234");
			// arac.setIlce("Saricam");
			// arac.setMahalle("Mustafalar");
			// arac.setGirisSaati("15.00");
			// arac.setCikisSaati("08.00");
			// arac.setTarih(girilenTarih);
			// arac.setAciklama("Deneme");
			System.out.println("girilen bilgiler = " + arac);

			aracService.save(arac);

			return "redirect:/arazi-cikislari/arac-islemleri";
		} catch (Exception e) {
			System.err.println("*********" + e.getMessage());
			System.err.println(e);
			return "redirect:/arazi-cikislari/arac-islemleri";
		}

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/markageti", method = RequestMethod.POST)
	@ResponseBody
	public byte[] markaGetir(@RequestParam(value = "altTipId", required = true) Long altTipId,
			HttpServletResponse response) throws Exception {
		JSONObject jsonObject = new JSONObject();
		List<Yerler> altTipListesi = new ArrayList<Yerler>();
		altTipListesi = yerEklemeService.altTipGetir(altTipId, true);
		Iterator<Yerler> iterator = altTipListesi.iterator();
		while (iterator.hasNext()) {
			Yerler tip = iterator.next();
			jsonObject.put(tip.getId(), tip.getIsim());
		}
		return jsonObject.toJSONString().getBytes("UTF-8");
	}

	@RequestMapping(value = "/duzenle/{id}")
	public String duzenle(@PathVariable("id") Long id) {
		arac = aracService.aracCikisGetir(id);
		System.out.println(arac.getMahalle().getIsim());
		return "redirect:/arazi-cikislari/arac-islemleri";
	}

}
