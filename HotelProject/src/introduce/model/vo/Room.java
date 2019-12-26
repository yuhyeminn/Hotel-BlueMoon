package introduce.model.vo;

import java.io.Serializable;

public class Room implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String roomName;
	private int roomCapacity;
	private String roomBed;
	private int roomPrice;
	private int roomBfPrice;
	private int roomAmount;
	private int roomSize;
	private String roomOriginalFileName;
	private String roomRenamedFileName;
	
	public Room() {
		super();
	}

	public Room(String roomName, int roomCapacity, String roomBed, int roomPrice, int roomBfPrice, int roomAmount,
			int roomSize, String roomOriginalFileName, String roomRenamedFileName) {
		super();
		this.roomName = roomName;
		this.roomCapacity = roomCapacity;
		this.roomBed = roomBed;
		this.roomPrice = roomPrice;
		this.roomBfPrice = roomBfPrice;
		this.roomAmount = roomAmount;
		this.roomSize = roomSize;
		this.roomOriginalFileName = roomOriginalFileName;
		this.roomRenamedFileName = roomRenamedFileName;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getRoomCapacity() {
		return roomCapacity;
	}

	public void setRoomCapacity(int roomCapacity) {
		this.roomCapacity = roomCapacity;
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

	public String getRoomOriginalFileName() {
		return roomOriginalFileName;
	}

	public void setRoomOriginalFileName(String roomOriginalFileName) {
		this.roomOriginalFileName = roomOriginalFileName;
	}

	public String getRoomRenamedFileName() {
		return roomRenamedFileName;
	}

	public void setRoomRenamedFileName(String roomRenamedFileName) {
		this.roomRenamedFileName = roomRenamedFileName;
	}

	@Override
	public String toString() {
		return "Room [roomName=" + roomName + ", roomCapacity=" + roomCapacity + ", roomBed=" + roomBed + ", roomPrice="
				+ roomPrice + ", roomBfPrice=" + roomBfPrice + ", roomAmount=" + roomAmount + ", roomSize=" + roomSize
				+ ", roomOriginalFileName=" + roomOriginalFileName + ", roomRenamedFileName=" + roomRenamedFileName
				+ "]";
	}
	
}
