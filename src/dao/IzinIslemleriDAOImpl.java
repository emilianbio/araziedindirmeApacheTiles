/**
 * 
 */
package dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import forms.IzinIslemleri;

/**
 * @author Emrah Denizer
 *
 */
@Repository
public class IzinIslemleriDAOImpl implements IzinIslemleriDAO {
	@Autowired
	SessionFactory sessionFactory;

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.IzinIslemleriDAO#izinEkle(forms.IzinIslemleri)
	 */
	@Override
	@Transactional
	public void izinEkle(IzinIslemleri izinIslemleri) {
		sessionFactory.getCurrentSession().saveOrUpdate(izinIslemleri);

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.IzinIslemleriDAO#izinListesi()
	 */
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<IzinIslemleri> izinListesi() {
		Criteria criteriaİzinListesi = sessionFactory.getCurrentSession()
				.createCriteria(IzinIslemleri.class);
		criteriaİzinListesi.addOrder(Order.desc("islemZamani"));

		return criteriaİzinListesi.list();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.IzinIslemleriDAO#izinGetri(java.lang.Long)
	 */
	@SuppressWarnings("unused")
	@Override
	@Transactional
	public IzinIslemleri izinGetir(Long id) {
		Session session = sessionFactory.openSession();
		IzinIslemleri izin = (IzinIslemleri) sessionFactory.getCurrentSession()
				.get(IzinIslemleri.class, id);

		izin.getId();
		return izin;
	}

}
