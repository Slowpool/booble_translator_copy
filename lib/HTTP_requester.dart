import 'package:http/http.dart' as http;

class HTTP_requester {

  

  // TODO implement get translation
  static String getTranslation(String text) {
    return 'translation: $text';
  }

  static getPronunciation() => Object();

  // static getExamplesFor(text) => [
  //       'first example: $text',
  //       'sexond example: $text',
  //       'third example: $text',
  //       'fourth example: $text',
  //     ];

  static getExamplesFor(text) {
    http.get();
  }
}
