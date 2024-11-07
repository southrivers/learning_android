/// data : [{"id":6,"link":"","name":"面试","order":1,"visible":1},{"id":9,"link":"","name":"Studio3","order":1,"visible":1},{"id":5,"link":"","name":"动画","order":2,"visible":1},{"id":1,"link":"","name":"自定义View","order":3,"visible":1},{"id":2,"link":"","name":"性能优化 速度","order":4,"visible":1},{"id":3,"link":"","name":"gradle","order":5,"visible":1},{"id":4,"link":"","name":"Camera 相机","order":6,"visible":1},{"id":7,"link":"","name":"代码混淆 安全","order":7,"visible":1},{"id":8,"link":"","name":"逆向 加固","order":8,"visible":1}]
/// errorCode : 0
/// errorMsg : ""

class HotKeyData {
  HotKeyData({
    this.data,
    this.errorCode,
    this.errorMsg,
  });

  HotKeyData.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(KeyData.fromJson(v));
      });
    }
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  List<KeyData>? data;
  num? errorCode;
  String? errorMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['errorCode'] = errorCode;
    map['errorMsg'] = errorMsg;
    return map;
  }
}

/// id : 6
/// link : ""
/// name : "面试"
/// order : 1
/// visible : 1

class KeyData {
  KeyData({
    this.id,
    this.link,
    this.name,
    this.order,
    this.visible,
  });

  KeyData.fromJson(dynamic json) {
    id = json['id'];
    link = json['link'];
    name = json['name'];
    order = json['order'];
    visible = json['visible'];
  }

  num? id;
  String? link;
  String? name;
  num? order;
  num? visible;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['link'] = link;
    map['name'] = name;
    map['order'] = order;
    map['visible'] = visible;
    return map;
  }
}
