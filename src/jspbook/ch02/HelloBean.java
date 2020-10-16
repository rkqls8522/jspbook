package jspbook.ch02;

import java.util.Calendar;

public class HelloBean{
private String name = "hycu";
Calendar cal = Calendar.getInstance();

public String getName(){
return name;
}
public void setName(String name){
if(name != null ) this.name = name;
}
public int getMonth(){
return cal.get(Calendar.MONTH) +1 ;
    }
public int getDate(){
        return cal.get(Calendar.DATE) ;
    }
public int getHour(){
        return cal.get(Calendar.HOUR_OF_DAY) ;
    }
public int getMinute(){
        return cal.get(Calendar.MINUTE) ;
    }
}