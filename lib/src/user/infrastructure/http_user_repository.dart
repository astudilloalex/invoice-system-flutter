import 'package:invoice_system/src/user/domain/repositories/user_repository.dart';
import 'package:invoice_system/src/user/domain/responses/sign_in_response.dart';

class HttpUserRepository implements UserRepository {
  @override
  Future<SignInResponse> signIn(String username, String password) {
    throw UnimplementedError();
  }
}
