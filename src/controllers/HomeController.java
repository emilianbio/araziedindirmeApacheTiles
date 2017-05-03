package controllers;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import forms.Kullanici;
import service.KullaniciService;

@Controller
public class HomeController {

	@RequestMapping(value = "homePage")
	public String anasayfa(ModelMap model, String[] args) {
		// araclar.Main.main(args);
		model.put("title", "Pahara Anasayfa");

		if (kullanici == null) {
			kullanici = new Kullanici();

		}
		model.put("kullanici", kullanici);
		return "homePage";
	}

	@RequestMapping(value = "hellomello")
	public String home(ModelMap model, String[] args) {
		// araclar.Main.main(args);
		model.put("title", "Pahara Anasayfa");
		return "hello";
	}

	@RequestMapping(value = "contact")
	public String contact(ModelMap model) {

		model.put("title", "Contact Manager");
		return "contact";
	}

	@Autowired
	private KullaniciService kullaniciService;
	private Kullanici kullanici;
	public String giris = "0";

	@RequestMapping(value = "/")
	public ModelAndView home(ModelMap model, HttpServletResponse response, HttpServletRequest request)
			throws UnsupportedEncodingException {
		if (kullanici == null) {
			kullanici = new Kullanici();

		}

		Cookie cookie1 = new Cookie("id", "");
		Cookie cookie2 = new Cookie("isim", "");
		// cookie.setValue("");
		// cookie1.setValue("");
		// cookie2.setValue("");
		cookie1.setMaxAge(0);
		cookie2.setMaxAge(0);
		response.addCookie(cookie1);
		response.addCookie(cookie2);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		ModelAndView modelAndView = new ModelAndView("index");
		modelAndView.addObject("girisBasarili", giris);
		modelAndView.addObject("title", "GİRİŞ ");
		modelAndView.addObject("kullanici", kullanici);
		return modelAndView;
	}

	@RequestMapping(value = "/anasayfa")
	public ModelAndView giris(ModelMap model, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView("giris");
		modelAndView.addObject("girisBasarili", giris);
		modelAndView.addObject("title", "Anasayfa ");
		return modelAndView;
	}

	@RequestMapping(value = "/login")
	public ModelAndView kullaniciOnay(@ModelAttribute("kullanici") Kullanici kullanici,
			@RequestParam(value = "isimSoyisim") String isim, @RequestParam(value = "sifre") String sifre,
			HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws UnsupportedEncodingException {
		// kullanici.toString();
		request.setCharacterEncoding("UTF-8");
		kullanici.setBirim(null);
		kullanici.setCepTelefonu(0);
		kullanici.setePosta(null);
		kullanici.setSicilNo(null);
		kullanici.setUnvan(null);

		Kullanici kayitliKullanici = kullaniciService.kullaniciGiris(isim, sifre);
		System.out.println(kullanici.getIsimSoyisim());
		System.out.println("logine basıldı" + " " + new Date());
		if (kayitliKullanici == null) {
			request.setCharacterEncoding("UTF-8");
			JOptionPane panel = new JOptionPane();
			JOptionPane.showMessageDialog(panel, "Yanlış Bilgi Girdiniz....", "Hatalı Giriş",
					JOptionPane.ERROR_MESSAGE);
			System.out.println("Giriş Yapılamadı" + " " + new Date());
			return new ModelAndView("redirect:/");
		} else {

			Cookie cookieId = new Cookie("id", Long.toString(kayitliKullanici.getId()));
			Cookie cookieIsim = new Cookie("isim", kayitliKullanici.getIsimSoyisim());

			// response.setCharacterEncoding("UTF-8");
			String valueId = URLDecoder.decode(cookieId.getValue(), "UTF-8");
			String valueIsim = URLDecoder.decode(cookieIsim.getValue(), "UTF-8");
			System.out.println("cookie isim / " + cookieIsim.getValue().trim());
			System.out.println("cookie id / " + cookieId.getValue().trim());
			System.out.println("value isim / " + valueIsim);
			System.out.println("value id / " + valueId);

			response.addCookie(new Cookie("isim", valueIsim));
			response.addCookie(new Cookie("id", valueId));
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html");
			System.out.println("Giriş Başarılı.." + " " + new Date());
			return new ModelAndView("redirect:/satis-cesitleri/satis");
		}
	}
}
