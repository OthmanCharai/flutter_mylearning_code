class UserModel {
  final int id;
  final String name;
  final String phone;
  UserModel({
    required this.id,
    required this.name,
    required this.phone,
  });
}
class Task {
  final int id;
  final String title;
  final String date;
  final String time;

  Task({
    required this.id,
    required this.title,
    required this.date,
    required this.time,

  });
}
