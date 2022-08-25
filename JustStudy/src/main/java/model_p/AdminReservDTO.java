package model_p;

import java.util.Date;

public class AdminReservDTO {

    int id, headcount, pay;
    String orderId, mem_userid, mem_realname, mem_nickname, city, branch, room, time, status, cancelReason;
    Date resDate, useDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Date getResDate() {
        return resDate;
    }

    public void setResDate(Date resDate) {
        this.resDate = resDate;
    }

    public String getMem_userid() {
        return mem_userid;
    }

    public void setMem_userid(String mem_userid) {
        this.mem_userid = mem_userid;
    }

    public String getMem_realname() {
        return mem_realname;
    }

    public void setMem_realname(String mem_realname) {
        this.mem_realname = mem_realname;
    }

    public String getMem_nickname() { return mem_nickname; }

    public void setMem_nickname(String mem_nickname) { this.mem_nickname = mem_nickname; }

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

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public Date getUseDate() {
        return useDate;
    }

    public void setUseDate(Date useDate) {
        this.useDate = useDate;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCancelReason() {
        return cancelReason;
    }

    public void setCancelReason(String cancelReason) {
        this.cancelReason = cancelReason;
    }
}
