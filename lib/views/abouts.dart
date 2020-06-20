
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:learn_flutter/config/const.dart';

class AboutDemoViews extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AboutDemoViewsState(); 
  }

}

class AboutDemoViewsState extends State<AboutDemoViews> {

  List lists = [
    "公司介绍",
    "公司优势",
    "联系我们",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Image.network(
              ConstKey.startupImg,
              fit: BoxFit.cover
            ),
            width: ScreenUtil.getScreenW(context),
            height: 120,
          ),
          _render()
        ],
      ),
    );
  }

  Widget _render() {
    var _f = ListView.separated(
      itemBuilder: (BuildContext f, int index) {
        var ele = lists[index];
        return ListTile(
          title: Text(ele),
          leading: Icon(Icons.score),
          onTap: () {
            if (ele == '联系我们') {
              showDialog(
                context: context,builder: (_) => NetworkGiffyDialog(
                  image: Image.network(ConstKey.startupImg),
                  title: Text(
                    '留言',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  description: Text("打工不可能的.(没有input, 懒得写了..)"),
                  onlyOkButton: true,
                  buttonOkText: Text("知道了"),
                  entryAnimation: EntryAnimation.DEFAULT,
                  onOkButtonPressed: () {},
                )
              );
            }
          },
        );
      },
      separatorBuilder: (BuildContext ctx, int x) {
        return Divider(
          height: 1,
          color: Theme.of(ctx).accentColor
        );
      },
      itemCount: lists.length
    );
    return Container(
      child: _f,
      // TODO: 高度不能这样算...
      width: ScreenUtil.getScreenW(context),
      height: ScreenUtil.getScreenH(context) - 280,
    );
  }

}