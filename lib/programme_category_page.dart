import 'package:flutter/material.dart';

class ProgrammeStudent {
  //class ProgrammeStudent is created
  final String id;
  final String name;
  final String programme;
  final String semester;

  const ProgrammeStudent({
    //const ProgrammeStudent is created
    required this.id,
    required this.name,
    required this.programme,
    required this.semester,
  });
}

class ProgrammeCategoryPage extends StatelessWidget {
  const ProgrammeCategoryPage({super.key});

  static const List<ProgrammeStudent> _students = [
    //Software Engineering
    ProgrammeStudent(
      id: 'SE001',
      name: 'Wan Adam',
      programme: 'Software Engineering',
      semester: '1',
    ),
    ProgrammeStudent(
      id: 'SE002',
      name: 'Muhammad Ali',
      programme: 'Software Engineering',
      semester: '2',
    ),
    ProgrammeStudent(
      id: 'SE003',
      name: 'Babushka Ivokic',
      programme: 'Software Engineering',
      semester: '3',
    ),

    //Computer Science
    ProgrammeStudent(
      id: 'CS001',
      name: 'Abdulrahman Zaid',
      programme: 'Computer Science',
      semester: '1',
    ),
    ProgrammeStudent(
      id: 'CS002',
      name: 'Sarah Hammond',
      programme: 'Computer Science',
      semester: '2',
    ),

    //Data Engineering
    ProgrammeStudent(
      id: 'DE001',
      name: 'Cristiano Ronaldo',
      programme: 'Data Engineering',
      semester: '1',
    ),
    ProgrammeStudent(
      id: 'DE002',
      name: 'Lionel Messi',
      programme: 'Data Engineering',
      semester: '2',
    ),

    //Computer Networking
    ProgrammeStudent(
      id: 'CN001',
      name: 'Misha Lubenko',
      programme: 'Computer Networking',
      semester: '1',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const List<String> programmes = [
      'Software Engineering',
      'Computer Science',
      'Data Engineering',
      'Computer Networking',
    ];

    return DefaultTabController(
      length: programmes.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Programmes & Categories'),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorWeight: 3.0,
            tabs: programmes.map((prog) => Tab(text: prog)).toList(),
          ),
        ),
        body: TabBarView(
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
                      'Matric ID: ${student.id} | Semester ${student.semester}',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
