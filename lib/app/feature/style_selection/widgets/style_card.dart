import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:horang_print/app/extension/build_context_x.dart';
import 'package:horang_print/app/model/ai_style.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StyleCard extends StatelessWidget {
  final AiStyle style;
  final bool isSelected;
  final VoidCallback onTap;

  const StyleCard({
    super.key,
    required this.style,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? context.colorScheme.primary
                : context.colorScheme.border,
            width: isSelected ? 3 : 1,
          ),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: context.colorScheme.card,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        flex: 3,
                        child: CachedNetworkImage(
                          imageUrl: style.thumbnail_url,
                          fit: BoxFit.cover,
                          errorWidget: (context, error, stackTrace) {
                            log('Error loading image: $error');
                            return Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    context.colorScheme.primary
                                        .withOpacity(0.4),
                                    context.colorScheme.primaryForeground
                                        .withOpacity(0.5),
                                  ],
                                ),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.auto_awesome,
                                  size: 48,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            style.name,
                            style: context.textTheme.large.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(style.description),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (isSelected)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
