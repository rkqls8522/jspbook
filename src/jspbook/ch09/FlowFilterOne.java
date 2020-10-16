package jspbook.ch09;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
@WebFilter("/FlowFilterOne")
public class FlowFilterOne implements Filter {
    public void init(FilterConfig config) {
        System.out.println("init() 호출 ......... one");
        } 
    public void doFilter(ServletRequest req, ServletResponse res,
    FilterChain chain) throws java.io.IOException, ServletException {
        System.out.println("doFilter() 호출 전 ........ one");
        chain.doFilter(req, res); 
        System.out.println("doFilter() 호출 후........ one");
        }
    public void destroy(){
        System.out.println("destroy() 호출 ........ one");
        }
}