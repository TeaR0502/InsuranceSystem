package com.t.entity;

import java.util.Date;

public class Product {
    private Long productId;

    private String name;

    private String type;

    private Integer period;

    private Long creatorid;

    private String creatorname;

    private Date createtime;

    private Double price;

    private Double discount;

    private Integer bottomprice;

    private Integer myorder;

    private Integer state;

    private String memo;
    
    private int usercount;

    public int getUsercount() {
		return usercount;
	}

	public void setUsercount(int usercount) {
		this.usercount = usercount;
	}

	public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getPeriod() {
        return period;
    }

    public void setPeriod(Integer period) {
        this.period = period;
    }

    public Long getCreatorid() {
        return creatorid;
    }

    public void setCreatorid(Long creatorid) {
        this.creatorid = creatorid;
    }

    public String getCreatorname() {
        return creatorname;
    }

    public void setCreatorname(String creatorname) {
        this.creatorname = creatorname;
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

    public Integer getBottomprice() {
        return bottomprice;
    }

    public void setBottomprice(Integer bottomprice) {
        this.bottomprice = bottomprice;
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
        this.memo = memo;
    }

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", name=" + name + ", type=" + type + ", period=" + period
				+ ", creatorid=" + creatorid + ", creatorname=" + creatorname + ", createtime=" + createtime
				+ ", price=" + price + ", discount=" + discount + ", bottomprice=" + bottomprice + ", myorder="
				+ myorder + ", state=" + state + ", memo=" + memo + "]";
	}
    
}