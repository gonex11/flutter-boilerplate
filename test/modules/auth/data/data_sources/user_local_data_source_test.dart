import 'package:flutter_boilerplate/modules/user/data/data_sources/user_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/dummy_objects.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late UserLocalDataSource dataSource;
  late MockUsersDb mockUsersDb;

  setUp(() {
    mockUsersDb = MockUsersDb();
    dataSource = UserLocalDataSource(mockUsersDb);
  });

  group('cacheUsers', () {
    test('should return true when cache users is success', () async {
      // Arrange
      when(mockUsersDb.insertCacheUsers(tUserAdapters))
          .thenAnswer((_) async => true);
      // Act
      final result = await dataSource.cacheUsers(tUserModels);
      // Assert
      expect(result, true);
    });

    test('should return false when cache users is failed', () async {
      // Arrange
      when(mockUsersDb.insertCacheUsers(tUserAdapters))
          .thenAnswer((_) async => false);
      // Act
      final result = await dataSource.cacheUsers(tUserModels);
      // Assert
      expect(result, false);
    });
  });

  group('getCacheUsers', () {
    test('should return users when get cache users is success', () async {
      // Arrange
      when(mockUsersDb.getCacheUsers()).thenAnswer((_) => tUserAdapters);
      // Act
      final result = dataSource.getCacheUsers();
      // Assert
      expect(result, tUserModels);
    });
  });
}
