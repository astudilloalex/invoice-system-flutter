import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

/// The default response from backend.
class DefaultResponse {
  /// Define a [DefaultResponse] class.
  const DefaultResponse({
    this.data,
    this.first = true,
    this.last = false,
    required this.message,
    this.numberOfElements,
    this.offset,
    this.pageNumber,
    required this.statusCode,
    this.totalElements,
    this.totalPages,
  });

  /// The data from backend.
  final dynamic data;

  /// Used in pagination if is the first page, defaults true.
  final bool first;

  /// Used in pagination if is the last page, defaults false.
  final bool last;

  /// The message from backend.
  final String message;

  /// The total number of elements in page.
  final int? numberOfElements;

  /// The offset of page.
  final int? offset;

  /// The current page number.
  final int? pageNumber;

  /// The status code response from backend.
  final int statusCode;

  /// The total elements available.
  final int? totalElements;

  /// The total pages available.
  final int? totalPages;

  /// Returns a new [DefaultResponse] class with new values.
  DefaultResponse copyWith({
    dynamic data,
    bool? first,
    bool? last,
    String? message,
    int? numberOfElements,
    int? offset,
    int? pageNumber,
    int? statusCode,
    int? totalElements,
    int? totalPages,
  }) {
    return DefaultResponse(
      first: first ?? this.first,
      last: last ?? this.last,
      message: message ?? this.message,
      numberOfElements: numberOfElements ?? this.numberOfElements,
      offset: offset ?? this.offset,
      pageNumber: pageNumber ?? this.pageNumber,
      statusCode: statusCode ?? this.statusCode,
      totalElements: totalElements ?? this.totalElements,
      totalPages: totalPages ?? this.totalPages,
      data: data ?? this.data,
    );
  }

  /// Factory that returns a [DefaultResponse] class from [json] map.
  factory DefaultResponse.fromJson(Map<String, dynamic> json) {
    return DefaultResponse(
      data: json['data'],
      first: (json['first'] as bool?) ?? true,
      last: (json['last'] as bool?) ?? false,
      message: json['message'] as String,
      numberOfElements: json['numberOfElements'] as int?,
      offset: json['offset'] as int?,
      pageNumber: json['pageNumber'] as int?,
      statusCode: json['statusCode'] as int,
      totalElements: json['totalElements'] as int?,
      totalPages: json['totalPages'] as int?,
    );
  }
}

/// The http base client to manage all request to backend.
class HttpBaseClient extends http.BaseClient {
  HttpBaseClient(
    this.secureLocalData,
    this.client,
  );

  /// The secure local storage.
  final SecureLocalData secureLocalData;

  /// The http client to use in all app.
  final http.Client client;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    // Get and set token to header requests.
    final String? token = await secureLocalData.jwt;
    if (token != null) {
      request.headers.addAll({
        HttpHeaders.authorizationHeader: token,
      });
    }
    // Set accept header.
    if (!request.headers.containsKey(HttpHeaders.acceptHeader)) {
      request.headers.addAll({HttpHeaders.acceptHeader: 'application/json'});
    }
    // Set content type.
    if (!request.headers.containsKey(HttpHeaders.contentTypeHeader) ||
        request.headers[HttpHeaders.contentTypeHeader]!
            .contains('text/plain')) {
      request.headers.addAll({
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      });
    }
    return client.send(request);
  }

  /// Parse a dart object [data] to string json.
  String parseObject(Map<String, dynamic> data) {
    return json.encode(data);
  }

  /// Parse a json [data] to dynamic map.
  Map<String, dynamic> parseJson(String data) {
    return json.decode(data) as Map<String, dynamic>;
  }
}

/// The http exception.
class HttpException implements Exception {
  const HttpException(this.message);

  /// The message to show.
  final String message;
}

/// Manage the secure data in the app.
class SecureLocalData {
  /// Define a [SecureLocalData] class.
  const SecureLocalData({
    this.secureStorage = const FlutterSecureStorage(),
  });

  /// The flutter secure storage package.
  final FlutterSecureStorage secureStorage;

  /// The jwt static in the system.
  static String? _jwt;

  /// Save the [jwt] in secure storage.
  Future<void> saveJWT(String? jwt) async {
    _jwt = jwt == null ? null : 'Bearer $jwt';
    return secureStorage.write(key: 'jwt', value: _jwt);
  }

  /// Get the JWT if exists, otherwise null.
  Future<String?> get jwt async {
    return _jwt ??= await secureStorage.read(key: 'jwt');
  }
}
