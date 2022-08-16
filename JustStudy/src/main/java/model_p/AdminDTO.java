package model_p;

import java.util.Date;

public class AdminDTO {
    String pname, nickname, pid, situation, phone_num, home_num;
    boolean sms, info_open, self_Authentication, email_receive, block;
    Date last_study, join_date;


    public String getName() {
        return pname;
    }

    public void setName(String name) {
        this.pname = pname;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getSituation() {
        return situation;
    }

    public void setSituation(String situation) {
        this.situation = situation;
    }

    public String getPhone_num() {
        return phone_num;
    }

    public void setPhone_num(String phone_num) {
        this.phone_num = phone_num;
    }

    public String getHome_num() {
        return home_num;
    }

    public void setHome_num(String home_num) {
        this.home_num = home_num;
    }

    public boolean isSms() {
        return sms;
    }

    public void setSms(boolean sms) {
        this.sms = sms;
    }

    public boolean isInfo_open() {
        return info_open;
    }

    public void setInfo_open(boolean info_open) {
        this.info_open = info_open;
    }

    public boolean isSelf_Authentication() {
        return self_Authentication;
    }

    public void setSelf_Authentication(boolean self_Authentication) {
        this.self_Authentication = self_Authentication;
    }

    public boolean isEmail_receive() {
        return email_receive;
    }

    public void setEmail_receive(boolean email_receive) {
        this.email_receive = email_receive;
    }

    public boolean isBlock() {
        return block;
    }

    public void setBlock(boolean block) {
        this.block = block;
    }

    public Date getLast_study() {
        return last_study;
    }

    public void setLast_study(Date last_study) {
        this.last_study = last_study;
    }

    public Date getJoin_date() {
        return join_date;
    }

    public void setJoin_date(Date join_date) {
        this.join_date = join_date;
    }

    @Override
    public String toString() {
        return "AdminDTO{" +
                "pname='" + pname + '\'' +
                ", nickname='" + nickname + '\'' +
                ", pid='" + pid + '\'' +
                ", situation='" + situation + '\'' +
                ", phone_num='" + phone_num + '\'' +
                ", home_num='" + home_num + '\'' +
                ", sms=" + sms +
                ", info_open=" + info_open +
                ", self_Authentication=" + self_Authentication +
                ", email_receive=" + email_receive +
                ", block=" + block +
                ", last_study=" + last_study +
                ", join_date=" + join_date +
                '}';
    }
}
