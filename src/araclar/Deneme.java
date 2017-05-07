/**
 * 
 */
package araclar;

import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;

/**
 * @author Emrah Denizer
 *
 */
public class Deneme {

	@SuppressWarnings("resource")
	public static void main(String[] args) throws IOException {
		String path = "C:\\Users\\EMRAHH\\Desktop\\";
		XWPFDocument document = new XWPFDocument();

		// create table
		XWPFTable table = document.createTable();

		// create first row
		XWPFTableRow tableRowOne = table.getRow(0);
		tableRowOne.getCell(0).setText("Günler");
		tableRowOne.addNewTableCell().setText("Gidilen Yer");
		tableRowOne.addNewTableCell().setText("Gidiş Saati");
		tableRowOne.addNewTableCell().setText("Geliş Saati");
		tableRowOne.addNewTableCell().setText("Araç Palakası");
		tableRowOne.addNewTableCell().setText("Yapılan İşin Özeti");

		// create second row
		XWPFTableRow tableRowTwo = table.createRow();
		tableRowTwo.getCell(0).setText("col one, row two");
		tableRowTwo.getCell(1).setText("col two, row two");
		tableRowTwo.getCell(2).setText("col three, row two");
		tableRowTwo.getCell(3).setText("col three, row two");
		tableRowTwo.getCell(4).setText("col three, row two");
		tableRowTwo.getCell(5).setText("col three, row two");

		// create third row
		XWPFTableRow tableRowThree = table.createRow();
		tableRowThree.getCell(0).setText("col one, row two");
		tableRowThree.getCell(1).setText("col two, row two");
		tableRowThree.getCell(2).setText("col three, row two");
		tableRowThree.getCell(3).setText("col three, row two");
		tableRowThree.getCell(4).setText("col three, row two");
		tableRowThree.getCell(5).setText("col three, row two");

		try {
			FileOutputStream out = new FileOutputStream("ilk.docx");
			document.write(out);
			out.close();
			System.out.println("dosya oluşturuldu...");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		// String text = "This is the text to be searched "
		// + "for occurrences of the http:// pattern.";
		//
		// String patternString = ".*http://.*";
		//
		// Pattern pattern = Pattern.compile(patternString);
		//
		// Matcher matcher = pattern.matcher(text);
		//
		// System.out.println("lookingAt = " + matcher.lookingAt());
		// System.out.println("matches = " + matcher.matches());
		// System.out.println(1 + 2 + " " + (1 + 2));
		/*
		 * int some = 0; String giris =
		 * "C:\\Users\\Emrah Denizer\\Web Projelerim\\araziedindirme"; for (int
		 * i = 0; i <= i; i++) { some += i; System.out.println(some);
		 * 
		 * PrintWriter out = new PrintWriter(new FileWriter(giris + ".txt",
		 * true), true); out.write((Integer.toString(i) + " " +
		 * Integer.toString(some)));
		 * out.write(System.getProperty("line.separator")); out.close(); }
		 */
	}

}
