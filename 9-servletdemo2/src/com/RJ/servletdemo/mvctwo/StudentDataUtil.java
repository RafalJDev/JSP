package com.RJ.servletdemo.mvctwo;

import java.util.ArrayList;
import java.util.List;

public class StudentDataUtil {

	public static List<Student> getStudents() {
		List<Student> students = new ArrayList<>();
		
		students.add(new Student("Mary", "Public", "jakisemaill@gmail.com"));
		students.add(new Student("Kuz", "JAS", "jakisemaill2@gmail.com"));
		students.add(new Student("Mlody", "Igi", "jakisemaill3@gmail.com"));
		
		return students;
	}
}
