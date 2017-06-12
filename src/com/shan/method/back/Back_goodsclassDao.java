package com.shan.method.back;

import com.shan.Back_goodsclass;

import java.util.List;

/**
 * Created by User on 2017/6/9.
 */
public interface Back_goodsclassDao {
    //增
    public int Add(Back_goodsclass a);
    //删
    public int Delete(int a);
    //改
    public int Update(Back_goodsclass a);
    //查
    public List<Back_goodsclass> Select(Back_goodsclass a);
}
