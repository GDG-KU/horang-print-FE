import 'package:dio/dio.dart';
import 'package:horang_print/app/api/dio_client.dart';
import 'package:horang_print/app/api/result.dart';
import 'package:get_it/get_it.dart';
import 'package:horang_print/app/api/sse_event.dart';
import 'package:horang_print/app/model/ai_style.dart';
import 'package:horang_print/app/model/session_history.dart';
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

  Future<Result<Stream<SseEvent>>> registerSessionEventStream(
    String sessionUuid,
    CancelToken cancelToken,
  ) =>
      _dio.getEventStream(
        '/session/$sessionUuid/events',
        cancelToken: cancelToken,
      );

  Future<Result<void>> uploadReceiptImage(
    List<int> imageBytes,
    String sessionUuid,
  ) async {
    final formData = FormData.fromMap({
      'edited_image': MultipartFile.fromBytes(
        imageBytes,
        filename: 'receipt_image.png',
      ),
      'session_uuid': sessionUuid,
    });

    return _dio.post('/image/finalize', data: formData);
  }

  Future<Result<List<SessionHistory>>> getSessionHistories() => _dio.get(
        '/sessions',
        fromJson: (json) => (json as List)
            .map<SessionHistory>((e) => SessionHistory.fromJson(e))
            .toList(),
      );
}
