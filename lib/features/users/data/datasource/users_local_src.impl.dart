import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../../core/retrofit/rest_client.dart';
import '../models/response_model.dart';
import 'users_local_src.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class UsersLocalSrcImpl extends UsersLocalSrc {
  late RestClient restClient;

  @override
  Future<List<Result>> getUsers(bool isBackgroundEvent) async {

    return await getUsersFromServer().single;
  }

  Future initRestClient({bool refreshToken = false}) async {
    Dio dio = Dio();
    dio.options.headers['content-type'] = 'application/json';
    dio.interceptors.add(LogInterceptor(responseBody: true));
    restClient = (RestClient(dio));
  }

  Stream<List<Result>> getUsersFromServer() {
    return Stream.fromFuture(initRestClient())
        .flatMap((data) {
          return RetryWhenStream(() => Stream.fromFuture(restClient.getUsers()),
              (e, s) async* {
            yield* Stream.error(e);
          });
        })
        .map((response) {
          debugPrint('Final List  DB :: ${response.results}');
          return response.results;
        });
  }
}
