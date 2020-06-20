import 'package:dio/dio.dart';

class AppHomeApi {

  /**
   * 获取首页`banner`图
   */
  static Future<List<String>> getIndexBanners() async {
    List<String> _result = new List<String>();
    try {
      Response response = await Dio().get("https://gank.io/api/v2/banners");
      Map<String, dynamic> data = response.data;
      List _data = data['data'];
      List _banners = _data.map((e) => e['image']).toList();
      _result = new List<String>.from(_banners);
    } catch(e) {
      print(e);
    }
    return _result;
  }

  /**
   * 豆瓣接口
   */
  static getDouBanApi() async {
    try { 
      Response res = await Dio().get("https://api.vvhan.com/api/douban");
      Map<String, dynamic> _data = res.data;
      List data = _data['data'];
      return data;
    } catch (e) {
      print(e);
    }
  }
  
}