import 'dart:async';

import 'package:horang_print/app/api/sse_event.dart';

class SseTransformer extends StreamTransformerBase<String, SseEvent> {
  @override
  Stream<SseEvent> bind(Stream<String> stream) {
    return Stream.eventTransformed(
      stream,
      (sink) => _SseEventSink(sink),
    );
  }
}

class _SseEventSink implements EventSink<String> {
  final EventSink<SseEvent> _output;

  String? _id;
  String? _event;
  String _data = '';
  int? _retry;

  _SseEventSink(this._output);

  @override
  void add(String line) {
    if (line.isEmpty) {
      if (_data.isNotEmpty) {
        _output.add(SseEvent(
          id: _id,
          event: _event,
          data: _data,
          retry: _retry,
        ));

        _data = '';
      }
      return;
    }

    if (line.startsWith(':')) {
      return;
    }

    final colonIndex = line.indexOf(':');
    if (colonIndex == -1) {
      return;
    }

    final field = line.substring(0, colonIndex);
    var value = line.substring(colonIndex + 1);

    if (value.startsWith(' ')) {
      value = value.substring(1);
    }

    switch (field) {
      case 'id':
        _id = value;
        break;
      case 'event':
        _event = value;
        break;
      case 'data':
        if (_data.isNotEmpty) {
          _data += '\n';
        }
        _data += value;
        break;
      case 'retry':
        _retry = int.tryParse(value);
        break;
    }
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    _output.addError(error, stackTrace);
  }

  @override
  void close() {
    if (_data.isNotEmpty) {
      _output.add(SseEvent(
        id: _id,
        event: _event,
        data: _data,
        retry: _retry,
      ));
    }
    _output.close();
  }
}
