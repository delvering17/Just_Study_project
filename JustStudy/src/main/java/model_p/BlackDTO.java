package model_p;

public class BlackDTO {

    int black_id;
    String black_reason;

    public BlackDTO() {

    }

    public int getBlack_id() {
        return black_id;
    }

    public void setBlack_id(int black_id) {
        this.black_id = black_id;
    }

    public String getBlack_reason() {
        return black_reason;
    }

    public void setBlack_reason(String black_reason) {
        this.black_reason = black_reason;
    }

    @Override
    public String toString() {
        return "BlackDTO{" +
                "black_id=" + black_id +
                ", black_reason='" + black_reason + '\'' +
                '}';
    }
}
