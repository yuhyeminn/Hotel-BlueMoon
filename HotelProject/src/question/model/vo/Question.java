package question.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Question implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int questionNo;
	private String questionCode;
	private String questionWriter;
	private String questionContent;
	private Date questionDate;
	private String questionOriginalFileName;
	private String questionRenamedFileName;
	
	public Question() {
		super();
	}

	public Question(int questionNo, String questionCode, String questionWriter, String questionContent,
			Date questionDate, String questionOriginalFileName, String questionRenamedFileName) {
		super();
		this.questionNo = questionNo;
		this.questionCode = questionCode;
		this.questionWriter = questionWriter;
		this.questionContent = questionContent;
		this.questionDate = questionDate;
		this.questionOriginalFileName = questionOriginalFileName;
		this.questionRenamedFileName = questionRenamedFileName;
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public String getQuestionCode() {
		return questionCode;
	}

	public void setQuestionCode(String questionCode) {
		this.questionCode = questionCode;
	}

	public String getQuestionWriter() {
		return questionWriter;
	}

	public void setQuestionWriter(String questionWriter) {
		this.questionWriter = questionWriter;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public Date getQuestionDate() {
		return questionDate;
	}

	public void setQuestionDate(Date questionDate) {
		this.questionDate = questionDate;
	}

	public String getQuestionOriginalFileName() {
		return questionOriginalFileName;
	}

	public void setQuestionOriginalFileName(String questionOriginalFileName) {
		this.questionOriginalFileName = questionOriginalFileName;
	}

	public String getQuestionRenamedFileName() {
		return questionRenamedFileName;
	}

	public void setQuestionRenamedFileName(String questionRenamedFileName) {
		this.questionRenamedFileName = questionRenamedFileName;
	}

	@Override
	public String toString() {
		return "Question [questionNo=" + questionNo + ", questionCode=" + questionCode + ", questionWriter="
				+ questionWriter + ", questionContent=" + questionContent + ", questionDate=" + questionDate
				+ ", questionOriginalFileName=" + questionOriginalFileName + ", questionRenamedFileName="
				+ questionRenamedFileName + "]";
	}
	
	

}
