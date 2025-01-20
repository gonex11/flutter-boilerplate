import 'package:flutter_boilerplate/modules/user/data/data_sources/local/user_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../dummy_data/dummy_objects.dart';
import '../../../../../helpers/test_helper.mocks.dart';

void main() {
  late UserLocalDataSource dataSource;
  late MockUserDao mockUserDao;

  setUp(() {
    mockUserDao = MockUserDao();
    dataSource = UserLocalDataSource(mockUserDao);
  });

  group('cacheUsers', () {
    test('should return true when cache users is success', () async {
      // Arrange
      when(mockUserDao.insertAll(tUserEntities)).thenAnswer((_) async => true);
      // Act
      final result = await dataSource.cacheUsers(tUserModels);
      // Assert
      expect(result, true);
    });
  });

  group('getCachedUsers', () {
    test('should return users when get cache users is success', () async {
      // Arrange
      when(mockUserDao.getAll()).thenAnswer((_) async => tUserEntities);
      // Act
      final result = await dataSource.getCachedUsers();
      // Assert
      expect(result, tUserModels);
    });
  });
}
