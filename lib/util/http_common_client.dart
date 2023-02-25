import 'package:http/http.dart' as http;

class HttpCommonClient extends http.BaseClient {
  final http.Client _client;

  HttpCommonClient(this._client);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    // TODO: implement send
    print('request from base client');
    return _client.send(request);
  }
}
