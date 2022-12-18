import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: const Text("Loading..."),
            margin: const EdgeInsets.all(10),
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
