import 'package:flutter/material.dart';
import 'package:jnovel_eink/views/misc/navigation_bar_handler.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);

  void _onTap(int index) {
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Books"),
    );
  }
}
