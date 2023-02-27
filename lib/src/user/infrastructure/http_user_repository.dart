import 'package:http/http.dart' as http;
import 'package:invoice_system/src/common.dart';
import 'package:invoice_system/src/user/domain/user_repository.dart';

class HttpUserRepository implements UserRepository {
  const HttpUserRepository(this.client);

  final HttpBaseClient client;

  @override
  Future<DefaultResponse> signIn(String username, String password) async {
    final http.Response response = await client.post(
      Uri.parse('http://localhost:5278/api/v1/user/sign-in'),
      body: client.parseObject({
        'username': username,
        'password': password,
      }),
    );
    return DefaultResponse.fromJson(client.parseJson(response.body));
  }
}
