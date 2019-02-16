package Test;

import java.util.List;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.peng.dao.StudentMapper;
import com.peng.entity.Student;


public class LpTest11 {

	@Test
	public void fun1() {
		Student student = new Student();
		student.setStuid(Long.valueOf("2014042012"));
		student.setPassword("123456");
		ApplicationContext app = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		StudentMapper bean = app.getBean(StudentMapper.class);
		student = bean.selectStuByIdAndPwd(student);
		System.out.println(student);
		
	}
}
