class TranslationResponse {
  String translatedText;

  TranslationResponse({required this.translatedText});

  factory TranslationResponse.fromJson(Map<String, dynamic> json) {
    return TranslationResponse(
      translatedText: json['data']['translations'][0]['translatedText'],
    );
  }
}