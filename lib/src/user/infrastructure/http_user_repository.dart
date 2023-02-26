import 'dart:convert';

import 'package:invoice_system/src/user/domain/repositories/user_repository.dart';
import 'package:invoice_system/src/user/domain/responses/sign_in_response.dart';
import 'package:http/http.dart' as http;
import 'package:invoice_system/utilities/http_common_client.dart';

class HttpUserRepository implements UserRepository {
  const HttpUserRepository(this.client);

  final HttpCommonClient client;

  @override
  Future<SignInResponse> signIn(String username, String password) async {
    http.Response response = await client.post(
      Uri.http('localhost:5278', 'api/v1/user/sign-in'),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );
    print(json.encode(
      {
        'username': username,
        'password': password,
      },
    ));
    print(response.body);
    return SignInResponse();
  }
}
