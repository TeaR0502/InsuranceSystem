package com.t.entity;
/**
 * @author 0502  T  2017Äê8ÔÂ22ÈÕ
 */
public class Admin {
    private Long id;

    private String name;

    private String pwd;

    private Integer state;

    public Admin(Long id, String name, String pwd, Integer state) {
        this.id = id;
        this.name = name;
        this.pwd = pwd;
        this.state = state;
    }

    public Admin() {
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

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

	@Override
	public String toString() {
		return "Admin [id=" + id + ", name=" + name + ", pwd=" + pwd + ", state=" + state + "]";
	}
    
    
}