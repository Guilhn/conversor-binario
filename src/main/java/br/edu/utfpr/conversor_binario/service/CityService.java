package br.edu.utfpr.conversor_binario.service;

import br.edu.utfpr.conversor_binario.model.dao.CityDAO;
import br.edu.utfpr.conversor_binario.model.domain.City;

public class CityService extends AbstractService<Long, City>{

    public CityService() {
        dao = new CityDAO();
    }
}
