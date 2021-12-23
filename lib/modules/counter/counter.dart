import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}


class _CounterState extends State<Counter> {
  int counter = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Row(
        children: [
          MaterialButton(
            onPressed: () {
              setState(() {});
              counter++;
            },
            child: Text('+'),
          ),
          Text(
            '$counter',
          ),
          MaterialButton(
            onPressed: () {
              setState(() {});
              counter--;
            },
            child: Text('-'),
          ),
        ],
      ),
    );
  }
}
