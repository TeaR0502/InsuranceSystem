package com.t.entity;

import java.util.Date;
/**
 * @author 0502  T  2017Äê8ÔÂ22ÈÕ
 */
public class Product {
    private Long id;

    private String name;

    private String type;

    private Integer period;

    private Long creatorId;

    private String creatorName;

    private Date createtime;

    private Double price;

    private Double discount;

    private Integer bottomPrice;

    private Integer myorder;

    private Integer state;

    private String memo;

    public Product(Long id, String name, String type, Integer period, Long creatorId, String creatorName, Date createtime, Double price, Double discount, Integer bottomPrice, Integer myorder, Integer state, String memo) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.period = period;
        this.creatorId = creatorId;
        this.creatorName = creatorName;
        this.createtime = createtime;
        this.price = price;
        this.discount = discount;
        this.bottomPrice = bottomPrice;
        this.myorder = myorder;
        this.state = state;
        this.memo = memo;
    }

    public Product() {
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Integer getPeriod() {
        return period;
    }

    public void setPeriod(Integer period) {
        this.period = period;
    }

    public Long getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(Long creatorId) {
        this.creatorId = creatorId;
    }

    public String getCreatorName() {
        return creatorName;
    }

    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName == null ? null : creatorName.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public Integer getBottomPrice() {
        return bottomPrice;
    }

    public void setBottomPrice(Integer bottomPrice) {
        this.bottomPrice = bottomPrice;
    }

    public Integer getMyorder() {
        return myorder;
    }

    public void setMyorder(Integer myorder) {
        this.myorder = myorder;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }
}