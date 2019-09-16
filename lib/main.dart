import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  int _value1 = 0;
  int _value2 = 0;

  bool _switch1 = false;
  bool _switch2 = false;

  void _setValue1 (int value) => setState(()=> _value1 = value);
  void _setValue2 (int value) => setState(()=> _value2 = value);

  void _onChangedSwitch1(bool value)setState(()=> _switch1 = value);
  void _onChangedSwitch2(bool value)setState(()=> _switch2 = value);


  Widget makeRadios()
  {
    List list = new List();
    for(int i = 0;i < 3;i++)
    {
      list.add(new Radio(value:i,groupValue:_value1,onChanged:_setValue1));
    }
    Column column = new Column(children:list);
    return column;
  }  

  Widget makeRadiosTiles()
  {
    List list = new List();
    for(int i = 0;i < 3;i++)
    {
      list.add(new RadiosListTiles(value:i,groupValue:_value2,onChanged:_setValue2));
    }
    Column column = new Column(children:list);
    return column;
  }  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new Text('Add Widgets Here'),
            makeRadiosTiles(),
            makeRadios(),
            new Switch (value: _switch1,onChanged: _onChangedSwitch1),
            new SwitchListTile (
              value:_switch2,
              onChanged:_onChangedSwitch2,
              title: new Text("Switch one"),
              subtitle: new Text("Subtitle")
            )
          ],
        ),
      ),
    );
  }
}
