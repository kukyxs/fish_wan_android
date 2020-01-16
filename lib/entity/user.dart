class WanUser {
  WanUserDetail data;
  int errorCode;
  String errorMsg;

  WanUser({this.data, this.errorCode, this.errorMsg});

  factory WanUser.fromJson(Map<String, dynamic> json) {
    return WanUser(
      data: json['data'] != null ? WanUserDetail.fromJson(json['data']) : null,
      errorCode: json['errorCode'],
      errorMsg: json['errorMsg'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class WanUserDetail {
  bool admin;
  String email;
  String icon;
  int id;
  String nickname;
  String password;
  String publicName;
  String token;
  int type;
  String username;

  WanUserDetail({this.admin, this.email, this.icon, this.id, this.nickname, this.password, this.publicName, this.token, this.type, this.username});

  factory WanUserDetail.fromJson(Map<String, dynamic> json) {
    return WanUserDetail(
      admin: json['admin'],
      email: json['email'],
      icon: json['icon'],
      id: json['id'],
      nickname: json['nickname'],
      password: json['password'],
      publicName: json['publicName'],
      token: json['token'],
      type: json['type'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admin'] = this.admin;
    data['email'] = this.email;
    data['icon'] = this.icon;
    data['id'] = this.id;
    data['nickname'] = this.nickname;
    data['password'] = this.password;
    data['publicName'] = this.publicName;
    data['token'] = this.token;
    data['type'] = this.type;
    data['username'] = this.username;
    return data;
  }
}
