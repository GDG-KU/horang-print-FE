import 'package:dio/dio.dart';
import 'package:horang_print/app/api/dio_client.dart';
import 'package:horang_print/app/api/result.dart';
import 'package:get_it/get_it.dart';
import 'package:horang_print/app/model/ai_style.dart';
import 'package:horang_print/app/model/session_state.dart';

class ApiService {
  static ApiService get I => GetIt.I<ApiService>();

  late final MyDio _dio;

  ApiService() {
    _dio = MyDio(dio: Dio());
  }

  Future<Result<List<AiStyle>>> getStyles() => _dio.get(
        '/styles',
        fromJson: (json) =>
            (json as List).map<AiStyle>((e) => AiStyle.fromJson(e)).toList(),
      );

  Future<Result<SessionState>> createSessionWithStyle(int styleId) => _dio.post(
        '/session/create',
        data: {'style_id': styleId},
        fromJson: (json) => SessionState.fromJson(json),
      );

  Future<Result<void>> submitOriginalImage(
    List<int> imageBytes,
    String sessionUuid,
  ) async {
    final formData = FormData.fromMap({
      'image_file': MultipartFile.fromBytes(
        imageBytes,
        filename: 'original_image.png',
      ),
      'session_uuid': sessionUuid,
    });

    return _dio.post('/image/upload', data: formData);
  }

  Future<Result<dynamic>> registerSessionEventStream(String sessionUuid) =>
      _dio.getEventStream('/session/$sessionUuid/events');
}
