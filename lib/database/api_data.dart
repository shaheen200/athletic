const domain = 'http://gymgraduation.runasp.net';

class ApiData<T> {
  final bool success;
  final String msg;
  final T data;

  const ApiData({required this.success, required this.msg, required this.data});
}
