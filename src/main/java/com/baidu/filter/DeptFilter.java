package com.baidu.filter;

import org.springframework.context.annotation.Configuration;

import javax.servlet.*;
import java.io.IOException;


@Configuration("deptFilter")
public class DeptFilter implements Filter {

//    @Autowired
//    private DeptService deptService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("init");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
//        List<Course> deptList = deptService.getAllDept();
//        servletRequest.setAttribute("deptList",deptList);
//        for (Course dept:deptList){
//            System.out.println(dept);
//        }
//        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {
        System.out.println("destroy");
    }
}
