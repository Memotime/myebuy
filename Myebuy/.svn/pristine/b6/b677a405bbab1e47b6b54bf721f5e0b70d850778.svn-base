package com.mage.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

/**
 * 1.连接数据库
 * 2.关闭数据库资源
 * @author Cushier
 *
 */
public class DBUtil {

	/**
	 * 获取数据库的链接
	 * @return
	 */
	public static Connection getConnection() {
		Connection connection = null;
		
		/**
		 * 固定数据
		 */
		/*try {
			// 加载驱动
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/java24?useUnicode=true&characterEncoding=UTF-8", "root", "root");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}*/
		
		
		/**
		 * 将mysql的jar包拷贝到项目的WebContent的WEB-INF下的lib目录下
		 * 
		 * 读取配置文件
		 * 	1、在sr目录下创建一个名称为properties的文件
		 * 	2、选择该文件夹，右键，选择Bulid Path，然后选择Use as a Source Folder
		 * 	3、创建db.properties的文件
		 * 	4、设置文件中的属性项（驱动名、数据库连接路径、数据库用户名、数据库密码）
		 * 	5、得到配置文件的输入流
		 * 	6、创建配置对象
		 * 	7、将输入流加载到配置对象中，调用load()方法
		 * 	8、获取配置对象中的属性  properties.getProperty(key) ：key值要与db.properties文件中的属性名保持一致
		 * 	9、加载驱动
		 * 	10、获取数据库连接
		 */
		try {
			// 得到配置文件的输入流
			InputStream in = DBUtil.class.getClassLoader().getResourceAsStream("db.properties");
			// 创建配置对象
			Properties properties = new Properties();
			// 将输入流加载到配置对象中，调用load()方法
			properties.load(in);
			
			// 获取配置对象中的属性  properties.getProperty(key)
			String jdbcName = properties.getProperty("jdbcName");
			String url = properties.getProperty("dbUrl");
			String name = properties.getProperty("dbName");
			String pwd = properties.getProperty("dbPwd");
			
			// 加载驱动
			Class.forName(jdbcName);
			// 获取数据库连接
			connection = DriverManager.getConnection(url, name, pwd);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return connection;
	}
	
	/**
	 * 关闭资源
	 * @param resultSet
	 * @param preparedStatement
	 * @param connection
	 */
	public static void close(ResultSet resultSet, PreparedStatement preparedStatement, Connection connection) {
		
		try {
			// 判断对象是否为空，不为空则关闭
			if (resultSet != null) {
				resultSet.close();
			}
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (connection != null) {
				connection.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	public static void main(String[] args) {
		System.out.println(getConnection());
	}
	
}
