class BaseResponse {
  bool _status;
  int _code;
  String _message;

  bool get status => this._status;

  set status(bool value) => this._status = value;

  get code => this._code;

  set code(value) => this._code = value;

  get message => this._message;

  set message(value) => this._message = value;

  BaseResponse.fromJson(Map<String, dynamic> json) {
    this._status = json['status'];
    this._code = json['code'];
    this._message = json['message'];
  }
}
