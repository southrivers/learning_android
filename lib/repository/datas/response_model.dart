class ResponseModel {
  dynamic data;
  int? errorCode;
  String? errorMsg;

  ResponseModel.fromJson(dynamic json) {
    data = json["data"];
    errorCode = json["errorCode"];
    errorMsg = json["errorMsg"];
  }
}
