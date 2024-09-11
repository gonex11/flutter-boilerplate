import 'package:flutter_boilerplate/data/models/user_model.dart';

abstract class AppFakes {
  static FakeObject _object = FakeObject._();
  static FakeObject get object => _object;

  static FakeList _list = FakeList._();
  static FakeList get list => _list;
}

class FakeObject {
  FakeObject._();

  UserModel get user {
    return UserModel(
      id: 1,
      username: 'username',
      firstName: 'firstName',
      lastName: 'lastName',
    );
  }
}

class FakeList {
  FakeList._();

  List<UserModel> get users {
    return List.generate(
      5,
      (_) => AppFakes.object.user,
    );
  }
}
