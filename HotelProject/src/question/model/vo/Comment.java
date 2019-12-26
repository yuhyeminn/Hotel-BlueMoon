package question.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Comment implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int commentNo;
	private String questionRef; //문의사항 번호
	private String commentRef; //댓글참조 번호
	private String commentWriter;
	private String commentContent;
	private int commentLevel;
	private Date commentDate;
	
	public Comment() {
		super();
	}

	public Comment(int commentNo, String questionRef, String commentRef, String commentWriter, String commentContent,
			int commentLevel, Date commentDate) {
		super();
		this.commentNo = commentNo;
		this.questionRef = questionRef;
		this.commentRef = commentRef;
		this.commentWriter = commentWriter;
		this.commentContent = commentContent;
		this.commentLevel = commentLevel;
		this.commentDate = commentDate;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getQuestionRef() {
		return questionRef;
	}

	public void setQuestionRef(String questionRef) {
		this.questionRef = questionRef;
	}

	public String getCommentRef() {
		return commentRef;
	}

	public void setCommentRef(String commentRef) {
		this.commentRef = commentRef;
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

	public int getCommentLevel() {
		return commentLevel;
	}

	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", questionRef=" + questionRef + ", commentRef=" + commentRef
				+ ", commentWriter=" + commentWriter + ", commentContent=" + commentContent + ", commentLevel="
				+ commentLevel + ", commentDate=" + commentDate + "]";
	}
	
	
}
