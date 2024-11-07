/// data : [{"category":"源码","icon":"","id":22,"link":"https://www.androidos.net.cn/sourcecode","name":"androidos","order":11,"visible":1},{"category":"源码","icon":"","id":41,"link":"http://androidxref.com/","name":"androidxref","order":12,"visible":1},{"category":"源码","icon":"","id":44,"link":"https://cs.android.com","name":"cs.android","order":13,"visible":1},{"category":"官方","icon":"","id":21,"link":"https://developer.android.google.cn/","name":"API文档","order":15,"visible":1},{"category":"官方","icon":"","id":46,"link":"https://www.wanandroid.com/blog/show/2791","name":"系统版本","order":16,"visible":1},{"category":"官方","icon":"","id":47,"link":"https://www.wanandroid.com/blog/show/2303","name":"Activity生命周期","order":16,"visible":1},{"category":"官方","icon":"","id":48,"link":"https://www.wanandroid.com/blog/show/2304","name":"Fragment生命周期","order":17,"visible":1},{"category":"官方","icon":"","id":49,"link":"https://www.wanandroid.com/blog/show/2310","name":"ADB用法","order":18,"visible":1},{"category":"官方","icon":"","id":55,"link":"https://developer.android.com/jetpack/androidx/explorer","name":"Jetpack列表","order":19,"visible":1},{"category":"仓库","icon":"","id":25,"link":"http://jcenter.bintray.com/","name":"jcenter","order":21,"visible":1},{"category":"仓库","icon":"","id":26,"link":"https://www.wanandroid.com/maven_pom/index","name":"google","order":22,"visible":1},{"category":"仓库","icon":"","id":34,"link":"https://mvnrepository.com/artifact/com.google.code.gson/gson","name":"maven","order":23,"visible":1},{"category":"博客","icon":"","id":1,"link":"http://blog.csdn.net/lmj623565791","name":"鸿洋","order":31,"visible":1},{"category":"博客","icon":"","id":2,"link":"http://blog.csdn.net/guolin_blog","name":"郭霖","order":32,"visible":1},{"category":"博客","icon":"","id":16,"link":"https://github.com/android-cn/android-dev-com","name":"国外大牛","order":33,"visible":1},{"category":"博客","icon":"","id":17,"link":"http://www.wanandroid.com/article/list/0?cid=176","name":"国内大牛","order":34,"visible":1},{"category":"博客","icon":"","id":35,"link":"https://github.com/xitu/gold-miner/blob/master/android.md","name":"外文翻译","order":35,"visible":1},{"category":"技术站","icon":"","id":6,"link":"https://juejin.im/timeline/android","name":"掘金","order":41,"visible":1},{"category":"技术站","icon":"","id":7,"link":"https://toutiao.io/","name":"开发者头条","order":42,"visible":1},{"category":"技术站","icon":"","id":8,"link":"https://segmentfault.com/t/android","name":"segmentfault","order":43,"visible":1},{"category":"工具","icon":"","id":50,"link":"https://www.wanandroid.com/tools/bejson","name":"Json格式化","order":51,"visible":1},{"category":"工具","icon":"","id":51,"link":"https://www.wanandroid.com/tools/decode","name":"Url decode","order":52,"visible":1},{"category":"工具","icon":"","id":52,"link":"https://www.wanandroid.com/tools/base64","name":"Base64","order":53,"visible":1},{"category":"工具","icon":"","id":53,"link":"https://www.wanandroid.com/tools/digit","name":"md5","order":54,"visible":1},{"category":"工具","icon":"","id":54,"link":"https://www.wanandroid.com/tools/color","name":"取色器","order":55,"visible":1},{"category":"工具","icon":"","id":10,"link":"http://www.androiddevtools.cn/","name":"androiddevtools","order":59,"visible":1},{"category":"面试","icon":"","id":12,"link":"http://www.wanandroid.com/article/list/0?cid=73","name":"Android面试相关","order":71,"visible":1},{"category":"Git","icon":"","id":13,"link":"https://learngitbranching.js.org/","name":"Git在线可视化学习","order":80,"visible":1},{"category":"Kotlin","icon":"","id":40,"link":"https://fabiomsr.github.io/from-java-to-kotlin/","name":"java-to-kotlin","order":99,"visible":1},{"category":"项目","icon":"","id":4,"link":"https://github.com/trending/java","name":"热门开源","order":888,"visible":1},{"category":"项目","icon":"","id":29,"link":"https://github.com/topics/android?l=java&amp;o=desc&amp;s=updated","name":"最新开源","order":888,"visible":1},{"category":"设计","icon":"","id":27,"link":"https://domchristie.github.io/turndown/","name":"html2markdown","order":998,"visible":1},{"category":"设计","icon":"","id":19,"link":"http://md.aclickall.com/","name":"md在线编辑器","order":999,"visible":1},{"category":"设计","icon":"","id":20,"link":"https://unsplash.com/","name":"无版权素材网站","order":999,"visible":1},{"category":"设计","icon":"","id":23,"link":"https://www.fotor.com.cn/","name":"素材设计","order":999,"visible":1},{"category":"简历","icon":"","id":42,"link":"https://resumd.t9t.io/","name":"markdown简历","order":999,"visible":1},{"category":"设计","icon":"","id":43,"link":"https://www.maliquankai.com/designnav/","name":"设计资源","order":999,"visible":1},{"category":"设计","icon":"","id":32,"link":"http://inloop.github.io/interpolator/","name":"在线调试动画","order":1000,"visible":1},{"category":"设计","icon":"","id":31,"link":"https://tool.gifhome.com/compress/","name":"gif压缩","order":4444,"visible":1}]
/// errorCode : 0
/// errorMsg : ""

class HotWebsetData {
  HotWebsetData({
    this.data,
    this.errorCode,
    this.errorMsg,
  });

  HotWebsetData.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(WebData.fromJson(v));
      });
    }
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  List<WebData>? data;
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

/// category : "源码"
/// icon : ""
/// id : 22
/// link : "https://www.androidos.net.cn/sourcecode"
/// name : "androidos"
/// order : 11
/// visible : 1

class WebData {
  WebData({
    this.category,
    this.icon,
    this.id,
    this.link,
    this.name,
    this.order,
    this.visible,
  });

  WebData.fromJson(dynamic json) {
    category = json['category'];
    icon = json['icon'];
    id = json['id'];
    link = json['link'];
    name = json['name'];
    order = json['order'];
    visible = json['visible'];
  }

  String? category;
  String? icon;
  num? id;
  String? link;
  String? name;
  num? order;
  num? visible;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = category;
    map['icon'] = icon;
    map['id'] = id;
    map['link'] = link;
    map['name'] = name;
    map['order'] = order;
    map['visible'] = visible;
    return map;
  }
}
