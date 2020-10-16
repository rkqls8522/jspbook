package jspbook.ch05;

public class PI_Bean{
	private int radius=10;
	private double PI=3.14;
	private double area;
	
	public void setRadius(int a){	 this.radius = a;	}
	public void setPI(double PI){	this.PI = PI;	}
	public void setArea(double area){	this.area = area;	}
	public int getRadius(){	return radius; }
	public double getPI(){	return PI;	}
	public double getArea(){	return area;	}
	public double area(){
		area=PI*radius*radius;
		return area;
	}
}