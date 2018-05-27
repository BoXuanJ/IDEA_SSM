package com.HelloSSM.service;

import com.HelloSSM.model.User;

public interface IUserService {

    public User selectUser(long userId);

}