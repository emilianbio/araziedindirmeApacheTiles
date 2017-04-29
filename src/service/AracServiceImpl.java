/**
 * 
 */
package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AracDAO;
import forms.Arac;

/**
 * @author EMRAH
 *
 */
@Service
public class AracServiceImpl implements AracService {
	@Autowired
	AracDAO aracDao;

	/*
	 * (non-Javadoc)
	 * 
	 * @see service.AracService#kaydet(forms.Arac)
	 */
	@Override
	public void kaydet(Arac arac) {
		// TODO Auto-generated method stub
		aracDao.kaydet(arac);
	}

}
