import 'student.dart';

/// 课程成绩册：内部持有一个学生列表，构造时接收。
class GradeBook {
  final String courseName;
  final List<Student> _students;

  GradeBook(this.courseName, List<Student> students)
      : _students = List.of(students);

  /// 只读视图，避免外部绕过封装直接改列表。
  List<Student> get students => List.unmodifiable(_students);

  void add(Student s) => _students.add(s);
}
