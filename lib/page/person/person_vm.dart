import 'package:flutter/cupertino.dart';
import 'package:learning_android/utils/shared_store_util.dart';

class PersonViewModel extends ChangeNotifier {
  String? username;

  Future<String?> getUser() async {
    var res = await SharedStore.getString(key: "username");
    if (res?.length != 0) {
      username = res;
    } else {
      return null;
    }
  }
}
