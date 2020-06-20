# `flutter` 学习

## css to flutter

1. 图片圆角 + `box-shadow`

```dart
Widget _build() {
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
}
```

## 踩坑

1. 有些模拟器启动不了..

试试

```bash
flutter run --enable-software-rendering
```

2. 网络问题

> 参考: https://mirrors-i.tuna.tsinghua.edu.cn/help/flutter/