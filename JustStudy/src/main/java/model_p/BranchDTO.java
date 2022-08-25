package model_p;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class BranchDTO {

    String city, name, rooms, facilities, address, addressDetail, phone, img;
    int price, open, close;

    double latitude;
    double longitude;

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public String getCity() {
        return city;
    }
    public String getCityEn(){
        try {
            return URLEncoder.encode(city,"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }
    public void setCity(String city) { this.city = city; }
    public String getName() {
        return name;
    }
    public String getNameEn(){
        try {
            return URLEncoder.encode(name,"UTF-8").replaceAll("[+]", "&nbsp;");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getRooms() {
        return rooms;
    }

    public String getRoomsEn(){
        try {
            return URLEncoder.encode(rooms,"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void setRooms(String rooms) {
        this.rooms = rooms;
    }

    public int getPrice() {
        return price;
    }

    public String getPriceEn(){
        try {
            return URLEncoder.encode(price+"","UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getOpen() {
        return open;
    }

    public void setOpen(int open) {
        this.open = open;
    }

    public int getClose() {
        return close;
    }

    public void setClose(int close) {
        this.close = close;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getFacilities() {
        return facilities;
    }

    public void setFacilities(String facilities) {
        this.facilities = facilities;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "BranchDTO{" +
                "city='" + city + '\'' +
                ", name='" + name + '\'' +
                ", rooms='" + rooms + '\'' +
                ", facilities='" + facilities + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", img='" + img + '\'' +
                ", price=" + price +
                ", open=" + open +
                ", close=" + close +
                '}';
    }
}
