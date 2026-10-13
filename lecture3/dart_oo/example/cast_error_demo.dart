// 调试记录复现：后端 JSON 中 score 为 int 时，as double 强转崩溃。
// 修复：Student.fromJson 使用 (json['score'] as num).toDouble()。
void main() {
  final json = {'id': '06', 'name': '测试', 'score': 88};
  print('开始解析: $json');
  final score = json['score'] as double; // 崩溃点
  print('解析成功: $score');
}
