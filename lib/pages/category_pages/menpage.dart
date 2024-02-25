import 'package:flutter/material.dart';

class MenPage extends StatefulWidget {
  const MenPage({super.key});

  @override
  State<MenPage> createState() => _MenPageState();
}

class _MenPageState extends State<MenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Container(
          child: Center(
            child: Text('All men products will display here !'),
          ),
        ));
  }
}
