package model_p;

import java.text.SimpleDateFormat;
import java.util.Date;

public class NoticeDTO {

    int id;
    String title,content;
    Date reg_date;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }
    public String getContentBr() {
        return content.replaceAll("\n", "<br>");
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public String getReg_date_sdf(){
        return sdf.format(reg_date);
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    @Override
    public String toString() {
        return "NoticeDTO{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", reg_date=" + reg_date +
                '}';
    }
}
