class DefaultResponse {
  const DefaultResponse({
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

  final bool first;
  final bool last;
  final String message;
  final int? numberOfElements;
  final int? offset;
  final int? pageNumber;
  final int statusCode;
  final int? totalElements;
  final int? totalPages;

  DefaultResponse copyWith({
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
    );
  }
}
