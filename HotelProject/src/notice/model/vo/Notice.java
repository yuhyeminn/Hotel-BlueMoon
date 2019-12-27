package notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Notice implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int noticeNo;
	private String noticeWriter;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	private int noticeReadCount;
	private String noticeOriginalFileName;
	private String noticeRenamedFileName;
	
	public Notice() {
		super();
	}

	public Notice(int noticeNo, String noticeWriter, String noticeTitle, String noticeContent, Date noticeDate,
			int noticeReadCount, String noticeOriginalFileName, String noticeRenamedFileName) {
		super();
		this.noticeNo = noticeNo;
		this.noticeWriter = noticeWriter;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeReadCount = noticeReadCount;
		this.noticeOriginalFileName = noticeOriginalFileName;
		this.noticeRenamedFileName = noticeRenamedFileName;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public int getNoticeReadCount() {
		return noticeReadCount;
	}

	public void setNoticeReadCount(int noticeReadCount) {
		this.noticeReadCount = noticeReadCount;
	}

	public String getNoticeOriginalFileName() {
		return noticeOriginalFileName;
	}

	public void setNoticeOriginalFileName(String noticeOriginalFileName) {
		this.noticeOriginalFileName = noticeOriginalFileName;
	}

	public String getNoticeRenamedFileName() {
		return noticeRenamedFileName;
	}

	public void setNoticeRenamedFileName(String noticeRenamedFileName) {
		this.noticeRenamedFileName = noticeRenamedFileName;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeWriter=" + noticeWriter + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate + ", noticeReadCount="
				+ noticeReadCount + ", noticeOriginalFileName=" + noticeOriginalFileName + ", noticeRenamedFileName="
				+ noticeRenamedFileName + "]";
	}
}
