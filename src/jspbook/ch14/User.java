package jspbook.ch14;

public class User {
    private String loginid;
    private String password;
    private String name;
    private int sex;
    private String address;
    private String tel;
    public User(String loginid, String password, String name, int sex, String address, String tel) {
        this.loginid = loginid;
        this.password = password;
        this.name = name;
        this.sex = sex;
        this.address = address;
        this.tel = tel;
    }
    public String getAddress() {
        return address;
    }
    public String getLoginid() {
        return loginid;
    }
    public String getName() {
        return name;
    }
    public String getPassword() {
        return password;
    }
    public int getSex() {
        return sex;
    }
    public String getTel() {
        return tel;
    }
}
