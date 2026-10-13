/// 日志能力 mixin：任何类都可混入，与继承体系无关。
mixin Logger {
  void log(String msg) => print('[$runtimeType] $msg');
}
