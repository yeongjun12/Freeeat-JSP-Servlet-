
package com.freeeat.place.model.vo;

public class PlaceMenu {
	
	private int placeNo; //PLACE_NO	NUMBER
	private String menuName; //MENU_NAME	VARCHAR2(30 BYTE)
	private int price; //PRICE	NUMBER
	private String menuType; //MENU_TYPE	VARCHAR2(100 BYTE)
	
	
	public PlaceMenu() {
		super();
	}
	
	public PlaceMenu(int placeNo, String menuName, int price, String menuType) {
		super();
		this.placeNo = placeNo;
		this.menuName = menuName;
		this.price = price;
		this.menuType = menuType;
	}
	
	
	public int getPlaceNo() {
		return placeNo;
	}
	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getMenuType() {
		return menuType;
	}
	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}
	
	
	@Override
	public String toString() {
		return "PlaceMenu [placeNo=" + placeNo + ", menuName=" + menuName + ", price=" + price + ", menuType="
				+ menuType + "]";
	}
	
	
	
}