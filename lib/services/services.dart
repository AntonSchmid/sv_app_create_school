import 'package:dio/dio.dart';

class Services {
  final dio = Dio(
    BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 10),
        baseUrl: 'http://85.215.99.6:8000/'),
  );

  Future<bool> createSv(int anzahl) async {
    try {
      await dio.post(
        'http://85.215.99.6:8000/register/',
        data: {
          "menge": anzahl,
          "is_sv": true,
          "is_schulAdmin": false,
        },
      );
      return true;
    } on DioException catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> createAdmin(int anzahl) async {
    try {
      await dio.post(
        'http://85.215.99.6:8000/register/',
        data: {
          "menge": anzahl,
          "is_sv": false,
          "is_schulAdmin": true,
        },
      );
      return true;
    } on DioException catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> createUser(int anzahl) async {
    try {
      await dio.post(
        'http://85.215.99.6:8000/register/',
        data: {
          "menge": anzahl,
          "is_sv": false,
          "is_schulAdmin": false,
        },
      );
      return true;
    } on DioException catch (e) {
      print(e.toString());
      return false;
    }
  }
}
