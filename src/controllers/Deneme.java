/**
 * 
 */
package controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Emrah Denizer
 *
 */
public class Deneme {

	/**
	 * @param args
	 */
	/**
	 * @param args
	 */
	public static int kalanİzinSayisi = 5;
	public static int toplamIzinGunSayisi = 0;

	public static void main(String[] args) {
		Date yeniYil = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM");

		String newDate = sdf.format(yeniYil);

		if (newDate.equals("15/11")) {

			toplamIzinGunSayisi = kalanİzinSayisi + 20;

			System.out.println(toplamIzinGunSayisi);
		} else {
			System.out.println(newDate);
		}

	}

	public static Integer kalanİzinGunSayisi(int kullanilanIzinSayisi) {

		kalanİzinSayisi -= kullanilanIzinSayisi;

		return kalanİzinSayisi;

	}
}
