import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

// import '../models/language.dart';
// import '../components/language-list-element.dart';

class HTTP_requester {

  

  static String getTranslation(String text) {
    return 'translation: $text';
  }


  static getPronunciation() => Object();

  static getExamplesFor(text) => [
        'first example: $text',
        'sexond example: $text',
        'third example: $text',
        'fourth example: $text',
      ];
}
