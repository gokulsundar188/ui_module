import 'package:flutter/material.dart';
import 'package:function_module/function_module.dart';
import 'package:theme_module/theme_module.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController1 = new TextEditingController();
  TextEditingController textEditingController2 = new TextEditingController();
  Functions functions = new Functions();
  String ans = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(Functions().helloWorld()),
            Container(
              margin: const EdgeInsets.all(8.0),
              height: 60,
              child: TextFormField(
                controller: textEditingController1,
                decoration: Themes().textFormFieldThemes.textFieldTheme(),
              ),
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: Themes().textFormFieldThemes.textFieldTheme(),
                controller: textEditingController2,
              ),
            ),
            RaisedButton(
              child: Text("ok"),
              onPressed: () {
                setState(() {
                  ans = "";
                  ans = functions.addition(
                      textEditingController1, textEditingController2, context);
                });
              },
            ),
            SizedBox(
              height: 25,
            ),
            Visibility(
              visible: ans == "" || ans == null ? false : true,
              child: CircleAvatar(
                radius: 25,
                child: Text(ans ?? ""),
              ),
            )
          ],
        ),
      ),
    );
  }
}
