package model_p;

import java.text.SimpleDateFormat;
import java.util.Date;

public class InquiryDTO {

    int inquiry_id;
    String inquiry_title;
    String inquiry_content;
    int inquiry_writer;
    String inquiry_category;
    String inquiry_type;
    String inquiry_branch;
    Date inquiry_date;
    int inquiry_level;
    int inquiry_state;

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");

    public int getInquiry_id() {
        return inquiry_id;
    }

    public void setInquiry_id(int inquiry_id) {
        this.inquiry_id = inquiry_id;
    }

    public String getInquiry_title() {
        return inquiry_title;
    }

    public void setInquiry_title(String inquiry_title) {
        this.inquiry_title = inquiry_title;
    }

    public String getInquiry_content() {
        return inquiry_content;
    }

    public void setInquiry_content(String inquiry_content) {
        this.inquiry_content = inquiry_content;
    }

    public int getInquiry_writer() {
        return inquiry_writer;
    }

    public void setInquiry_writer(int inquiry_writer) {
        this.inquiry_writer = inquiry_writer;
    }

    public String getInquiry_category() {
        return inquiry_category;
    }

    public void setInquiry_category(String inquiry_category) {
        this.inquiry_category = inquiry_category;
    }

    public String getInquiry_type() {
        return inquiry_type;
    }

    public void setInquiry_type(String inquiry_type) {
        this.inquiry_type = inquiry_type;
    }

    public String getInquiry_branch() {
        return inquiry_branch;
    }

    public void setInquiry_branch(String inquiry_branch) {
        this.inquiry_branch = inquiry_branch;
    }

    public Date getInquiry_date() {
        return inquiry_date;
    }

    public String getInquiry_date_String() {
        return sdf.format(inquiry_date);
    }

    public void setInquiry_date(Date inquiry_date) {
        this.inquiry_date = inquiry_date;
    }

    public int getInquiry_level() {
        return inquiry_level;
    }

    public void setInquiry_level(int inquiry_level) {
        this.inquiry_level = inquiry_level;
    }

    public int getInquiry_state() {
        return inquiry_state;
    }

    public void setInquiry_state(int inquiry_state) {
        this.inquiry_state = inquiry_state;
    }

    @Override
    public String toString() {
        return "InquiryDTO{" +
                "inquiry_id=" + inquiry_id +
                ", inquiry_title='" + inquiry_title + '\'' +
                ", inquiry_content='" + inquiry_content + '\'' +
                ", inquiry_writer=" + inquiry_writer +
                ", inquiry_category='" + inquiry_category + '\'' +
                ", inquiry_type='" + inquiry_type + '\'' +
                ", inquiry_branch='" + inquiry_branch + '\'' +
                ", inquiry_date=" + inquiry_date +
                ", inquiry_level=" + inquiry_level +
                ", inquiry_state=" + inquiry_state +
                '}';
    }
}
