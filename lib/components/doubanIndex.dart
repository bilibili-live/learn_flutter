
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/pages/detail.dart';

class DouBanIndexComponent extends StatelessWidget {

  DouBanIndexComponent({
    Key key,
    this.lists
  }): super(key: key);

  List lists = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _titleWrapper(context),
          _dataList(context, lists)
        ],
      ),
    );
  }

  Widget _dataList(context, List lists) {
    var _w = ScreenUtil.getScreenW(context);
    var itemW = _w * 168.5 / 360;
    List<Widget> listWrap = lists.map((item){
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) {
              return CatDetailPage(item: item);
            })
          );
        },
        child: Container(
          width: itemW,
          child: Column(
            children: <Widget>[
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    item["info"]["imgurl"],
                    width: itemW,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                margin: EdgeInsets.only(bottom: 4),
                padding: EdgeInsets.all(2.4)
              ),
              RichText(
                textAlign: TextAlign.left,
                textWidthBasis: TextWidthBasis.parent,
                text: TextSpan(
                  text: item['title'],
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red
                  ),
                  children: <InlineSpan>[
                    WidgetSpan(
                      child: Container(
                        child: Text(
                          item['info']['pingfen'],
                          style: TextStyle(
                            backgroundColor: Colors.blue,
                            color: Colors.white,
                          ),
                        ),
                      padding: EdgeInsets.only(left: 4, bottom: 2),
                      )
                    )
                  ]
                ),
                )
            ],
          )
        ),
      );
    }).toList();
    return Container(
      child: Wrap(
        spacing: 2,
        children: listWrap.isEmpty ? [ Text("没有内容") ] : listWrap,
      ),
      padding: EdgeInsets.only(bottom:20),
    );
  }

  Widget _titleWrapper(BuildContext context) {
    return Container(
      width: ScreenUtil.getScreenW(context),
      child: Center(
        child: Text(
          "这辈子不打工的..",
          style: TextStyle(
            fontSize: 18,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.wavy,
            decorationColor: Theme.of(context).accentColor
          ),
        ),
      ),
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.only(bottom: 8, top: 8),
    );
  }

}