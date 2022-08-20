package model_p;

import java.text.SimpleDateFormat;
import java.util.Date;

public class EventDTO {
    int id;
    String title,content,img;
    Date reg_date,event_startdate,event_enddate;

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

    public void setContent(String content) {
        this.content = content;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    public Date getEvent_startdate() {
        return event_startdate;
    }

    public String getEvent_startdate_sdf(){
        return sdf.format(event_startdate);
    }

    public void setEvent_startdate(Date event_startdate) {
        this.event_startdate = event_startdate;
    }

    public Date getEvent_enddate() {
        return event_enddate;
    }

    public String getEvent_enddate_sdf(){
        return sdf.format(event_enddate);
    }

    public void setEvent_enddate(Date event_enddate) {
        this.event_enddate = event_enddate;
    }
}
