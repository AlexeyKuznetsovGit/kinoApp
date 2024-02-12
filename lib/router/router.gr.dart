// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DetailKinoRoute.name: (routeData) {
      final args = routeData.argsAs<DetailKinoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: DetailKinoScreen(
          key: args.key,
          id: args.id,
        )),
      );
    },
    FavouriteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const FavouriteScreen()),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const MainScreen()),
      );
    },
    SearchTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileTabPage(),
      );
    },
    FavouriteTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProjectsTabPage(),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const SearchScreen()),
      );
    },
  };
}

/// generated route for
/// [DetailKinoScreen]
class DetailKinoRoute extends PageRouteInfo<DetailKinoRouteArgs> {
  DetailKinoRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          DetailKinoRoute.name,
          args: DetailKinoRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailKinoRoute';

  static const PageInfo<DetailKinoRouteArgs> page =
      PageInfo<DetailKinoRouteArgs>(name);
}

class DetailKinoRouteArgs {
  const DetailKinoRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'DetailKinoRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [FavouriteScreen]
class FavouriteRoute extends PageRouteInfo<void> {
  const FavouriteRoute({List<PageRouteInfo>? children})
      : super(
          FavouriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavouriteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileTabPage]
class SearchTab extends PageRouteInfo<void> {
  const SearchTab({List<PageRouteInfo>? children})
      : super(
          SearchTab.name,
          initialChildren: children,
        );

  static const String name = 'SearchTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProjectsTabPage]
class FavouriteTab extends PageRouteInfo<void> {
  const FavouriteTab({List<PageRouteInfo>? children})
      : super(
          FavouriteTab.name,
          initialChildren: children,
        );

  static const String name = 'FavouriteTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
