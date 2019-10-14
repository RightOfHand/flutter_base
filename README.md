# flutter_demo

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

1：dart
dynamic与Object相同之处在于,他们声明的变量可以在后期改变赋值类型,object声明的对象只能使用Object的属性与方法；

2：Resource
  flutter:
    assets:
      - graphics/background.png


3: 移步更新UI
  3.1: FutureBuilder

      构造器 FutureBuilder({
         this.future,
         this.initialData,
         @required this.builder,
       })

  3.2: StreamBuilder

