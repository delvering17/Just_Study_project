package model_p;

import java.util.Date;

public class CommunityDTO {
    int id, memId, people;
    String location, title, studykind, content, nickname;
    Date startdate, enddate;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMemId() {
        return memId;
    }

    public void setMemId(int memId) {
        this.memId = memId;
    }

    public int getPeople() {
        return people;
    }

    public void setPeople(int people) {
        this.people = people;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStudykind() {
        return studykind;
    }

    public void setStudykind(String studykind) {
        this.studykind = studykind;
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

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    @Override
    public String toString() {
        return "CommunityDTO{" +
                "id=" + id +
                ", memId=" + memId +
                ", people=" + people +
                ", location='" + location + '\'' +
                ", title='" + title + '\'' +
                ", studykind='" + studykind + '\'' +
                ", content='" + content + '\'' +
                ", nickname='" + nickname + '\'' +
                ", startdate=" + startdate +
                ", enddate=" + enddate +
                '}';
    }
}
