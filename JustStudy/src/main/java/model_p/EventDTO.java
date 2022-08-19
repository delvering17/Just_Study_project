package model_p;

import java.util.Date;

public class EventDTO {
    int id;
    String title,event_startdate,event_enddate,content;
    Date reg_date;

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

    public String getEvent_startdate() {
        return event_startdate;
    }

    public void setEvent_startdate(String event_startdate) {
        this.event_startdate = event_startdate;
    }

    public String getEvent_enddate() {
        return event_enddate;
    }

    public void setEvent_enddate(String event_enddate) {
        this.event_enddate = event_enddate;
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

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    @Override
    public String toString() {
        return "EventDTO{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", startdate='" + event_startdate + '\'' +
                ", enddate='" + event_enddate + '\'' +
                ", content='" + content + '\'' +
                ", reg_date=" + reg_date +
                '}';
    }
}
