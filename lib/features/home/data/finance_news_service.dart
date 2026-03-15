import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FinanceNewsItem {
  const FinanceNewsItem({
    required this.title,
    required this.url,
    this.description,
    this.source,
  });

  final String title;
  final String url;
  final String? description;
  final String? source;

  factory FinanceNewsItem.fromJson(Map<String, dynamic> json) {
    final rawSource = json['source'];
    String? source;
    if (rawSource is String) {
      source = rawSource;
    } else if (rawSource is Map<String, dynamic>) {
      source = rawSource['name'] as String?;
    }

    return FinanceNewsItem(
      title: (json['title'] as String?)?.trim() ?? '',
      description: ((json['description'] ?? json['snippet']) as String?)
          ?.trim(),
      url: (json['url'] as String?) ?? (json['link'] as String?) ?? '',
      source: source,
    );
  }
}

class FinanceNewsService {
  FinanceNewsService({Dio? dio}) : _dio = dio ?? Dio();

  final Dio _dio;

  static const List<FinanceNewsItem> _fallbackNews = [
    FinanceNewsItem(
      title: 'Как начать откладывать хотя бы 10% дохода уже в этом месяце',
      url: 'https://example.com/saving-10-percent',
      description:
          'Простой чек‑лист, который поможет начать копить без сложных таблиц и жёстких ограничений.',
      source: 'Money Tracker советы',
    ),
    FinanceNewsItem(
      title: '3 ошибки, из‑за которых бюджет разваливается к середине месяца',
      url: 'https://example.com/budget-mistakes',
      description:
          'Разбираем типичные ошибки с подписками, спонтанными покупками и “мелочами”, которые съедают зарплату.',
      source: 'Money Tracker разбор',
    ),
    FinanceNewsItem(
      title: 'Во что вложить первые 100 000 ₸, если вы никогда не инвестировали',
      url: 'https://example.com/first-investments',
      description:
          'Разбираем консервативные варианты, уровень риска и базовые правила начинающего инвестора.',
      source: 'Money Tracker гайд',
    ),
  ];

  Future<List<FinanceNewsItem>> fetchTopFinanceNews() async {
    final apiKey = dotenv.env['NEWS_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      return _fallbackNews;
    }

    try {
      final response = await _dio.get<Map<String, dynamic>>(
        'https://serpapi.com/search.json',
        queryParameters: <String, dynamic>{
          'engine': 'google',
          'q': 'финансы инвестиции деньги',
          'tbm': 'nws',
          'hl': 'ru',
          'api_key': apiKey,
          'num': 10,
        },
      );

      final data = response.data;
      if (data == null) {
        return _fallbackNews;
      }

      final results = data['news_results'];
      if (results is! List) {
        return _fallbackNews;
      }

      final parsed = results
          .whereType<Map<String, dynamic>>()
          .map(FinanceNewsItem.fromJson)
          .where((item) => item.title.isNotEmpty && item.url.isNotEmpty)
          .toList();

      if (parsed.isEmpty) {
        return _fallbackNews;
      }

      return parsed;
    } on DioException {
      return _fallbackNews;
    } catch (_) {
      return _fallbackNews;
    }
  }
}


