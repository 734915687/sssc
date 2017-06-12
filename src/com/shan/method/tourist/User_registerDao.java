package com.shan.method.tourist;


import com.shan.User_register;

import java.util.List;

/**
 * Created by User on 2017/5/22.
 */
public interface User_registerDao {
    //增
    public int Add(User_register a);
    //删
    public int Delete(User_register a);
    //改
    public int Update(User_register a);
    //查
    public List<User_register> Select(User_register a);
}
