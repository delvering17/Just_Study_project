package model_p;

public class MemberDTO {

    int mem_id;
    int mem_social;
    String mem_userid;
    String mem_password;
    String mem_nickname;
    String mem_realname;
    String mem_phone;
    String mem_address1;
    String mem_address2;
    int mem_level;
    String mem_socialid;

    public MemberDTO() {

    }

    public int getMem_id() {
        return mem_id;
    }

    public void setMem_id(int mem_id) {
        this.mem_id = mem_id;
    }

    public int getMem_social() {
        return mem_social;
    }

    public void setMem_social(int mem_social) {
        this.mem_social = mem_social;
    }

    public String getMem_userid() {
        return mem_userid;
    }

    public void setMem_userid(String mem_userid) {
        this.mem_userid = mem_userid;
    }

    public String getMem_password() {
        return mem_password;
    }

    public void setMem_password(String mem_password) {
        this.mem_password = mem_password;
    }

    public String getMem_nickname() {
        return mem_nickname;
    }

    public void setMem_nickname(String mem_nickname) {
        this.mem_nickname = mem_nickname;
    }

    public String getMem_realname() {
        return mem_realname;
    }

    public void setMem_realname(String mem_realname) {
        this.mem_realname = mem_realname;
    }

    public String getMem_phone() {
        return mem_phone;
    }

    public void setMem_phone(String mem_phone) {
        this.mem_phone = mem_phone;
    }

    public String getMem_address1() {
        return mem_address1;
    }

    public void setMem_address1(String mem_address1) {
        this.mem_address1 = mem_address1;
    }

    public String getMem_address2() {
        return mem_address2;
    }

    public void setMem_address2(String mem_address2) {
        this.mem_address2 = mem_address2;
    }

    public int getMem_level() {
        return mem_level;
    }

    public void setMem_level(int mem_level) {
        this.mem_level = mem_level;
    }

    public String getMem_socialid() {
        return mem_socialid;
    }

    public void setMem_socialid(String mem_socialid) {
        this.mem_socialid = mem_socialid;
    }

    @Override
    public String toString() {
        return "MemberDTO{" +
                "mem_id=" + mem_id +
                ", mem_social=" + mem_social +
                ", mem_userid='" + mem_userid + '\'' +
                ", mem_password='" + mem_password + '\'' +
                ", mem_nickname='" + mem_nickname + '\'' +
                ", mem_realname='" + mem_realname + '\'' +
                ", mem_phone='" + mem_phone + '\'' +
                ", mem_address1='" + mem_address1 + '\'' +
                ", mem_address2='" + mem_address2 + '\'' +
                ", mem_level=" + mem_level +
                ", mem_socialid='" + mem_socialid + '\'' +
                '}';
    }
}
