
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kino_app/router/router.dart';
import 'package:kino_app/screens/main_screen/cubit/cb_main_screen.dart';
import 'package:kino_app/utils/pj_colors.dart';
import 'package:kino_app/utils/pj_styles.dart';
import 'package:kino_app/utils/singleton/sq_app_data.dart';

@RoutePage()
class MainScreen extends StatefulWidget implements AutoRouteWrapper {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CbMainScreen>(
      create: (context) => CbMainScreen()..getData(),
      child: this,
    );
  }
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CbMainScreen, StMainScreen>(
        builder: (context, state) => state.maybeWhen(
            orElse: () => const Scaffold(
                backgroundColor: PjColors.background,
                body: Center(
                    child: CircularProgressIndicator(
                  color: PjColors.blue,
                ))),
            loaded: () => AutoTabsScaffold(
                backgroundColor: PjColors.background,
                routes: [SearchTab(), FavouriteTab()],
                bottomNavigationBuilder: (context, tabsRouter) {
                  return Theme(
                    data: ThemeData(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: PjColors.blue.withOpacity(0.05),
                                spreadRadius: 0,
                                blurRadius: 8,
                                offset: Offset(0, -1)),
                          ],
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r))),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r)),
                        child: BottomNavigationBar(
                          backgroundColor: PjColors.white,
                          showSelectedLabels: false,
                          elevation: 0,
                          unselectedFontSize: 0.0,
                          selectedFontSize: 0.0,
                          selectedItemColor: PjColors.blue,
                          type: BottomNavigationBarType.fixed,
                          showUnselectedLabels: false,
                          currentIndex: tabsRouter.activeIndex,
                          selectedLabelStyle: PjStyles.styleRegular.copyWith(color: PjColors.blue),
                          unselectedLabelStyle: PjStyles.styleRegular,
                          onTap: (index){
                            tabsRouter.setActiveIndex(index);

                          },
                          items: [
                            BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.search,
                                  size: 25.w,
                                ),
                                label: ""),
                            BottomNavigationBarItem(
                                icon: Icon(
                                  Icons.heart_broken,
                                  size: 25.w,
                                ),
                                label: ""),
                          ],
                        ),
                      ),
                    ),
                  );
                })));
  }
}
