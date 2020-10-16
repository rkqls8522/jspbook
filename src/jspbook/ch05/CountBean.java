package jspbook.ch05;

public class CountBean {
private int count;
   public CountBean() {
      count = 0;
   }
   public int getCount() {
      return count;
   }
   public void setCount(int count) {
      this.count += count;
   }
}