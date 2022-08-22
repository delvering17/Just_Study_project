package model_p;

import java.util.HashMap;

public class FaqDTO {

    int id;
    String question, answer, category;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public String getAnswerBr() {
        return answer.replaceAll("\n", "<br/>");
    }

    public void setAnswer(String qnswer) {
        this.answer = qnswer;
    }

    public String getCategory() {
        return category;
    }
    public String getCategoryKor() {

        HashMap<String, String> categoryMap = new HashMap<String, String>();
        categoryMap.put("usage", "이용방법");
        categoryMap.put("studyroom", "스터디룸예약");
        categoryMap.put("pay", "결제");
        categoryMap.put("etc", "기타");

        return categoryMap.get(category);
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "FaqDTO{" +
                "id=" + id +
                ", question='" + question + '\'' +
                ", answer='" + answer + '\'' +
                ", category='" + category + '\'' +
                '}';
    }
}
