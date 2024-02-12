import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kino_app/models/search_models/docs_model.dart';

import 'package:kino_app/screens/search_screen/cubit/cb_search_screen.dart';
import 'package:kino_app/utils/pj_colors.dart';
import 'package:kino_app/utils/pj_debounce.dart';

import 'package:kino_app/utils/singleton/sg_database.dart';
import 'package:kino_app/utils/singleton/sq_app_data.dart';
import 'package:kino_app/widgets/kino_widget.dart';
import 'package:kino_app/widgets/pj_appbar.dart';
import 'package:kino_app/widgets/pj_error_dialog.dart';

import 'components/search_field.dart';

@RoutePage()
class SearchScreen extends StatefulWidget implements AutoRouteWrapper {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CbSearchScreen>(
      create: (context) => CbSearchScreen(),
      child: this,
    );
  }
}

class _SearchScreenState extends State<SearchScreen> {
  final PjDebounce _debounce = PjDebounce(milliseconds: 300);
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PjAppBar(
            title: 'Поиск',
          ),
          backgroundColor: PjColors.background,
          body: SafeArea(
            child: Center(
              child: BlocConsumer<CbSearchScreen, StSearchScreen>(
                  listener: (context, state) {
                    state.maybeWhen(orElse: () {

                      log(SgAppData.instance.fullData.toString(), name: 'full');
                      _focusNode.unfocus();
                      setState(() {});
                    }, error: (code, message) {
                      showAlertDialog(context, code ?? '', message ?? '', () {
                        setState(() {});
                      });
                    });
                  },
                  builder: (context, state) => state.maybeWhen(
                      orElse: () => _buildContentHasInternet(context),
                      noInternet: () => _buildContentNoInternet(context))),
            ),
          )),
    );
  }

  Widget _buildContentHasInternet(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.w,
        ),
        SearchField(
          focusNode: _focusNode,
          controller: _controller,
          onChanged: (text) {
            setState(() {
              _controller.text = text;
              if (_controller.text.replaceAll(" ", '').length >= 3) {
                _debounce.run(() => context.read<CbSearchScreen>().getData(_controller.text));
              }
            });
          },
        ),
        SizedBox(
          height: 20.w,
        ),
        context.read<CbSearchScreen>().state == StSearchScreen.loading()
            ? CircularProgressIndicator(
                color: PjColors.blue,
              )
            : Flexible(
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                    itemCount: context.read<CbSearchScreen>().data.length,
                    itemBuilder: (context, index) => KinoWidget(
                        onButtonTap: () async {
                          if (SgAppData.instance.fullData
                              .any((element) => element.id == context.read<CbSearchScreen>().data[index].id)) {
                            await context
                                .read<CbSearchScreen>()
                                .removeKino(context.read<CbSearchScreen>().data[index].id.toString());
                            setState(() {});
                          } else {
                            await context.read<CbSearchScreen>().addKino(
                                context.read<CbSearchScreen>().data[index].id!,
                                context.read<CbSearchScreen>().data[index].name!,
                                context.read<CbSearchScreen>().data[index].shortDescription!,
                                context.read<CbSearchScreen>().data[index].ratingImb!);
                            setState(() {});
                          }
                        },
                        kino: context.read<CbSearchScreen>().data[index],
                        isFavourite: SgAppData.instance.fullData
                            .any((element) => element.id == context.read<CbSearchScreen>().data[index].id))),
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
              itemCount: context.read<CbSearchScreen>().data.length,
              itemBuilder: (context, index) => KinoWidget(
                    onButtonTap: () async {
                      if (SgAppData.instance.localData
                          .any((element) => element.id == context.read<CbSearchScreen>().data[index].id)) {
                        await DBProvider.db.deleteKino(context.read<CbSearchScreen>().data[index].id!);
                        SgAppData.instance.localData.remove(context.read<CbSearchScreen>().data[index]);
                        setState(() {});
                      } else {
                        Map<String, dynamic> kino = {
                          'id': context.read<CbSearchScreen>().data[index].id,
                          'name': context.read<CbSearchScreen>().data[index].name,
                          'shortDescription': context.read<CbSearchScreen>().data[index].shortDescription,
                          'ratingImb': context.read<CbSearchScreen>().data[index].ratingImb
                        };
                        await DBProvider.db.addKino(kino);
                        SgAppData.instance.localData.add(
                          DocsModel(
                              id: context.read<CbSearchScreen>().data[index].id,
                              name: context.read<CbSearchScreen>().data[index].name,
                              shortDescription: context.read<CbSearchScreen>().data[index].shortDescription,
                              ratingImb: context.read<CbSearchScreen>().data[index].ratingImb),
                        );
                        log(SgAppData.instance.localData.toString(), name: 'local');
                        setState(() {});
                      }
                    },
                    kino: context.read<CbSearchScreen>().data[index],
                    isFavourite: SgAppData.instance.localData
                        .any((element) => element.id == context.read<CbSearchScreen>().data[index].id),
                  )),
        )
      ],
    );
  }
}
