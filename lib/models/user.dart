// model for the a user

import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final String storedPin;
  User(
    this.storedPin,
  );
}

// I ran flutter packages pub build_runner run command in the terminal to generate the adapter
