/**
 * 
 */
package dao;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import forms.Arac;

/**
 * @author EMRAH
 *
 */
@Repository
public class AracDAOImpl implements AracDAO {

	@Autowired
	private SessionFactory sessionFactory;

	/*
	 * (non-Javadoc)
	 * 
	 * @see dao.AracDAO#kaydet(forms.Arac)
	 */
	@Override
	@Transactional
	public void kaydet(Arac arac) {
		// TODO Auto-generated method stub

		sessionFactory.getCurrentSession().saveOrUpdate(arac);
	}

}
