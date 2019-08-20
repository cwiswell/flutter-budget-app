import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = new TextEditingController();
  int _income = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Income: $_income'),
            new TextField(
              controller: _textController,
              decoration: new InputDecoration(labelText: "Enter your income"),
              keyboardType: TextInputType.number,
              onSubmitted: (input)  {
                if(isNumber(input)) {
                  setState(() {
                    _income = num.tryParse(input);
                    _textController.clear();
                  });
                }else{
                  setState(() {
                    _textController.clear();
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  bool isNumber(String value) {
    if(value == null) {
      return true;
    }
    final n = num.tryParse(value);
    return n!= null;
  }
}
