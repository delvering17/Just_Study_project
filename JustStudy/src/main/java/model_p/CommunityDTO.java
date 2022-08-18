package model_p;

public class CommunityDTO {
    int id, people;
    String location,startdate,enddate,title,pname,studykind,content;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
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


    @Override
    public String toString() {
        return "CommunityDTO{" +
                "id=" + id +
                ", people=" + people +
                ", location='" + location + '\'' +
                ", startdate='" + startdate + '\'' +
                ", enddate='" + enddate + '\'' +
                ", title='" + title + '\'' +
                ", pname='" + pname + '\'' +
                ", studykind='" + studykind + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
