package room.model.vo;

import java.io.Serializable;

public class Room implements Serializable {

	private static final long serialVersionUID = 1L;
	private int roomNo;
	private String roomName;
	private String roomDescribe;
	private String roomDescribe2;
	private int roomPeople;
	private String roomBed;
	private String roomView;
	private int roomPrice;
	private int roomBfPrice;
	private int roomAmount;
	private int roomSize;
	private String originalFileName;
	private String renamedFileName;
	
	public Room() {
		super();
	}

	public Room(int roomNo, String roomName, String roomDescribe, String roomDescribe2, int roomPeople, String roomBed, String roomView, int roomPrice, int roomBfPrice, int roomAmount,
			int roomSize, String originalFileName, String renamedFileName) {
		super();
		this.roomNo = roomNo;
		this.roomName = roomName;
		this.roomDescribe = roomDescribe;
		this.roomDescribe2 = roomDescribe2;
		this.roomPeople = roomPeople;
		this.roomBed = roomBed;
		this.roomView = roomView;
		this.roomPrice = roomPrice;
		this.roomBfPrice = roomBfPrice;
		this.roomAmount = roomAmount;
		this.roomSize = roomSize;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
	}

	
	
	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getRoomView() {
		return roomView;
	}

	public void setRoomView(String roomView) {
		this.roomView = roomView;
	}

	public String getRoomDescribe() {
		return roomDescribe;
	}

	public void setRoomDescribe(String roomDescribe) {
		this.roomDescribe = roomDescribe;
	}

	public String getRoomDescribe2() {
		return roomDescribe2;
	}

	public void setRoomDescribe2(String roomDescribe2) {
		this.roomDescribe2 = roomDescribe2;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getRoomPeople() {
		return roomPeople;
	}

	public void setRoomPeople(int roomPeople) {
		this.roomPeople = roomPeople;
	}

	public String getRoomBed() {
		return roomBed;
	}

	public void setRoomBed(String roomBed) {
		this.roomBed = roomBed;
	}

	public int getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}

	public int getRoomBfPrice() {
		return roomBfPrice;
	}

	public void setRoomBfPrice(int roomBfPrice) {
		this.roomBfPrice = roomBfPrice;
	}

	public int getRoomAmount() {
		return roomAmount;
	}

	public void setRoomAmount(int roomAmount) {
		this.roomAmount = roomAmount;
	}

	public int getRoomSize() {
		return roomSize;
	}

	public void setRoomSize(int roomSize) {
		this.roomSize = roomSize;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenamedFileName() {
		return renamedFileName;
	}

	public void setRenamedFileName(String renamedFileName) {
		this.renamedFileName = renamedFileName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", roomName=" + roomName + ", roomDescribe=" + roomDescribe
				+ ", roomDescribe2=" + roomDescribe2 + ", roomPeople=" + roomPeople + ", roomBed=" + roomBed
				+ ", roomView=" + roomView + ", roomPrice=" + roomPrice + ", roomBfPrice=" + roomBfPrice
				+ ", roomAmount=" + roomAmount + ", roomSize=" + roomSize + ", originalFileName=" + originalFileName
				+ ", renamedFileName=" + renamedFileName + "]";
	}
}
