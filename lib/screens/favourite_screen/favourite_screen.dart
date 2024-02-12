import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kino_app/screens/favourite_screen/cubit/cb_favourite_screen.dart';
import 'package:kino_app/utils/pj_colors.dart';
import 'package:kino_app/utils/singleton/sg_database.dart';
import 'package:kino_app/utils/singleton/sq_app_data.dart';
import 'package:kino_app/widgets/kino_widget.dart';
import 'package:kino_app/widgets/pj_appbar.dart';
import 'package:kino_app/widgets/pj_error_dialog.dart';
import 'package:kino_app/widgets/pj_loading_dialog.dart';

@RoutePage()
class FavouriteScreen extends StatefulWidget implements AutoRouteWrapper {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CbFavouriteScreen>(
      create: (context) => CbFavouriteScreen(),
      child: this,
    );
  }
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PjAppBar(
          title: SgAppData.instance.hasInternet ? 'Избранное' : 'Избранное (Локально)',
        ),
        backgroundColor: PjColors.background,
        body: SafeArea(
          child: Center(
            child: BlocConsumer<CbFavouriteScreen, StFavouriteScreen>(
                listener: (context, state) {
                  state.maybeWhen(orElse: () {
                    setState(() {});
                  }, error: (code, message) {
                    showAlertDialog(context, code ?? '', message ?? '', () {
                      setState(() {});
                    });
                  }, loaded: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    setState(() {});
                  }, loading: () {
                    showLoader(context);
                  });
                },
                builder: (context, state) => state.maybeWhen(
                      orElse: () => _buildContentHasInternet(context),
                      init: () => CircularProgressIndicator(
                        color: PjColors.blue,
                      ),
                      noInternet: () => _buildContentNoInternet(context),
                    )),
          ),
        ),
      ),
    );
  }

  Widget _buildContentHasInternet(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.w,
        ),
        Flexible(
          child: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: SgAppData.instance.fullData.length,
              itemBuilder: (context, index) => KinoWidget(
                    onButtonTap: () async {
                      await context
                          .read<CbFavouriteScreen>()
                          .removeKino(SgAppData.instance.fullData[index].id.toString());
                      setState(() {});
                    },
                    kino: SgAppData.instance.fullData[index],
                    isFavourite: true,
                  )),
        )
      ],
    );
  }

  Widget _buildContentNoInternet(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.w,
        ),
        Flexible(
          child: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: SgAppData.instance.localData.length,
              itemBuilder: (context, index) => KinoWidget(
                    onButtonTap: () async {
                      await context
                          .read<CbFavouriteScreen>()
                          .databaseRemoveKino(SgAppData.instance.localData[index].id!, index);
                      setState(() {});
                    },
                    kino: SgAppData.instance.localData[index],
                    isFavourite: true,
                  )),
        )
      ],
    );
  }
}
