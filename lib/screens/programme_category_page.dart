import 'package:flutter/material.dart';

import 'student_records_screen.dart';

class ProgrammeCategoryPage extends StatelessWidget {
  const ProgrammeCategoryPage({super.key});

  // Reusing the exact 10 records from Member 3's StudentRecordsScreen
  static final List<StudentRecord> _students = [
    StudentRecord(
      name: 'Ali Tan',
      matricNo: 'S12345',
      programme: 'Software Engineering',
      cgpa: 3.90,
    ),
    StudentRecord(
      name: 'Sara Lee',
      matricNo: 'S12346',
      programme: 'Software Engineering',
      cgpa: 3.80,
    ),
    StudentRecord(
      name: 'John Lim',
      matricNo: 'S12347',
      programme: 'Network Computing',
      cgpa: 3.70,
    ),
    StudentRecord(
      name: 'Aina Rahman',
      matricNo: 'S12348',
      programme: 'Information Systems',
      cgpa: 3.60,
    ),
    StudentRecord(
      name: 'David Ng',
      matricNo: 'S12349',
      programme: 'Software Engineering',
      cgpa: 3.50,
    ),
    StudentRecord(
      name: 'Siti Nur',
      matricNo: 'S12350',
      programme: 'Multimedia Computing',
      cgpa: 3.95,
    ),
    StudentRecord(
      name: 'Kevin Voon',
      matricNo: 'S12351',
      programme: 'Network Computing',
      cgpa: 3.42,
    ),
    StudentRecord(
      name: 'Farah Ann',
      matricNo: 'S12352',
      programme: 'Information Systems',
      cgpa: 3.88,
    ),
    StudentRecord(
      name: 'Chong Wei',
      matricNo: 'S12353',
      programme: 'Software Engineering',
      cgpa: 3.75,
    ),
    StudentRecord(
      name: 'Grace Tan',
      matricNo: 'S12354',
      programme: 'Multimedia Computing',
      cgpa: 3.65,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Programmes matching Member 3's student dataset
    const List<String> programmes = [
      'Software Engineering',
      'Network Computing',
      'Information Systems',
      'Multimedia Computing',
    ];

    return DefaultTabController(
      length: programmes.length,
      child: Column(
        children: [
          Material(
            color: Theme.of(context).colorScheme.surface,
            elevation: 1,
            child: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorWeight: 3.0,
              tabs: programmes.map((prog) => Tab(text: prog)).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: programmes.map((programme) {
                final filteredStudents = _students
                    .where((s) => s.programme == programme)
                    .toList();

                if (filteredStudents.isEmpty) {
                  return Center(
                    child: Text('No students registered in $programme.'),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(12.0),
                  itemCount: filteredStudents.length,
                  itemBuilder: (context, index) {
                    final student = filteredStudents[index];
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 6.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            student.name.isNotEmpty ? student.name[0] : '?',
                          ),
                        ),
                        title: Text(
                          student.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Matric: ${student.matricNo} | CGPA: ${student.cgpa.toStringAsFixed(2)}',
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
