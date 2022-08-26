package model_p;

import java.text.SimpleDateFormat;
import java.util.Date;

public class NewsDTO {
    int news_id;
    String news_title,news_content,news_img,news_thumbnail_img;
    Date news_reg_date;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");


    public int getNews_id() {
        return news_id;
    }

    public void setNews_id(int news_id) {
        this.news_id = news_id;
    }

    public String getNews_title() {
        return news_title;
    }

    public void setNews_title(String news_title) {
        this.news_title = news_title;
    }

    public String getNews_content() {
        return news_content;
    }

    public String getNews_contentBr() {
        return news_content.replaceAll("\n", "<br>");
    }

    public void setNews_content(String news_content) {
        this.news_content = news_content;
    }

    public String getNews_img() {
        return news_img;
    }

    public void setNews_img(String news_img) {
        this.news_img = news_img;
    }

    public String getNews_thumbnail_img() {
        return news_thumbnail_img;
    }

    public void setNews_thumbnail_img(String news_thumbnail_img) {
        this.news_thumbnail_img = news_thumbnail_img;
    }

    public Date getNews_reg_date() {
        return news_reg_date;
    }

    public String getNews_reg_date_sdf(){
        return sdf.format(news_reg_date);
    }

    public void setNews_reg_date(Date news_reg_date) {
        this.news_reg_date = news_reg_date;
    }

    @Override
    public String toString() {
        return "NewsDTO{" +
                "news_id=" + news_id +
                ", news_title='" + news_title + '\'' +
                ", news_content='" + news_content + '\'' +
                ", news_img='" + news_img + '\'' +
                ", news_thumbnail_img='" + news_thumbnail_img + '\'' +
                ", news_reg_date=" + news_reg_date +
                ", sdf=" + sdf +
                '}';
    }
}
