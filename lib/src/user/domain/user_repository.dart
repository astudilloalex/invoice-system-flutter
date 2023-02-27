import 'package:invoice_system/src/common.dart';

/// Contains the main methods to manage a user data.
abstract class UserRepository {
  const UserRepository();

  /// Sign in to the app.
  Future<DefaultResponse> signIn(String username, String password);
}
