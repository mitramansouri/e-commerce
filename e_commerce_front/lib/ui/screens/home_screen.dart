import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.blue,
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Menu 1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Menu 2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Menu 3',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(50, (index) {
                  return ListTile(
                    title: Text('Item ${index + 1}'),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}