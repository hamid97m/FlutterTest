import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class First extends StatefulWidget {
  final Color color;

  Color getcolor() {
    return color;
  }

  First(this.color);

  @override
  State<StatefulWidget> createState() {
    return container(color);
  }
}

class container extends State<First> {
  bool toggle = true;
  final Color color;

  container(this.color);

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return CupertinoButton(
          color: Colors.green,
          borderRadius: new BorderRadius.circular(30.0),
          padding: EdgeInsets.all(15),
          onPressed: () {
            Navigator.of(context).pushNamed('/a');

            Fluttertoast.showToast(
                msg: "This is ios",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIos: 1,
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                fontSize: 16.0);
          },
          child: Text('Toggle Two'));
    } else {
      return new RaisedButton(
          padding: EdgeInsets.all(15),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          onPressed: () {
            Navigator.of(context).pushNamed('/b');

            Fluttertoast.showToast(
                msg: "This is android",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIos: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          },
          child: Text('Toggle Two'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}
