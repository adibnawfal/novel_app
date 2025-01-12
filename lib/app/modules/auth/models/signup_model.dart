class SignupModel {
  String? name;
  String? dialCode;
  String? flag;
  String? code;

  SignupModel({
    this.name,
    this.dialCode,
    this.flag,
    this.code,
  });

  SignupModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dialCode = json['dialCode'];
    flag = json['flag'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['dialCode'] = dialCode;
    data['flag'] = flag;
    data['code'] = code;
    return data;
  }
}
