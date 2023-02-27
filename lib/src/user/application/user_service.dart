import 'package:invoice_system/src/common.dart';
import 'package:invoice_system/src/user/domain/user_repository.dart';

class UserService {
  const UserService(this._repository);

  final UserRepository _repository;

  Future<String> signIn(String username, String password) async {
    final DefaultResponse response = await _repository.signIn(
      username,
      password,
    );
    if (response.statusCode != 200) throw HttpException(response.message);
    return response.data as String;
  }
}
