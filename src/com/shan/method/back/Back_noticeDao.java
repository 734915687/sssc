package com.shan.method.back;

import com.shan.Back_notice;

import java.util.List;

/**
 * Created by User on 2017/6/7.
 */
public interface Back_noticeDao {
    //增
    public int Add(Back_notice a);
    //删
    public int Delete(int a);
    //改
    public int Update(Back_notice a);
    //查
    public List<Back_notice> Select(Back_notice a,int c,int d);
    //查总记录
    public int Select_count();
}
