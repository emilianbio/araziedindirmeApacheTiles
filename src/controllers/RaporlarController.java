package controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import forms.Arac;
import forms.AraziİslemHareketleri;
import service.AracService;
import service.AraziService;
import service.RaporlarService;

@Controller
@RequestMapping(value = "/raporlar", method = RequestMethod.GET)
public class RaporlarController {
	@Autowired
	AraziService araziService;
	@Autowired
	RaporlarService raporlarService;
	@Autowired
	AracService aracService;
	public String islemTipi = "";
	public AraziİslemHareketleri arazi;
	public String dosyaDurumu = null;
	public String download = "";

	@RequestMapping(value = "/satisrapor")
	public ModelAndView giris(@ModelAttribute("araziIslem") AraziİslemHareketleri araziİslemHareketleri, ModelMap model,
			HttpServletRequest request, @CookieValue(value = "id", required = true) Long id) {
		ModelAndView modelAndView = new ModelAndView("rapor");
		modelAndView.addObject("title", "Raporlar ");
		modelAndView.addObject("islemListesi", araziService.islemHareketleriListesi());

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

		List<AraziİslemHareketleri> araziList = new ArrayList<AraziİslemHareketleri>();
		araziList = araziService.islemHareketleriListesi();
		int devriIstenenParselSayisiToplami = 0, izinVerilenParselSayisiToplami = 0,
				izinVerilmeyenParselSayisiToplami = 0;
		float devriIstenenParselAlaniToplami = 0, izinVerilenParselAlaniToplami = 0,
				izinVerilmeyenParselAlaniToplami = 0;

		for (int i = 0; i < araziList.size(); i++) {

			devriIstenenParselSayisiToplami += araziList.get(i).getDevriIstenenParselSayisi();
			devriIstenenParselAlaniToplami += araziList.get(i).getDevriIstenenParselAlani();

			izinVerilenParselSayisiToplami += araziList.get(i).getIzinVerilenParselSayisi();

			izinVerilenParselAlaniToplami += araziList.get(i).getIzinVerilenParselAlani();

			izinVerilmeyenParselSayisiToplami += araziList.get(i).getIzinVerilmeyenParselSayisi();

			izinVerilmeyenParselAlaniToplami += araziList.get(i).getIzinVerilmeyenParselAlani();

			if (!(araziList.get(i).getDevriIstenenParselAlani() == araziList.get(i).getIzinVerilenParselAlani()
					+ araziList.get(i).getIzinVerilmeyenParselAlani())) {

				System.out.println("==================VERİTABANI HATALI VERİLER==================");
				System.out.println(araziList.get(i).getTarih() + "-----");

				System.out.print(araziList.get(i).getId() + "---");
				System.out.print(araziList.get(i).getDevriIstenenParselAlani() + "---");
				System.out.print(araziList.get(i).getIzinVerilenParselAlani() + "---");
				System.out.print(araziList.get(i).getIzinVerilmeyenParselAlani() + "---");
				System.out.print(araziList.get(i).getIzinVerilenParselAlani()
						+ araziList.get(i).getIzinVerilmeyenParselAlani() + "---");
				System.out.println(
						araziList.get(i).getDevriIstenenParselAlani() == araziList.get(i).getIzinVerilenParselAlani()
								+ araziList.get(i).getIzinVerilmeyenParselAlani());
				System.out.println("==================VERİTABANI HATALI VERİLER SON==================");
			}

		}

		if (dosyaDurumu != null) {

			modelAndView.addObject("dosyaDurumu", dosyaDurumu);
		}
		modelAndView.addObject("devriIstenenParselSayisi", devriIstenenParselSayisiToplami);
		modelAndView.addObject("devriIstenenParselAlani", devriIstenenParselAlaniToplami);
		modelAndView.addObject("izinVerilenParselSayisi", izinVerilenParselSayisiToplami);
		modelAndView.addObject("izinVerilenParselAlani", izinVerilenParselAlaniToplami);
		modelAndView.addObject("izinVerilmeyenParselSayisi", izinVerilmeyenParselSayisiToplami);
		modelAndView.addObject("izinVerilmeyenParselAlani", izinVerilmeyenParselAlaniToplami);
		modelAndView.addObject("ilceler", araclar.Genel.ilcelers());
		modelAndView.addObject("aylar", araclar.Genel.aylar());
		modelAndView.addObject("download", download);
		download = "";
		dosyaDurumu = null;
		return modelAndView;
	}

	@RequestMapping(value = "/rapor", method = RequestMethod.GET)
	public @ResponseBody ArrayList<AraziİslemHareketleri> raporlarListesi() {
		// System.out.println(raporlarService.raporlarListesi());

		for (int i = 0; i < raporlarService.raporlarListesi().size(); i++) {

			System.out.println(raporlarService.raporlarListesi().get(i).getIlce().toString());
		}
		return raporlarService.raporlarListesi();
	}

	@RequestMapping(value = "/ilceyeGöreListeGetir", method = RequestMethod.GET)
	public @ResponseBody String islemTipineGöreListeGetir(@RequestParam(value = "ilce", required = true) String ilce) {
		Gson gson = new Gson();

		return gson.toJson(araziService.ilceyeGöreListele(ilce));
	}

	public ModelAndView toplamAraziSatislari() {
		ModelAndView modelAndView = new ModelAndView("redirect:/raporlar/satisrapor");

		return modelAndView;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/toplam", method = RequestMethod.GET)
	public @ResponseBody Map<String, Long> list() {

		List<AraziİslemHareketleri> arazi = new ArrayList<AraziİslemHareketleri>();
		arazi = araziService.islemHareketleriListesi();
		int devriIstenenParselSayisiToplami = 0, izinVerilenParselSayisiToplami = 0,
				izinVerilmeyenParselSayisiToplami = 0;
		float devriIstenenParselAlaniToplami = 0, izinVerilenParselAlaniToplami = 0,
				izinVerilmeyenParselAlaniToplami = 0;

		for (int i = 0; i < arazi.size(); i++) {

			// System.out.println("rarporlar TOPLAM sys :" +
			// arazi.get(i).getTarih());

			devriIstenenParselSayisiToplami += arazi.get(i).getDevriIstenenParselSayisi();
			devriIstenenParselAlaniToplami += arazi.get(i).getDevriIstenenParselAlani();

			izinVerilenParselSayisiToplami += arazi.get(i).getIzinVerilenParselSayisi();

			izinVerilenParselAlaniToplami += arazi.get(i).getIzinVerilenParselAlani();

			izinVerilmeyenParselSayisiToplami += arazi.get(i).getIzinVerilmeyenParselSayisi();

			izinVerilmeyenParselAlaniToplami += arazi.get(i).getIzinVerilmeyenParselAlani();

		}
		Map<String, Long> toplam = new JSONObject();

		toplam.put("devriIstenenParselSayisiToplami", (long) devriIstenenParselSayisiToplami);
		toplam.put("devriIstenenParselAlaniToplami", (long) devriIstenenParselAlaniToplami);
		toplam.put("izinVerilenParselSayisiToplami", (long) izinVerilenParselSayisiToplami);
		toplam.put("izinVerilenParselAlaniToplami", (long) izinVerilenParselAlaniToplami);
		toplam.put("izinVerilmeyenParselSayisiToplami", (long) izinVerilmeyenParselSayisiToplami);
		toplam.put("izinVerilmeyenParselAlaniToplami", (long) izinVerilmeyenParselAlaniToplami);

		return toplam;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/ucayliktoplamgetir", method = RequestMethod.GET)
	public @ResponseBody Map<String, Long> ucAylikToplam(@RequestParam(value = "yil") String yil,
			@RequestParam(value = "birinciAy") String birinciAy, @RequestParam(value = "ikinciAy") String ikinciAy,
			@RequestParam(value = "ucuncuAy") String ucuncuAy) {
		List<AraziİslemHareketleri> arazi = new ArrayList<AraziİslemHareketleri>();
		arazi = araziService.islemHareketleriListesi();
		int devriIstenenParselSayisiToplami = 0, izinVerilenParselSayisiToplami = 0,
				izinVerilmeyenParselSayisiToplami = 0;
		int devriIstenenParselSayisiToplami2 = 0, izinVerilenParselSayisiToplami2 = 0,
				izinVerilmeyenParselSayisiToplami2 = 0;
		int devriIstenenParselSayisiToplami3 = 0, izinVerilenParselSayisiToplami3 = 0,
				izinVerilmeyenParselSayisiToplami3 = 0;
		float devriIstenenParselAlaniToplami = 0, izinVerilenParselAlaniToplami = 0,
				izinVerilmeyenParselAlaniToplami = 0;
		float devriIstenenParselAlaniToplami2 = 0, izinVerilenParselAlaniToplami2 = 0,
				izinVerilmeyenParselAlaniToplami2 = 0;
		float devriIstenenParselAlaniToplami3 = 0, izinVerilenParselAlaniToplami3 = 0,
				izinVerilmeyenParselAlaniToplami3 = 0;
		System.out.println("seçilen yıl : " + yil);
		for (int i = 0; i < arazi.size(); i++) {

			String[] yilKismi = arazi.get(i).getTarih().split("-");
			String year = yilKismi[0];

			String[] ayKismi = arazi.get(i).getTarih().split("-");

			String firstM = ayKismi[1];
			String secondM = ayKismi[1];
			String thirdM = ayKismi[1];
			System.out.println("rarporlar TOPLAM sys :" + year + "/" + firstM + "/" + secondM + "/" + thirdM);
			System.out.println("true-false :" + year.equals("2016"));
			System.out.println("true-false :" + firstM.equals("10"));

			if (year.equals(yil)) {
				if (firstM.equals(birinciAy)) {
					devriIstenenParselSayisiToplami += arazi.get(i).getDevriIstenenParselSayisi();
					devriIstenenParselAlaniToplami += arazi.get(i).getDevriIstenenParselAlani();

					izinVerilenParselSayisiToplami += arazi.get(i).getIzinVerilenParselSayisi();

					izinVerilenParselAlaniToplami += arazi.get(i).getIzinVerilenParselAlani();

					izinVerilmeyenParselSayisiToplami += arazi.get(i).getIzinVerilmeyenParselSayisi();

					izinVerilmeyenParselAlaniToplami += arazi.get(i).getIzinVerilmeyenParselAlani();

				}

				if (firstM.equals(ikinciAy)) {
					devriIstenenParselSayisiToplami2 += arazi.get(i).getDevriIstenenParselSayisi();
					devriIstenenParselAlaniToplami2 += arazi.get(i).getDevriIstenenParselAlani();

					izinVerilenParselSayisiToplami2 += arazi.get(i).getIzinVerilenParselSayisi();

					izinVerilenParselAlaniToplami2 += arazi.get(i).getIzinVerilenParselAlani();

					izinVerilmeyenParselSayisiToplami2 += arazi.get(i).getIzinVerilmeyenParselSayisi();

					izinVerilmeyenParselAlaniToplami2 += arazi.get(i).getIzinVerilmeyenParselAlani();

				}
				if (firstM.equals(ucuncuAy)) {
					devriIstenenParselSayisiToplami3 += arazi.get(i).getDevriIstenenParselSayisi();
					devriIstenenParselAlaniToplami3 += arazi.get(i).getDevriIstenenParselAlani();

					izinVerilenParselSayisiToplami3 += arazi.get(i).getIzinVerilenParselSayisi();

					izinVerilenParselAlaniToplami3 += arazi.get(i).getIzinVerilenParselAlani();

					izinVerilmeyenParselSayisiToplami3 += arazi.get(i).getIzinVerilmeyenParselSayisi();

					izinVerilmeyenParselAlaniToplami3 += arazi.get(i).getIzinVerilmeyenParselAlani();

				}

			}
		}
		Map<String, Long> toplam = new JSONObject();

		toplam.put("devriIstenenParselSayisiToplami", (long) devriIstenenParselSayisiToplami
				+ devriIstenenParselSayisiToplami2 + devriIstenenParselSayisiToplami3);
		toplam.put("devriIstenenParselAlaniToplami", (long) (devriIstenenParselAlaniToplami
				+ devriIstenenParselAlaniToplami2 + devriIstenenParselAlaniToplami3));
		toplam.put("izinVerilenParselSayisiToplami", (long) izinVerilenParselSayisiToplami
				+ izinVerilenParselSayisiToplami2 + izinVerilenParselSayisiToplami3);
		toplam.put("izinVerilenParselAlaniToplami", (long) (izinVerilenParselAlaniToplami
				+ izinVerilenParselAlaniToplami2 + izinVerilenParselAlaniToplami3));
		toplam.put("izinVerilmeyenParselSayisiToplami", (long) izinVerilmeyenParselSayisiToplami
				+ izinVerilmeyenParselSayisiToplami2 + izinVerilmeyenParselSayisiToplami3);
		toplam.put("izinVerilmeyenParselAlaniToplami", (long) (izinVerilmeyenParselAlaniToplami
				+ izinVerilmeyenParselAlaniToplami2 + izinVerilmeyenParselAlaniToplami3));

		return toplam;
	}

	@SuppressWarnings("resource")
	@RequestMapping(value = "/raporAl")
	public String personelAraCikisRaporu(@CookieValue(value = "isim") String isim)
			throws ParseException, InvalidFormatException, IOException {
		List<Arac> cikisListesi = aracService.tumAracCikislari();
		String[] isimAyrac = isim.split("\\.");
		String ayrilanIsim = isimAyrac[0];
		String ayrilanSoyIsim = isimAyrac[1];
		System.out.println("çıkış listesi uzunluğu " + cikisListesi.size());
		String path = "D:\\PROGRAMLAR\\apache-tomcat-9.0.0.M17\\evraklar\\";
		XWPFDocument document = new XWPFDocument();

		// ustbaslik logo
		// FileInputStream is = new FileInputStream(path + "bakanlik.png");
		// document.addPictureData(is, 0);

		// create table
		XWPFTable table = document.createTable();
		// table.setCellMargins(10, 10, 10, 10);

		// üstbaşlık oluşturma
		XWPFTableRow tableUstBaslik = table.getRow(0);
		tableUstBaslik.getCell(0).setText("GIDA TARIM VE HAYVANCILIK BAKANLIĞI");
		;

		// create first row
		XWPFTableRow tableRowOne = table.getRow(0);
		tableRowOne.getCell(0).setText("Günler");
		tableRowOne.addNewTableCell().setText("Gidilen Yer");
		tableRowOne.addNewTableCell().setText("Gidiş Saati");
		tableRowOne.addNewTableCell().setText("Geliş Saati");
		tableRowOne.addNewTableCell().setText("Araç Palakası");
		tableRowOne.addNewTableCell().setText("Yapılan İşin Özeti");

		for (int i = 0; i < cikisListesi.size(); i++) {
			String tamTarih = cikisListesi.get(i).getTarih();
			String[] gunAyraci = tamTarih.split("-");
			String gun = gunAyraci[2];

			// create second row
			XWPFTableRow tableRowTwo = table.createRow();

			tableRowTwo.getCell(0).setText(gun);
			tableRowTwo.getCell(1).setText(
					cikisListesi.get(i).getIlce().getIsim() + "-" + cikisListesi.get(i).getMahalle().getIsim());
			tableRowTwo.getCell(2).setText(cikisListesi.get(i).getCikisSaati());
			tableRowTwo.getCell(3).setText(cikisListesi.get(i).getGirisSaati());

			if (cikisListesi.get(i).getResmiPlaka() == null) {
				tableRowTwo.getCell(4).setText(cikisListesi.get(i).getOzelPlaka());
			} else {
				tableRowTwo.getCell(4).setText(cikisListesi.get(i).getResmiPlaka());
			}

			tableRowTwo.getCell(5).setText(cikisListesi.get(i).getAciklama());

			System.out.println(i + ". kayıt girildi");
			System.out.println(cikisListesi.get(i).getTarih());
		}
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		System.out.println(isim);
		Date tarih = new Date();
		System.out.println(sdf.format(tarih));
		// path +
		try {
			FileOutputStream out = new FileOutputStream(
					path + ayrilanIsim.toUpperCase() + " " + ayrilanSoyIsim.toUpperCase() + ".docx");
			document.write(out);
			out.close();
			dosyaDurumu = "Dosya Başarıyla Oluşturuldu...";
			download = "DOLU";
			System.out.println("dosya oluşturuldu...");
			return "redirect:/raporlar/satisrapor";
		} catch (Exception e) {
			// TODO: handle exception
			dosyaDurumu = "Dosya Oluşturma Başarısız.Lütfen Sitem Yöneticinizle Görüşün..." + e;
			e.printStackTrace();
			return "redirect:/raporlar/satisrapor";
		}

	}

	@RequestMapping(value = "/download")
	public String downloadPOIDoc(HttpServletResponse response, @CookieValue(value = "isim") String isim)
			throws IOException {
		String[] isimAyrac = isim.split("\\.");
		String ayrilanIsim = isimAyrac[0];
		String ayrilanSoyIsim = isimAyrac[1];
		String filename = ayrilanIsim.toUpperCase() + " " + ayrilanSoyIsim.toUpperCase()
				+ ".docx"/* path to a file */;
		String path = "D:\\PROGRAMLAR\\apache-tomcat-9.0.0.M17\\evraklar\\";
		File file = new File(path + filename);

		response.setContentType(new MimetypesFileTypeMap().getContentType(file));
		response.setContentLength((int) file.length());
		response.setHeader("content-disposition", "attachment; filename=" + URLEncoder.encode(filename, "UTF-8"));

		InputStream is = new FileInputStream(file);
		FileCopyUtils.copy(is, response.getOutputStream());

		return null;

	}
}