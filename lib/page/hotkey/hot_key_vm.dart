import 'package:flutter/widgets.dart';
import 'package:learning_android/repository/api.dart';
import 'package:learning_android/repository/datas/hot_webset_data.dart';

import '../../repository/datas/hot_key_data.dart';

class HotKeyViewModel extends ChangeNotifier {
  List<KeyData>? keyData = [];
  List<WebData>? webData = [];

  initData() async {
    await getHotKey();
    await getWebData();
    print(keyData);
    notifyListeners();
  }

  Future getHotKey() async {
    var res = await Api.instance.gethotKey();
    keyData?.addAll(res ?? []);
  }

  Future getWebData() async {
    var res = await Api.instance.getwebset();
    webData?.addAll(res ?? []);
  }
}
