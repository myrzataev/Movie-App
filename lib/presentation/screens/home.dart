import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:post_request/core/dio_settings.dart';
import 'package:post_request/domain/data/shared_prefs.dart';
import 'package:post_request/domain/models/movie_model.dart';
import 'package:post_request/presentation/consts/app_consts.dart';
import 'package:post_request/presentation/widgets/linear_gradient_box.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  String? poster;
  String? title;
  String? description;
  late String? nameOfMovie = _controller.text;
  String? action = "Great";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
                child: FutureBuilder(
                    future: getMovie(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator.adaptive());
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: SizedBox(
                                height: 48,
                                width: 330,
                                child: TextField(
                                  controller: _controller,
                                  onSubmitted: (String value) async {
                                    getMovie();
                                    setState(() {});
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      prefixIcon: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: const Icon(
                                          Icons.search,
                                          size: 15,
                                        ),
                                      ),
                                      hintText: 'Search Malls or Branch',
                                      hintStyle: AppConsts.w400s13,
                                      fillColor: const Color(0xff696969)
                                          .withOpacity(0.8),
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: SizedBox(
                                // height: 578,
                                child: Stack(
                                  // fit: StackFit.expand,
                                  alignment: AlignmentDirectional.bottomCenter,
                                  children: [
                                    Container(
                                      height: 560,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image:
                                                  NetworkImage(poster ?? ""))),
                                    ),
                                    const GradientWidget(
                                      begin: FractionalOffset.topCenter,
                                      end: FractionalOffset.bottomCenter,
                                    ),
                                    const GradientWidget(
                                      begin: FractionalOffset.bottomCenter,
                                      end: FractionalOffset.topCenter,
                                    ),
                                    Center(
                                      child: SizedBox(
                                        // height: 104,
                                        width: 329,
                                        child: Column(
                                          children: [
                                            Text(
                                              title ?? "",
                                              style: AppConsts.w500s18,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  top: 10,
                                                  bottom: 30),
                                              child: Text(
                                                description ?? "",
                                                style: AppConsts
                                                    .w300s11description,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      '10.4K Comments',
                                      style: AppConsts.w500s12,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 35,
                                          width: 35,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xffC4C4C4)),
                                          child: const Center(
                                              child: Text(
                                            'KC',
                                            style: AppConsts.w500s15,
                                          )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 13),
                                          child: SizedBox(
                                            width: 270,
                                            height: 17,
                                            child: TextField(
                                              controller: _commentController,
                                              onSubmitted: (value) async {
                                                final SharedPreferences prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                prefs.setString("comment",
                                                    _commentController.text);
                                                setState(() {
                                                  action = prefs
                                                      .getString("comment");
                                                });
                                              },
                                              decoration: const InputDecoration(
                                                  hintText: 'Add a comment...',
                                                  hintStyle: AppConsts.w300s11),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 35,
                                          width: 35,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xffC4C4C4)),
                                          child: const Center(
                                              child: Text(
                                            'AG',
                                            style: AppConsts.w500s15,
                                          )),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 13),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Andrew Garfield',
                                                  style: AppConsts.w500s10,
                                                ),
                                                Text(
                                                  action ?? "asd",
                                                  style: AppConsts
                                                      .w300s11description,
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                            )
                          ],
                        );
                      }
                    }))));
  }

  Future<void> getMovie() async {
    String? nameOfMovie = _controller.text;
    final Dio dio = DioSettings().dio;
    final Response response = await dio.get(
        "http://www.omdbapi.com/?t=${nameOfMovie}&apikey=${AppConsts.apiKey}");
    MovieModel model = MovieModel.fromJson(response.data);
    poster = model.poster ??
        " https://w0.peakpx.com/wallpaper/652/188/HD-wallpaper-vertical-spider-man-spiderman-portrait.jpg";
    title = model.title ?? "";
    description = model.plot ?? "";
  }

  // Future<void> addComment(comment) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     prefs.setString("comment", comment);
  //   });
  //   action = prefs.getString("comment");
  // }
}
