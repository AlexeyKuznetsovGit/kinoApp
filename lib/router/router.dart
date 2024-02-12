import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kino_app/models/search_models/docs_model.dart';
import 'package:kino_app/screens/detail_kino_screen/detail_kino_screen.dart';
import 'package:kino_app/screens/favourite_screen/favourite_screen.dart';
import 'package:kino_app/screens/main_screen/main_screen.dart';
import 'package:kino_app/screens/search_screen/search_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Widget|Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: MainRoute.page, initial: true, children: [
          AutoRoute(page: SearchTab.page, maintainState: false, initial: true, children: [
            AutoRoute(page: SearchRoute.page, initial: true),
          ]),
          AutoRoute(page: FavouriteTab.page, maintainState: false, children: [
            AutoRoute(page: FavouriteRoute.page, initial: true),
          ])
        ]),
        AutoRoute(page: DetailKinoRoute.page),
      ];
}

@RoutePage(name: 'SearchTab')
class ProfileTabPage extends AutoRouter {
  const ProfileTabPage({super.key});
}

@RoutePage(name: 'FavouriteTab')
class ProjectsTabPage extends AutoRouter {
  const ProjectsTabPage({super.key});
}
