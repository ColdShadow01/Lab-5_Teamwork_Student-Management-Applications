// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

import 'student_detail_page.dart';

class StudentModel {
  final String name;
  final String matricNumber;
  final String programme;
  final String email;

  const StudentModel({
    required this.name,
    required this.matricNumber,
    required this.programme,
    required this.email,
  });
}

class StudentListPage extends StatelessWidget {
  const StudentListPage({super.key});

  final List<StudentModel> students = const [
    StudentModel(
      name: 'Ali Tan',
      matricNumber: 'S12345',
      programme: 'Software Engineering',
      email: 'ali@uni.edu.my',
    ),
    StudentModel(
      name: 'Sara Lee',
      matricNumber: 'S12346',
      programme: 'Software Engineering',
      email: 'sara@uni.edu.my',
    ),
    StudentModel(
      name: 'John Lim',
      matricNumber: 'S12347',
      programme: 'Network Computing',
      email: 'john@uni.edu.my',
    ),
    StudentModel(
      name: 'Aina Rahman',
      matricNumber: 'S12348',
      programme: 'Information Systems',
      email: 'aina@uni.edu.my',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Information')),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(student.name),
            subtitle: Text('Matric: ${student.matricNumber}'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentDetailPage(student: student),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
