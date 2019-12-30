package question.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Comment implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int commentNo;
	private int questionRef; //문의사항 번호
	private String commentWriter;
	private String commentContent;
	private Date commentDate;
	
	public Comment() {
		super();
	}

	public Comment(int commentNo, int questionRef, String commentWriter, String commentContent, Date commentDate) {
		super();
		this.commentNo = commentNo;
		this.questionRef = questionRef;
		this.commentWriter = commentWriter;
		this.commentContent = commentContent;
		this.commentDate = commentDate;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getQuestionRef() {
		return questionRef;
	}

	public void setQuestionRef(int questionRef) {
		this.questionRef = questionRef;
	}

	public String getCommentWriter() {
		return commentWriter;
	}

	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", questionRef=" + questionRef + ", commentWriter=" + commentWriter
				+ ", commentContent=" + commentContent + ", commentDate=" + commentDate + "]";
	}
	
	
	
	
}
