import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kino_app/models/detail_kino_model.dart';
import 'package:kino_app/screens/detail_kino_screen/cubit/cb_detail_kino_screen.dart';
import 'package:kino_app/utils/pj_colors.dart';
import 'package:kino_app/utils/pj_styles.dart';

import 'package:kino_app/widgets/pj_appbar.dart';
import 'package:kino_app/widgets/pj_error_dialog.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

@RoutePage()
class DetailKinoScreen extends StatefulWidget implements AutoRouteWrapper {
  const DetailKinoScreen({super.key, required this.id});

  final int id;

  @override
  State<DetailKinoScreen> createState() => _DetailKinoScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CbDetailKinoScreen>(
      create: (context) => CbDetailKinoScreen()..getData(id),
      child: this,
    );
  }
}

class _DetailKinoScreenState extends State<DetailKinoScreen> {
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late YoutubePlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PjAppBar(
        leading: true,
        title: context.read<CbDetailKinoScreen>().detailKino.year?.toString() ?? '',
      ),
      backgroundColor: PjColors.background,
      body: SafeArea(
        child: BlocConsumer<CbDetailKinoScreen, StDetailKinoScreen>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {
                  setState(() {});
                },
                loaded: (detailKino) {
                  if (detailKino.videos?.trailers?[0].url != null) {
                    _controller = YoutubePlayerController(
                      initialVideoId: YoutubePlayer.convertUrlToId(detailKino.videos!.trailers![0].url!)!,
                      flags: YoutubePlayerFlags(
                        autoPlay: false,
                        loop: false,
                        mute: false,
                      ),
                    );
                  }
                  setState(() {});
                },
                error: (code, message) {
                  showAlertDialog(context, code ?? '', message ?? '', () {
                    setState(() {});
                  });
                },
              );
            },
            builder: (context, state) => state.maybeWhen(
                orElse: () => Center(
                      child: CircularProgressIndicator(
                        color: PjColors.blue,
                      ),
                    ),
                loaded: (detailKino) => _buildContent(context, detailKino))),
      ),
    );
  }

  Widget _buildContent(BuildContext context, DetailKinoModel detailKino) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 20.w,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Text(
              detailKino.name ?? '',
              style: PjStyles.styleBold,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20.w,
          ),
          Container(
            height: 200.w,
            padding: EdgeInsets.all(20.w),
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r), color: PjColors.white, boxShadow: [
              BoxShadow(color: PjColors.blue.withOpacity(0.1), spreadRadius: 0, blurRadius: 5, offset: Offset(0, 0))
            ]),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Text(
                detailKino.description ?? '',
                style: PjStyles.styleRegular,
              ),
            ),
          ),
          SizedBox(
            height: 20.w,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            height: 40.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.emoji_emotions_sharp,
                  size: 24.w,
                  color: Colors.orangeAccent,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  detailKino.votes?.imdb.toString() ?? '0',
                  style: PjStyles.styleBold.copyWith(color: PjColors.whiteBlue),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Icon(
                  Icons.accessibility,
                  size: 24.w,
                  color: Colors.orangeAccent,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "+${detailKino.ageRating ?? '+1'}",
                  style: PjStyles.styleBold.copyWith(color: PjColors.whiteBlue),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.w,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            height: 40.w,
            child: Row(
              children: [
                Text(
                  'Жанр:',
                  style: PjStyles.styleBold,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  detailKino.genres?[0].name ?? '',
                  style: PjStyles.styleBold,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.w,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Text(
              'Дата премьеры в мире:',
              style: PjStyles.styleBold,
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Text(
                DateFormat("yyyy-MM-dd").format(DateTime.parse(detailKino.premiere?.world ?? '2023-02-25')),
                style: PjStyles.styleBold.copyWith(color: PjColors.whiteBlue),
              )),
          SizedBox(
            height: 10.w,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            height: 40.w,
            child: Row(
              children: [
                Text(
                  'Сборы в мире:',
                  style: PjStyles.styleBold,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  detailKino.fees?.world?.currency ?? '\$',
                  style: PjStyles.styleBold.copyWith(color: Colors.orangeAccent),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  detailKino.fees?.world?.value?.toString() ?? '0',
                  style: PjStyles.styleBold.copyWith(color: PjColors.whiteBlue),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.w,
          ),
          Container(
            height: 150.w,
            child: ListView.builder(
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                itemCount: detailKino.persons?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150.w,
                    margin: EdgeInsets.only(right: index != detailKino.persons!.length - 1 ? 10.w : 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: PjColors.white,
                        boxShadow: [
                          BoxShadow(
                              color: PjColors.blue.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset: Offset(0, 0))
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        detailKino.persons?[index].photo == null
                            ? Icon(
                                Icons.face,
                                size: 50.w,
                                color: Colors.orangeAccent,
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: Image.network(
                                  detailKino.persons![index].photo!,
                                  width: 100.w,
                                  height: 100.w,
                                  fit: BoxFit.cover,
                                )),
                        SizedBox(
                          height: 5.w,
                        ),
                        Text(
                          detailKino.persons?[index].name ?? '',
                          style: PjStyles.styleRegular,
                        )
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 20.w,
          ),
          if (detailKino.videos?.trailers?[0].url != null) ...[
            Container(
              height: 200.w,
              margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
              child: YoutubePlayer(
                controller: _controller,
              ),
            ),
            SizedBox(
              height: 20.w,
            )
          ]
        ],
      ),
    );
  }
}
