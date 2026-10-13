import 'student.dart';

/// 光荣榜能力 —— 改造后：mixin 替代继承。
///
/// 改造前是 `class HonorRoll extends GradeBook`（见提交历史），
/// 并非真正的 is-a 关系，还占掉唯一继承位。mixin 通过抽象成员
/// 声明宿主契约（需要 students / courseName / log），任何满足
/// 契约的类都能混入，与继承体系解耦。
mixin HonorRoll {
  List<Student> get students; // 宿主契约：GradeBook 恰好具备
  String get courseName;
  void log(String msg); // 与 Logger mixin 的 log 对应

  /// 前 [n] 名及格学生名单：spread 复制 + 级联排序 + where + take + map + toList，
  /// 5 个以上链式方法组合完成一组统计，不改动原列表。
  List<String> topNames([int n = 5]) =>
      ([...students]..sort((a, b) => b.score.compareTo(a.score)))
          .where((s) => s.passed)
          .take(n)
          .map((s) => '${s.name}(${s.score.toStringAsFixed(0)})')
          .toList();

  void printBoard([int n = 5]) {
    log('光荣榜 Top $n');
    topNames(n).asMap().forEach((i, name) => print('  第${i + 1}名：$name'));
  }
}
