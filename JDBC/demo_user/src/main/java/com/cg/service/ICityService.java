package com.cg.service;

import com.cg.model.City;

public interface ICityService extends IGeneralService<City> {
    boolean existById(int cityId);
}
