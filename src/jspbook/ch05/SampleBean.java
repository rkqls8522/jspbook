package jspbook.ch05;

import java.io.Serializable;

public class SampleBean implements Serializable {
	private String name;
	public SampleBean () {
	      this.name = "";
	  }
	//���� �޼���
	public String getName () {
	    return name;
	}
	  //���� �޼���
	public void setName (String name) {
	    this.name +=  " " + name;
	}
}