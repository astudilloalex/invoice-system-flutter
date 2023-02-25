/// The sign in response when user send credentials to the server.
class SignInResponse {
  /// Define a [SignInResponse] class.
  const SignInResponse({
    // required this.defaultResponse,
    this.token,
  });

  //final DefaultResponse defaultResponse;
  final String? token;

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      //defaultResponse: DefaultResponse.fromJson(json),
      token: json['data'] as String?,
    );
  }
}
