package com.RJ.web.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement.*;
import java.sql.PreparedStatement.*;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.sun.xml.internal.ws.Closeable;

public class StudentDbUtil {

	private DataSource dataSource;

	public StudentDbUtil(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public List<Student> getStudents() throws Exception {
		List<Student> students = new ArrayList<>();

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;

		try {
			connection = dataSource.getConnection();

			String sql = "select * from student order by last_name";
			statement = connection.createStatement();

			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String firstName = resultSet.getString("first_name");
				String lastName = resultSet.getString("last_name");
				String email = resultSet.getString("email");

				Student tempStudent = new Student(id, firstName, lastName, email);

				students.add(tempStudent);
			}

		} finally {
			close(connection, statement, resultSet);
		}

		return students;
	}

	private void close(Connection connection, Statement statement, ResultSet resultSet) {
		try {
			if (connection != null) {
				connection.close();
			}
			if (statement != null) {
				statement.close();
			}
			if (resultSet != null) {
				resultSet.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void addStudent(Student theStudent) {
		Connection connection = null;
		PreparedStatement statement = null;

		try {
			connection = dataSource.getConnection();

			String sql = "insert into student " + "(first_name, last_name, email) " + "values(?, ?, ?)";

			statement = connection.prepareStatement(sql);

			statement.setString(1, theStudent.getFirstName());
			statement.setString(2, theStudent.getLastName());
			statement.setString(3, theStudent.getEmail());

			statement.execute();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(connection, statement, null);
		}
	}

	public Student getStudent(String theStudentId) throws Exception {
		Student theStudent = null;
		
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		int studentId;

		try {
			studentId = Integer.parseInt(theStudentId);
			connection = dataSource.getConnection();

			String sql = "select * from student where id=?";

			statement = connection.prepareStatement(sql);
			statement.setInt(1, studentId);

			resultSet = statement.executeQuery();
			
			if(resultSet.next()) {
				String firstName = resultSet.getString("first_name");
				String lastName = resultSet.getString("last_name");
				String email = resultSet.getString("email");
				
				theStudent = new Student(studentId,firstName, lastName, email);
			} else {
				throw new Exception("Could not find student id:" + studentId);
			}
			
			return theStudent;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(connection, statement, resultSet);
		}
		return null;
	}

	public void updateStudent(Student theStudent) throws Exception{
		Connection connection = null;
		PreparedStatement statement = null;

		try {
			connection = dataSource.getConnection();

			String sql = "update student " 
					   + "set first_name=?, last_name=?, email=? "
					   + "where id=?";

			statement = connection.prepareStatement(sql);

			statement.setString(1, theStudent.getFirstName());
			statement.setString(2, theStudent.getLastName());
			statement.setString(3, theStudent.getEmail());
			statement.setInt(4, theStudent.getId());

			statement.execute();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(connection, statement, null);
		}
	}

	public void deleteStudent(int id) throws Exception{
		Connection connection = null;
		PreparedStatement statement = null;

		try {
			connection = dataSource.getConnection();

			String sql = "delete from student "
					   + "where id=?";

			statement = connection.prepareStatement(sql);
			statement.setInt(1, id);

			statement.execute();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(connection, statement, null);
		}
	}

}
