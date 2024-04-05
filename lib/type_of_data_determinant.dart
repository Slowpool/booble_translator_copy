class TypeOfDataDeterminant {
  TypeOfDataDeterminant._();

  static bool isWord(String text) {
    return text.split(' ').length == 1;
  }

  static bool isPhrase(String text) {
    int wordsAmount = text.split(' ').length;
    return wordsAmount <= 5;
  }
}