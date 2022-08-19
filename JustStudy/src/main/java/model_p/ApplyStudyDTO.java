package model_p;

import java.util.Date;

public class ApplyStudyDTO {

    int as_id;
    int as_purpose;
    int as_mem_id;
    String as_content;
    int as_state;

    Date reg_date;

    public int getAs_id() {
        return as_id;
    }

    public void setAs_id(int as_id) {
        this.as_id = as_id;
    }

    public int getAs_purpose() {
        return as_purpose;
    }

    public void setAs_purpose(int as_purpose) {
        this.as_purpose = as_purpose;
    }

    public int getAs_mem_id() {
        return as_mem_id;
    }

    public void setAs_mem_id(int as_mem_id) {
        this.as_mem_id = as_mem_id;
    }

    public String getAs_content() {
        return as_content;
    }

    public String getAs_content_String() {

        return as_content.replaceAll("\n","<br/>");
    }

    public void setAs_content(String as_content) {
        this.as_content = as_content;
    }
    public int getAs_state() {
        return as_state;
    }

    public void setAs_state(int as_state) {
        this.as_state = as_state;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    @Override
    public String toString() {
        return "ApplyStudyDTO{" +
                "as_id=" + as_id +
                ", as_purpose=" + as_purpose +
                ", as_mem_id=" + as_mem_id +
                ", as_content='" + as_content + '\'' +
                ", as_state=" + as_state +
                ", reg_date=" + reg_date +
                '}';
    }

}
