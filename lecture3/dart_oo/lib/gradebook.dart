import 'honor_roll.dart';
import 'logger.dart';
import 'student.dart';

/// 课程成绩册：内部持有一个学生列表，构造时接收。
/// 日志与光荣榜能力均通过 mixin 混入，不占继承位。
class GradeBook with Logger, HonorRoll {
  final String courseName;
  final List<Student> _students;

  GradeBook(this.courseName, List<Student> students)
      : _students = List.of(students);

  /// 只读视图，避免外部绕过封装直接改列表。
  List<Student> get students => List.unmodifiable(_students);

  void add(Student s) {
    _students.add(s);
    log('新增学生 ${s.name}');
  }

  /// 平均分：fold 聚合求和再除以人数，无手写 for 循环。
  double get average =>
      _students.fold<double>(0, (sum, s) => sum + s.score) / _students.length;

  /// 最高分学生：reduce 两两比较取优。
  Student get maxBy =>
      _students.reduce((a, b) => a.score >= b.score ? a : b);

  /// 及格人数：where 筛选后取长度。
  int get countPassed => _students.where((s) => s.passed).length;

  /// 按优良中差分档：fold 累积出 Map。
  Map<String, List<Student>> groupByGrade() =>
      _students.fold<Map<String, List<Student>>>({}, (map, s) {
        map.putIfAbsent(s.gradeBand, () => []).add(s);
        return map;
      });
}
