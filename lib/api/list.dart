
import 'package:dio/dio.dart';

class RandomListApi {
  static Future<List> getLists() async {
    try {
      Response res = await Dio().get("https://gank.io/api/v2/random/category/GanHuo/type/Android/count/10");
      var data = res.data;
      List _lists = data['data'];
      return _lists;
    } catch(err) {
      return [];
    }
  }
}