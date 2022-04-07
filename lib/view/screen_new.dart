import 'package:flutter/material.dart';

class ScreenNew extends StatefulWidget {
  final String judul, isi;

  const ScreenNew({Key? key, required this.judul, required this.isi}) : super(key: key);

  @override
  State<ScreenNew> createState() => _ScreenNewState();
}

class _ScreenNewState extends State<ScreenNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News")
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                widget.judul
              ),
              const SizedBox(height: 16,),
              Text(
                widget.isi,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
