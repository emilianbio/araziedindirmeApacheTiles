package controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import forms.AraziİslemHareketleri;
import service.AraziService;
import service.RaporlarService;

@Controller
@RequestMapping(value = "/raporlar", method = RequestMethod.GET)
public class RaporlarController {
	@Autowired
	AraziService araziService;
	@Autowired
	RaporlarService raporlarService;
	public String islemTipi = "";
	public AraziİslemHareketleri arazi;

	@RequestMapping(value = "/satisrapor")
	public ModelAndView giris(
			@ModelAttribute("araziIslem") AraziİslemHareketleri araziİslemHareketleri,
			ModelMap model, HttpServletRequest request,
			@CookieValue(value = "id", required = true) Long id) {
		ModelAndView modelAndView = new ModelAndView("Raporlar/SatisRaporlari");
		modelAndView.addObject("title", "Raporlar ");
		modelAndView.addObject("islemListesi",
				araziService.islemHareketleriListesi());

		if (arazi == null) {

			arazi = new AraziİslemHareketleri();
		}
		modelAndView.addObject("araziIslem", arazi);
		/* yönetici değilse geldiği sayfaya geri döner -BAŞLANGIÇ */
		// if (id != 1) {
		// String referer = request.getHeader("Referer");
		// return new ModelAndView("redirect:" + referer);

		/* yönetici değilse geldiği sayfaya geri döner -SON */
		// } else if (id == 3) {
		// System.out.println(id + " is null");
		// return new ModelAndView("redirect:/");

		// }

		// else

		List<AraziİslemHareketleri> arazi = new ArrayList<AraziİslemHareketleri>();
		arazi = araziService.islemHareketleriListesi();
		int devriIstenenParselSayisiToplami = 0, izinVerilenParselSayisiToplami = 0, izinVerilmeyenParselSayisiToplami = 0;
		float devriIstenenParselAlaniToplami = 0, izinVerilenParselAlaniToplami = 0, izinVerilmeyenParselAlaniToplami = 0;

		for (int i = 0; i < arazi.size(); i++) {
			devriIstenenParselSayisiToplami += arazi.get(i)
					.getDevriIstenenParselSayisi();
			devriIstenenParselAlaniToplami += arazi.get(i)
					.getDevriIstenenParselAlani();

			izinVerilenParselSayisiToplami += arazi.get(i)
					.getIzinVerilenParselSayisi();

			izinVerilenParselAlaniToplami += arazi.get(i)
					.getIzinVerilenParselAlani();

			izinVerilmeyenParselSayisiToplami += arazi.get(i)
					.getIzinVerilmeyenParselSayisi();

			izinVerilmeyenParselAlaniToplami += arazi.get(i)
					.getIzinVerilmeyenParselAlani();

			if (!(arazi.get(i).getDevriIstenenParselAlani() == arazi.get(i)
					.getIzinVerilenParselAlani()
					+ arazi.get(i).getIzinVerilmeyenParselAlani())) {
				System.out.print(arazi.get(i).getId() + "---");
				System.out.print(arazi.get(i).getDevriIstenenParselAlani()
						+ "---");
				System.out.print(arazi.get(i).getIzinVerilenParselAlani()
						+ "---");
				System.out.print(arazi.get(i).getIzinVerilmeyenParselAlani()
						+ "---");
				System.out.print(arazi.get(i).getIzinVerilenParselAlani()
						+ arazi.get(i).getIzinVerilmeyenParselAlani() + "---");
				System.out
						.println(arazi.get(i).getDevriIstenenParselAlani() == arazi
								.get(i).getIzinVerilenParselAlani()
								+ arazi.get(i).getIzinVerilmeyenParselAlani());
			}

		}

		modelAndView.addObject("devriIstenenParselSayisi",
				devriIstenenParselSayisiToplami);
		modelAndView.addObject("devriIstenenParselAlani",
				devriIstenenParselAlaniToplami);
		modelAndView.addObject("izinVerilenParselSayisi",
				izinVerilenParselSayisiToplami);
		modelAndView.addObject("izinVerilenParselAlani",
				izinVerilenParselAlaniToplami);
		modelAndView.addObject("izinVerilmeyenParselSayisi",
				izinVerilmeyenParselSayisiToplami);
		modelAndView.addObject("izinVerilmeyenParselAlani",
				izinVerilmeyenParselAlaniToplami);
		modelAndView.addObject("ilceler", araclar.Genel.ilcelers());

		return modelAndView;
	}

	@RequestMapping(value = "/rapor", method = RequestMethod.GET)
	public @ResponseBody ArrayList<AraziİslemHareketleri> raporlarListesi() {
		// System.out.println(raporlarService.raporlarListesi());

		for (int i = 0; i < raporlarService.raporlarListesi().size(); i++) {

			System.out.println(raporlarService.raporlarListesi().get(i)
					.getIlce().toString());
		}
		return raporlarService.raporlarListesi();
	}

	@RequestMapping(value = "/ilceyeGöreListeGetir", method = RequestMethod.GET)
	public @ResponseBody String islemTipineGöreListeGetir(
			@RequestParam(value = "ilce", required = true) String ilce) {
		Gson gson = new Gson();

		return gson.toJson(araziService.ilceyeGöreListele(ilce));
	}

	public ModelAndView toplamAraziSatislari() {
		ModelAndView modelAndView = new ModelAndView(
				"redirect:/raporlar/satisrapor");

		return modelAndView;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/toplam", method = RequestMethod.GET)
	public @ResponseBody Map<String, Long> list() {
		List<AraziİslemHareketleri> arazi = new ArrayList<AraziİslemHareketleri>();
		arazi = araziService.islemHareketleriListesi();
		int devriIstenenParselSayisiToplami = 0, izinVerilenParselSayisiToplami = 0, izinVerilmeyenParselSayisiToplami = 0;
		float devriIstenenParselAlaniToplami = 0, izinVerilenParselAlaniToplami = 0, izinVerilmeyenParselAlaniToplami = 0;

		for (int i = 0; i < arazi.size(); i++) {
			devriIstenenParselSayisiToplami += arazi.get(i)
					.getDevriIstenenParselSayisi();
			devriIstenenParselAlaniToplami += arazi.get(i)
					.getDevriIstenenParselAlani();

			izinVerilenParselSayisiToplami += arazi.get(i)
					.getIzinVerilenParselSayisi();

			izinVerilenParselAlaniToplami += arazi.get(i)
					.getIzinVerilenParselAlani();

			izinVerilmeyenParselSayisiToplami += arazi.get(i)
					.getIzinVerilmeyenParselSayisi();

			izinVerilmeyenParselAlaniToplami += arazi.get(i)
					.getIzinVerilmeyenParselAlani();

		}
		Map<String, Long> toplam = new JSONObject();

		toplam.put("devriIstenenParselSayisiToplami",
				(long) devriIstenenParselSayisiToplami);
		toplam.put("devriIstenenParselAlaniToplami",
				(long) devriIstenenParselAlaniToplami);
		toplam.put("izinVerilenParselSayisiToplami",
				(long) izinVerilenParselSayisiToplami);
		toplam.put("izinVerilenParselAlaniToplami",
				(long) izinVerilenParselAlaniToplami);
		toplam.put("izinVerilmeyenParselSayisiToplami",
				(long) izinVerilmeyenParselSayisiToplami);
		toplam.put("izinVerilmeyenParselAlaniToplami",
				(long) izinVerilmeyenParselAlaniToplami);

		return toplam;
	}
}
