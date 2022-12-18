import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarHandler {
  void handleTap(int index, BuildContext context) {
    Map<int, String> routes = {
      0: '/releases',
      1: '/books',
      2: '/profile',
    };

    context.go(routes[index]!);
  }

  List<BottomNavigationBarItem> getNavigationItems() {
    final labels = ['Releases', 'Books', 'Profile'];
    final icons = [Icons.home_outlined, Icons.book_outlined, Icons.person_outlined];
    final selectedIcons = [Icons.home, Icons.book, Icons.person];

    List<BottomNavigationBarItem> items = [];

    for (int i = 0; i < 3; i++) {
      items.add(
        BottomNavigationBarItem(
          icon: Icon(icons[i]),
          activeIcon: Icon(selectedIcons[i]),
          label: labels[i],
        ),
      );
    }

    return items;
  }

  Widget bar(int currentIndex, BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
            top: BorderSide(
          color: Colors.black,
          width: 3,
        )),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => handleTap(index, context),
        items: getNavigationItems(),
        enableFeedback: false,
        fixedColor: Colors.black,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }
}
