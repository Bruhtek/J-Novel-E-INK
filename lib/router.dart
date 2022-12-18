import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jnovel_eink/views/books/books.dart';
import 'package:jnovel_eink/views/misc/navigation_bar_handler.dart';
import 'package:jnovel_eink/views/profile/profile.dart';
import 'package:jnovel_eink/views/releases/releases.dart';

final Map<String, dynamic> routes = {
  '/releases': (context, state) => const ReleasesScreen(),
  '/books': (context, state) => const BooksScreen(),
  '/profile': (context, state) => ProfileScreen(),
};

final goRouterConfig = GoRouter(
  initialLocation: '/releases',
  routes: [
    ShellRoute(
      pageBuilder: (context, state, child) {
        final appBarTitles = ['Releases', 'Books', 'Profile'];
        final currentIndex = routes.keys.toList().indexOf(state.location);

        return NoTransitionPage(
          key: state.pageKey,
          child: Scaffold(
            appBar: AppBar(
              title: Text(appBarTitles[currentIndex]),
            ),
            body: child,
            bottomNavigationBar: BottomNavigationBarHandler().bar(currentIndex, context),
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/releases',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const ReleasesScreen(),
          ),
        ),
        GoRoute(
          path: '/books',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const BooksScreen(),
          ),
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: ProfileScreen(),
          ),
        ),
      ],
    ),
  ],
  // share one scaffold with all the routes
);
