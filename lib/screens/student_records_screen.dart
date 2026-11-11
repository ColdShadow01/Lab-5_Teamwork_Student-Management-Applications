import 'package:flutter/material.dart';

class StudentRecord {
  final String name;
  final String matricNo;
  final String programme;
  final double cgpa;

  StudentRecord({
    required this.name,
    required this.matricNo,
    required this.programme,
    required this.cgpa,
  });
}

class StudentRecordsScreen extends StatefulWidget {
  const StudentRecordsScreen({super.key});

  @override
  State<StudentRecordsScreen> createState() => _StudentRecordsScreenState();
}

class _StudentRecordsScreenState extends State<StudentRecordsScreen> {
  int? _sortColumnIndex;
  bool _isAscending = true;

  // 10 Sample student records
  final List<StudentRecord> _students = [
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

  void _sort<T>(
    Comparable<T> Function(StudentRecord s) getField,
    int columnIndex,
    bool ascending,
  ) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _isAscending = ascending;
      _students.sort((a, b) {
        final aValue = getField(a);
        final bValue = getField(b);
        return ascending
            ? Comparable.compare(aValue, bValue)
            : Comparable.compare(bValue, aValue);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Student Academic Records',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Tap on the Name or CGPA column headers to sort ascending or descending.',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 20),
            // Expanded allows the table container to fill the remaining screen space evenly
            Expanded(
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: constraints.maxWidth,
                          ),
                          child: DataTable(
                            sortColumnIndex: _sortColumnIndex,
                            sortAscending: _isAscending,
                            headingRowColor: WidgetStateProperty.all(
                              Theme.of(context).colorScheme.primaryContainer
                                  .withOpacity(0.4),
                            ),
                            columns: [
                              DataColumn(
                                label: const Text(
                                  'Name',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                onSort: (columnIndex, ascending) {
                                  _sort(
                                    (student) => student.name,
                                    columnIndex,
                                    ascending,
                                  );
                                },
                              ),
                              const DataColumn(
                                label: Text(
                                  'Matric No',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const DataColumn(
                                label: Text(
                                  'Programme',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataColumn(
                                label: const Text(
                                  'CGPA',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                numeric: true,
                                onSort: (columnIndex, ascending) {
                                  _sort(
                                    (student) => student.cgpa,
                                    columnIndex,
                                    ascending,
                                  );
                                },
                              ),
                            ],
                            rows: _students.map((student) {
                              return DataRow(
                                cells: [
                                  DataCell(Text(student.name)),
                                  DataCell(Text(student.matricNo)),
                                  DataCell(Text(student.programme)),
                                  DataCell(
                                    Text(student.cgpa.toStringAsFixed(2)),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
