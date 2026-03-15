import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:money_tracker/features/home/data/finance_news_service.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key, required this.item});

  final FinanceNewsItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.source?.isNotEmpty == true ? item.source! : 'Новость',
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            if (item.description != null && item.description!.isNotEmpty)
              Text(
                item.description!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.textTheme.bodyMedium?.color?.withOpacity(0.8),
                ),
              ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final url = item.url;
                  if (url.isEmpty) return;
                  if (!await launchUrlString(url)) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Не удалось открыть ссылку'),
                        ),
                      );
                    }
                  }
                },
                child: const Text('Открыть полную статью'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

