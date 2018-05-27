package com.HelloSSM.dao;

import com.HelloSSM.model.User;

public interface IUserDao {

    User selectUser(long id);

}