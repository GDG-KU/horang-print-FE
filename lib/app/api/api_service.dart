import 'package:dio/dio.dart';
import 'package:horang_print/app/api/dio_client.dart';
import 'package:horang_print/app/api/result.dart';
import 'package:get_it/get_it.dart';
import 'package:horang_print/app/model/some_model.dart';

class ApiService {
  static ApiService get I => GetIt.I<ApiService>();

  late final MyDio _dio;

  ApiService() {
    _dio = MyDio(dio: Dio());
  }

  Future<Result<SomeModel>> exampleApi(int id) => _dio.get(
        '/example/$id',
        fromJson: (_) => SomeModel.fromJson(_),
      );
}
