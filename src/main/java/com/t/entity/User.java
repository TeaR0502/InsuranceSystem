package com.t.entity;

import java.io.Serializable;
import java.util.Date;
/**
 * @author 0502  T  2017Äê8ÔÂ22ÈÕ
 */
public class User implements Serializable{

	private Long id;

    private String name;

    private String pwd;

    private String truename;

    private String mobile;

    private String email;

    private String idCard;

    private Date createtime;

    private Integer state;

    public User(Long id, String name, String pwd, String truename, String mobile, String email, String idCard, Date createtime, Integer state) {
        this.id = id;
        this.name = name;
        this.pwd = pwd;
        this.truename = truename;
        this.mobile = mobile;
        this.email = email;
        this.idCard = idCard;
        this.createtime = createtime;
        this.state = state;
    }

    public User() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd == null ? null : pwd.trim();
    }

    public String getTruename() {
        return truename;
    }

    public void setTruename(String truename) {
        this.truename = truename == null ? null : truename.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard == null ? null : idCard.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}