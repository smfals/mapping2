import 'gradebook.dart';

/// 光荣榜 —— 改造前：用一层继承获得成绩册数据并扩展行为。
///
/// 缺点：这里并非真正的 is-a 关系（光荣榜不是"一种"成绩册），
/// 只是为了复用数据与打印能力，却占掉了 Dart 唯一的继承位，
/// 后续若要再继承其它基类就无路可走。下一步将改造为 mixin。
class HonorRoll extends GradeBook {
  HonorRoll(super.courseName, super.students);

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
