<%@ page import="java.io.InputStream" %>
<%@ page import="org.apache.ibatis.io.Resources" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactoryBuilder" %>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.itcast.domain.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.itcast.dao.IUserDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<body>
<h2>Hello World!</h2>
<%
    InputStream inupt = Resources.getResourceAsStream("SqlMapConfig.xml");
    //2创建SqlSessionFactory工厂
    SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
    SqlSessionFactory factory = builder.build(inupt);
    //3使用工厂生产SqlSession对象
    SqlSession sqlSession = factory.openSession();
    //4使用SqlSessin创建Dao接口的代理对象
    IUserDao userDao = sqlSession.getMapper(IUserDao.class);
    //5使用代理对象执行方法
    List<User> users = userDao.findAll();
    for (User user : users) {
        System.out.println(user);
    }
    //6释放资源
    sqlSession.close();
    inupt.close();

%>
</body>
</html>
