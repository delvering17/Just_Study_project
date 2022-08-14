package model_p;

public class ReservationDTO {
    String city, branch, resDate, room, time;
    int headcount, pay;

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getResDate() {
        return resDate;
    }

    public void setResDate(String resDate) {
        this.resDate = resDate;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getHeadcount() {
        return headcount;
    }

    public void setHeadcount(int headcount) {
        this.headcount = headcount;
    }

    public int getPay() {
        return pay;
    }

    public void setPay(int pay) {
        this.pay = pay;
    }

    @Override
    public String toString() {
        return "ReservationDTO{" +
                "city='" + city + '\'' +
                ", branch='" + branch + '\'' +
                ", resDate='" + resDate + '\'' +
                ", room='" + room + '\'' +
                ", time='" + time + '\'' +
                ", headcount=" + headcount +
                ", pay=" + pay +
                '}';
    }
}
