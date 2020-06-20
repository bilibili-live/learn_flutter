
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:learn_flutter/config/const.dart';
import 'package:flustars/flustars.dart';
import 'package:learn_flutter/utils/utils.dart';
import 'package:common_utils/common_utils.dart';

class LoadingWrapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoadingWrapperState();
  }

}

class LoadingWrapperState extends State<LoadingWrapper> {

  /**
   * 定时器时间
   */
  int _s = ConstKey.startupTime;

  /**
   * 首页启动文本
   */
  String _startupHelp = "<h1>Flutter Demo</h1>";

  TimerUtil mTimerUtil;

  @override initState() {
    getContentHTML();
    Timer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        bgImg(),
        content(
          _startupHelp
        ),
        smButton()
      ],
    );
  }

  /**
   * 获取首页 `html`
   */
  void getContentHTML() async {
    String result;
    try {
      result = await PioUtils.readRawHelpText();
    } catch (err) {
      result = "<h4>Flutter Demo</h4>";
    }
    print("结果为: " + result);
    setState(()=> {
      _startupHelp = result
    });
  }

  /**
   * 定时器
   */
  void Timer() {
    mTimerUtil = TimerUtil(
      mInterval: 1000,
      mTotalTime: ConstKey.startupTime
    );
    mTimerUtil.startCountDown();
    mTimerUtil.setOnTimerTickCallback((tick) {
      setState(()=> {
        _s = tick
      });
    });
  }


  /**
   * 内容
   */
  Widget content(String html) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: Container(
          child: HtmlWidget(
            html,
            textStyle: TextStyle(
              fontSize: 12,
              color: Colors.pink,
              decoration: TextDecoration.none,
            ),
          ),
          color: Colors.black87,
          padding: EdgeInsets.all(8.2),
        )
      ),
    );
  }

  /**
   * 启动背景图片
   */
  Widget bgImg({ String src =  ConstKey.startupImg }) {
    return Image.network(
      src,
      width: ScreenUtil.getScreenW(context),
      height: ScreenUtil.getScreenH(context),
      fit: BoxFit.cover
    );
  }

  /**
   * 跳过按钮
   */
  Widget smButton() {
    double _padding = 18;
    double __s = _s / 1000;
    String _txt = __s.toStringAsFixed(0);
    String _concat = ConstKey.startupSkipText;
    if (__s > 0) _concat += '$_txt' + '秒';
    return Positioned(
      child: RaisedButton.icon(
        onPressed: () {
          if (_s == 0) {
            Navigator.of(context).pushReplacementNamed("app");
          }
        },
        icon: Icon(Icons.skip_next),
        label: RichText(
          text: TextSpan(
            children: <InlineSpan>[
              TextSpan(
                text: _concat
              )
            ]
          ),
        ),
        color: Colors.blueAccent,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(42.0),
        ),
        padding: EdgeInsets.only(left: _padding, right: _padding),
      ),
      right: 18.6,
      top: 24.0
    );
  }

}