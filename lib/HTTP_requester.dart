// ignore: camel_case_types
class HTTP_requester {
  static final Map<String, String> russianToEnglishTranslations = {
    'Я': 'I',
    'еж': 'hedgehog',
    'привет мир': 'hello world',
  };

  static final Map<String, String> englishToRussianTranslations = {'I': 'Я', 'hedgehog': 'еж', 'hello world': 'привет мир'};

  static String getTranslation(String text, bool translateToEnglish) {
    return (translateToEnglish ? russianToEnglishTranslations[text] : englishToRussianTranslations[text]) ?? 'lol';
  }

  static getPronunciation() => Object();

  static getExamplesFor(text) => [
        'first example: $text',
        'sexond example: $text',
        'third example: $text',
        'fourth example: $text',
      ];
}
