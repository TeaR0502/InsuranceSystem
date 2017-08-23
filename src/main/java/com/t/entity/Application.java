package com.t.entity;

import java.util.Date;
/**
 * @author 0502  T  2017Äê8ÔÂ22ÈÕ
 */
public class Application {
    private Long id;

    private Long userId;

    private String username;

    private String userTruename;

    private String usermobile;

    private String userIdCard;

    private Long productId;

    private String productName;

    private Integer productPeriod;

    private Date createtime;

    private Date endtime;

    private String reply;

    private Date replytime;

    private Integer state;

    private String addition;

    private String esign;

    private Date esigntime;

    public Application(Long id, Long userId, String username, String userTruename, String usermobile, String userIdCard, Long productId, String productName, Integer productPeriod, Date createtime, Date endtime, String reply, Date replytime, Integer state, String addition, String esign, Date esigntime) {
        this.id = id;
        this.userId = userId;
        this.username = username;
        this.userTruename = userTruename;
        this.usermobile = usermobile;
        this.userIdCard = userIdCard;
        this.productId = productId;
        this.productName = productName;
        this.productPeriod = productPeriod;
        this.createtime = createtime;
        this.endtime = endtime;
        this.reply = reply;
        this.replytime = replytime;
        this.state = state;
        this.addition = addition;
        this.esign = esign;
        this.esigntime = esigntime;
    }

    public Application() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getUserTruename() {
        return userTruename;
    }

    public void setUserTruename(String userTruename) {
        this.userTruename = userTruename == null ? null : userTruename.trim();
    }

    public String getUsermobile() {
        return usermobile;
    }

    public void setUsermobile(String usermobile) {
        this.usermobile = usermobile == null ? null : usermobile.trim();
    }

    public String getUserIdCard() {
        return userIdCard;
    }

    public void setUserIdCard(String userIdCard) {
        this.userIdCard = userIdCard == null ? null : userIdCard.trim();
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName == null ? null : productName.trim();
    }

    public Integer getProductPeriod() {
        return productPeriod;
    }

    public void setProductPeriod(Integer productPeriod) {
        this.productPeriod = productPeriod;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply == null ? null : reply.trim();
    }

    public Date getReplytime() {
        return replytime;
    }

    public void setReplytime(Date replytime) {
        this.replytime = replytime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getAddition() {
        return addition;
    }

    public void setAddition(String addition) {
        this.addition = addition == null ? null : addition.trim();
    }

    public String getEsign() {
        return esign;
    }

    public void setEsign(String esign) {
        this.esign = esign == null ? null : esign.trim();
    }

    public Date getEsigntime() {
        return esigntime;
    }

    public void setEsigntime(Date esigntime) {
        this.esigntime = esigntime;
    }
}