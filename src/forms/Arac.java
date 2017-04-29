package forms;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "arac_cikis", schema = "public")
public class Arac implements java.io.Serializable {
	private static final long serialVersionUID = 4418029727139184238L;

	@Id
	@Column(name = "id")
	@SequenceGenerator(name = "tabloSequnce", sequenceName = "arac_cikis_id_seq")
	@GeneratedValue(generator = "tabloSequnce")
	private long id;

	@ManyToOne
	@JoinColumn(name = "islem_yapan")
	private Kullanici kullanici;

	@Column(name = "cikis_tarihi")
	private Date tarih;

	@Column(name = "ilce")
	private String ilce;

	@Column(name = "mahalle")
	private String mahalle;

	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @return the kullanici
	 */
	public Kullanici getKullanici() {
		return kullanici;
	}

	/**
	 * @param kullanici the kullanici to set
	 */
	public void setKullanici(Kullanici kullanici) {
		this.kullanici = kullanici;
	}

	/**
	 * @return the tarih
	 */
	public Date getTarih() {
		return tarih;
	}

	/**
	 * @param tarih the tarih to set
	 */
	public void setTarih(Date tarih) {
		this.tarih = tarih;
	}

	/**
	 * @return the ilce
	 */
	public String getIlce() {
		return ilce;
	}

	/**
	 * @param ilce the ilce to set
	 */
	public void setIlce(String ilce) {
		this.ilce = ilce;
	}

	/**
	 * @return the mahalle
	 */
	public String getMahalle() {
		return mahalle;
	}

	/**
	 * @param mahalle the mahalle to set
	 */
	public void setMahalle(String mahalle) {
		this.mahalle = mahalle;
	}

}
