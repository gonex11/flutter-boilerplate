import 'package:flutter_boilerplate/data/data_sources/local/db/users_db.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late UsersDb db;
  late MockUserTypeBox mockBox;

  setUp(() {
    mockBox = MockUserTypeBox();
    db = UsersDb(mockBox);
  });

  group('insertCache', () {
    final testUsers = tUserSessionModels.map((e) => e.toAdapter()).toList();

    test('should return true when insert cache success', () async {
      // Arrange
      when(mockBox.clear()).thenAnswer((_) async => 1);
      when(mockBox.addAll(testUsers)).thenAnswer((_) async => [1]);
      // Act
      final result = await db.insertCache(testUsers);
      // Assert
      expect(result, true);
    });

    test('should return false when clear cache before insert cache failed',
        () async {
      // Arrange
      when(mockBox.clear()).thenAnswer((_) async => 0);
      when(mockBox.addAll(testUsers)).thenAnswer((_) async => [1]);
      // Act
      final result = await db.insertCache(testUsers);
      // Assert
      expect(result, false);
    });
  });

  group('getCacheUsers', () {
    test('should return list of users when get cache users success', () async {
      // Arrange
      when(mockBox.values.toList()).thenAnswer((_) => tUserAdapters);
      // Act
      final result = await db.getCacheUsers();
      // Assert
      expect(result, tUserAdapters);
    });
  });
}
