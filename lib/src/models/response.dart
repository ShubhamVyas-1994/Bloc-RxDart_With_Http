class ResponseData {
  dynamic data;
  String message;
  int status;

  ResponseData({this.data, this.message, this.status});

  factory ResponseData.fromJson(Map<String, dynamic> json) => new ResponseData(
      data: json["data"], message: json["message"], status: json["status"]);
}
