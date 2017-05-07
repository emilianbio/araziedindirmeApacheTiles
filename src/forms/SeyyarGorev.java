package forms;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "seyyar_gorev", schema = "public")
public class SeyyarGorev {
	@Id
	@Column(name = "id")
	@SequenceGenerator(name = "tabloSequnce", sequenceName = "seyyar_gorev_id_seq")
	@GeneratedValue(generator = "tabloSequnce")
	private long id;

	@Column(name = "isim")
	private String isim;

	@Lob
	@Column(name = "evrak")
	private byte[] evrak;

	@Column(name = "eklemezamani")
	private Date eklemezamani;
}
