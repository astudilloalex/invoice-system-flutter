import 'package:invoice_system/src/user/domain/responses/sign_in_response.dart';

abstract class UserRepository {
  Future<SignInResponse> signIn(String username, String password);
}
