package edu.zhwei.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Product {
    private Integer id;

    private String title;

    private Long killprice;

    private Long normalprice;

    private Integer num;

    private String image;

    @DateTimeFormat(pattern="yyyy/MM/dd HH:mm:ss")
    private Date killdate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Long getKillprice() {
        return killprice;
    }

    public void setKillprice(Long killprice) {
        this.killprice = killprice;
    }

    public Long getNormalprice() {
        return normalprice;
    }

    public void setNormalprice(Long normalprice) {
        this.normalprice = normalprice;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public Date getKilldate() {
        return killdate;
    }

    public void setKilldate(Date killdate) {
        this.killdate = killdate;
    }
}