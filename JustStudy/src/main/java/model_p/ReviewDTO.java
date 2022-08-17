package model_p;

public class ReviewDTO {

    int id, reservId, memId;
    String content;

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

    public int getReservId() {
        return reservId;
    }

    public void setReservId(int reservId) {
        this.reservId = reservId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "ReviewDTO{" +
                "id=" + id +
                ", reservId=" + reservId +
                ", memId=" + memId +
                ", content='" + content + '\'' +
                '}';
    }
}
