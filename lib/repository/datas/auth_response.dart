/// authData : {"admin":false,"chapterTops":[],"coinCount":0,"collectIds":[],"email":"","icon":"","id":164736,"nickname":"iloveff","password":"","publicName":"iloveff","token":"","type":0,"username":"iloveff"}
/// errorCode : 0
/// errorMsg : ""

class AuthResponse {
  AuthResponse({
      this.authData, 
      this.errorCode, 
      this.errorMsg,});

  AuthResponse.fromJson(dynamic json) {
    authData = json['authData'] != null ? AuthData.fromJson(json['authData']) : null;
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }
  AuthData? authData;
  num? errorCode;
  String? errorMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (authData != null) {
      map['authData'] = authData?.toJson();
    }
    map['errorCode'] = errorCode;
    map['errorMsg'] = errorMsg;
    return map;
  }

}

/// admin : false
/// chapterTops : []
/// coinCount : 0
/// collectIds : []
/// email : ""
/// icon : ""
/// id : 164736
/// nickname : "iloveff"
/// password : ""
/// publicName : "iloveff"
/// token : ""
/// type : 0
/// username : "iloveff"

class AuthData {
  AuthData({
      this.admin, 
      this.chapterTops, 
      this.coinCount, 
      this.collectIds, 
      this.email, 
      this.icon, 
      this.id, 
      this.nickname, 
      this.password, 
      this.publicName, 
      this.token, 
      this.type, 
      this.username,});

  AuthData.fromJson(dynamic json) {
    admin = json['admin'];
    if (json['chapterTops'] != null) {
      chapterTops = [];
      json['chapterTops'].forEach((v) {
        chapterTops?.add(v);
      });
    }
    coinCount = json['coinCount'];
    if (json['collectIds'] != null) {
      collectIds = [];
      json['collectIds'].forEach((v) {
        collectIds?.add(v);
      });
    }
    email = json['email'];
    icon = json['icon'];
    id = json['id'];
    nickname = json['nickname'];
    password = json['password'];
    publicName = json['publicName'];
    token = json['token'];
    type = json['type'];
    username = json['username'];
  }
  bool? admin;
  List<dynamic>? chapterTops;
  num? coinCount;
  List<dynamic>? collectIds;
  String? email;
  String? icon;
  num? id;
  String? nickname;
  String? password;
  String? publicName;
  String? token;
  num? type;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['admin'] = admin;
    if (chapterTops != null) {
      map['chapterTops'] = chapterTops?.map((v) => v.toJson()).toList();
    }
    map['coinCount'] = coinCount;
    if (collectIds != null) {
      map['collectIds'] = collectIds?.map((v) => v.toJson()).toList();
    }
    map['email'] = email;
    map['icon'] = icon;
    map['id'] = id;
    map['nickname'] = nickname;
    map['password'] = password;
    map['publicName'] = publicName;
    map['token'] = token;
    map['type'] = type;
    map['username'] = username;
    return map;
  }

}