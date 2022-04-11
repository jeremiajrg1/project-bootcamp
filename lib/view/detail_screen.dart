import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String id;
  DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail")
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),

        ),
      ),
    );
  }
}
