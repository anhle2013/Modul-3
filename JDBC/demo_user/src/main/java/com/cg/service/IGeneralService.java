package com.cg.service;

import com.cg.model.User;

import java.util.List;

public interface IGeneralService<T> {
    List<T> findAll();
    boolean create(T t);
    boolean update(T t);
    boolean remove(int id);
    boolean reActive(int id);
}
