import 'package:flutter_test/flutter_test.dart';
import 'package:github_contact/models/user.dart';

void main() {
  group('Create user from Map', () {
    late Map<String, dynamic> userFromRepository;

    late User testUser;
    late User expectedUser;
    setUp(() {
      userFromRepository = {
        "id": 01,
        "login": "john",
        "avatarUrl": "http:/john",
        "htmlUrl": "http:/github/john",
      };
      testUser = User.fromMap(userFromRepository);
      expectedUser =
          User(id: 01, login: 'john', avatarUrl: 'http:/john', htmlUrl: 'http:/github/john');
    });

    test('should implement the Model class', () {
      expect(expectedUser, isA<User>());
    });

    test('expectedUser should be equal testUser', () {
      expect(expectedUser, testUser);
    });
  });
}
