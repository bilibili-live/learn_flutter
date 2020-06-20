import 'package:flutter/material.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class BannerIndexSwiper extends StatelessWidget {

  BannerIndexSwiper({
    Key key,
    @required this.banners
  }): super(key: key);

  /**
   * 轮播图
   */
  List<String> banners = [];

  @override
  Widget build(BuildContext context) {
    double _w = ScreenUtil.getScreenW(context);
    double _h = _w * 540.0 / 1080.0;
    bool flag = banners.isEmpty;
    return Container(
      width: _w,
      height: _h,
      decoration: BoxDecoration(
        color: !flag ? null : Colors.yellow,
      ),
      child: flag ? emptyText() : swiper(),
      margin: EdgeInsets.only(
        top: !flag ? 12 : 0
      ),
    );
  }

  Widget emptyText() {
    return Center(
      child: Text(
        "没有轮播图",
        style: TextStyle(
          fontSize: 42,
          color: Colors.black
        ),
      ),
    );
  }

  Widget swiper() {
    return Swiper(
      itemBuilder: (BuildContext ctx, index) {
        return Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              banners[index],
              fit: BoxFit.cover,
            ),
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.pink.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 14,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
        );
      },
      itemCount: banners.length,
      viewportFraction: 0.8,
      scale: 0.9,
      pagination: new SwiperPagination(
        margin: EdgeInsets.only(top: 3.3)
      ),
    );
  }

}