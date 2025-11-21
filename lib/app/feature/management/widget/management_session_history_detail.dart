import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:horang_print/app/model/session_history.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ManagementSessionHistoryDetail extends StatelessWidget {
  const ManagementSessionHistoryDetail(
      {super.key, required this.sessionHistory});

  final SessionHistory sessionHistory;

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: const Text('세션 상세 정보'),
      description: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('스타일: ${sessionHistory.style}'),
          Text('UUID: ${sessionHistory.uuid}'),
          Text('생성일: ${sessionHistory.created_at}'),
          if (sessionHistory.qr.target_url.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: CachedNetworkImage(
                imageUrl: sessionHistory.qr.target_url,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          if (sessionHistory.qr.target_url.isEmpty)
            Container(
              padding: const EdgeInsets.only(top: 16.0),
              child: const Text('이미지가 없습니다.'),
            )
        ],
      ),
      actions: [
        ShadButton(
          onPressed: () {},
          child: const Text('재출력'),
        ),
      ],
    );
  }
}
