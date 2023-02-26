import 'package:http/http.dart' as http;
import 'package:invoice_system/utilities/local_data.dart';
import 'package:invoice_system/utilities/util.dart';

class HttpCommonClient extends http.BaseClient {
  final http.Client _client;

  HttpCommonClient(this._client);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final LocalData localData = getIt<LocalData>();
    final String? token = await localData.getToken();
    if (token != null) {
      request.headers.addAll({'Authorization': token});
    }
    print('request from base client: $token');
    return _client.send(request);
  }
}
