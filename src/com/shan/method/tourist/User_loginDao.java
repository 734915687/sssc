package com.shan.method.tourist;

import com.shan.User_login;

import java.util.List;

/**
 * Created by User on 2017/5/18.
 */
public interface User_loginDao {
    //增
    public int Add(User_login a);
    //删
    public int Delete(User_login a);
    //改
    public int Update(User_login a);
    //查
    public List<User_login> Select(User_login a);
}
