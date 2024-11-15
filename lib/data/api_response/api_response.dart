class ResponseModel<T>{
  final bool _isSuccess;
  final String _message;
  final T _data;
  // PaginatedModel? paginate;
  ResponseModel(this._isSuccess, this._message, this._data);
  String get message => _message;
  bool get isSuccess => _isSuccess;
  T get data => _data;
}

// class PaginatedModel {
//   int totalPages;
//   int totalDocs;
//   int limit;
//   int page;
//   bool hasNextPage;
//   bool hasPrevPage;
//   PaginatedModel(
//       {required this.totalDocs,
//       required this.totalPages,
//       required this.limit,
//       required this.page,
//       required this.hasNextPage,
//       required this.hasPrevPage});

//   factory PaginatedModel.fromJson(Map<String, dynamic> json) {
//     return PaginatedModel(
//         totalDocs: json["totalDocs"] ?? 0,
//         totalPages: json["totalPages"] ?? 0,
//         limit: json["limit"] ?? 10,
//         page: json["page"] ?? 1,
//         hasNextPage: json["hasNextPage"] ?? false,
//         hasPrevPage: json["hasPrevPage"] ?? false);
//   }
// }

