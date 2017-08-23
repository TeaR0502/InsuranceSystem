package com.t.entity;

import java.util.Date;
/**
 * @author 0502  T  2017Äê8ÔÂ22ÈÕ
 */
public class Suggest {
    private Long id;

    private String title;

    private String content;

    private Long userId;

    private String username;

    private Date createtime;

    private String reply;

    private Date replytime;

    public Suggest(Long id, String title, String content, Long userId, String username, Date createtime, String reply, Date replytime) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.userId = userId;
        this.username = username;
        this.createtime = createtime;
        this.reply = reply;
        this.replytime = replytime;
    }

    public Suggest() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
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

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
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
}