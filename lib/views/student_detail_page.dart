import 'package:flutter/material.dart';
import 'student_list_page.dart';

class StudentDetailPage extends StatelessWidget {
  final StudentModel student;

  const StudentDetailPage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                child: Text(student.name[0], style: const TextStyle(fontSize: 32)),
              ),
            ),
            const SizedBox(height: 20),
            Text(student.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Divider(),
            const SizedBox(height: 10),
            const Text('Programme:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(student.programme),
            const SizedBox(height: 15),
            const Text('Matric Number (Selectable):', style: TextStyle(fontWeight: FontWeight.bold)),
            SelectableText(
              student.matricNumber,
              style: const TextStyle(color: Colors.blue, fontSize: 16),
            ),
            const SizedBox(height: 15),
            const Text('Email Address (Selectable):', style: TextStyle(fontWeight: FontWeight.bold)),
            SelectableText(
              student.email,
              style: const TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}