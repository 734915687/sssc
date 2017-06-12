package com.shan;

/**
 * Created by User on 2017/5/18.
 */
public class User_login {
    private String user_login_id;          //唯一ID号
    private String user_login_name;        //用户名
    private String user_login_pwd;                      //密码

    public String getUser_login_id() {
        return user_login_id;
    }

    public void setUser_login_id(String user_login_id) {
        this.user_login_id = user_login_id;
    }

    public String getUser_login_name() {
        return user_login_name;
    }

    public void setUser_login_name(String user_login_name) {
        this.user_login_name = user_login_name;
    }

    public String getUser_login_pwd() {
        return user_login_pwd;
    }

    public void setUser_login_pwd(String user_login_pwd) {
        this.user_login_pwd = user_login_pwd;
    }
}
