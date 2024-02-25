import 'package:flutter/material.dart';

class WomenPage extends StatefulWidget {
  const WomenPage({super.key});

  @override
  State<WomenPage> createState() => _MenPageState();
}

class _MenPageState extends State<WomenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Container(
          child: Center(
            child: Text('All women products will display here !'),
          ),
        ));
  }
}
