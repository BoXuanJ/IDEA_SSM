package com.HelloSSM.service.impl;

import com.HelloSSM.dao.IUserDao;
import com.HelloSSM.model.User;
import com.HelloSSM.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("userService")
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserDao userDao;

    public User selectUser(long userId) {
        return this.userDao.selectUser(userId);
    }

}