package jspbook.ch05;

import java.io.Serializable;

public class SampleBean implements Serializable {
	private String name;
	public SampleBean () {
	      this.name = "";
	  }
	//추출 메서드
	public String getName () {
	    return name;
	}
	  //설정 메서드
	public void setName (String name) {
	    this.name +=  " " + name;
	}
}