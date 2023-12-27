// import 'package:dio/dio.dart';
// import 'package:post_request/core/dio_settings.dart';
// import 'package:post_request/domain/models/movie_model.dart';
// import 'package:post_request/presentation/consts/app_consts.dart';
// import 'package:post_request/presentation/screens/home.dart';

// class GetMovieRepo {
//   static Future<void> getMovie() async {
//     final Dio dio = DioSettings().dio;
//     final Response response = await dio.get(
//         "http://www.omdbapi.com/?t=${HomePage.controller.text}&apikey=${AppConsts.apiKey}");
//     MovieModel model =  MovieModel.fromJson(response.data);


// }
// }
