import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late int age;

  @HiveField(2)
  late List<User> friends;
}
