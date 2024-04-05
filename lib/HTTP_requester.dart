// ignore: camel_case_types
class HTTP_requester {
  HTTP_requester._origin();

  static final Map<String, String> _russianToEnglishTranslations = {
    'еж': 'hedgehog',
    'привет мир': 'hello world',
  };

  static final Map<String, String> _englishToRussianTranslations = {'hedgehog': 'еж', 'hello world': 'привет мир'};

  static String getTranslation(String text, bool _translateToEnglish) {
    return (_translateToEnglish ? _russianToEnglishTranslations[text] : _englishToRussianTranslations[text]) ?? 'lol';
  }

  static final Map<String, List<String>> _examples = {
    'привет мир': [
      'Пример программы "привет мир" на языке Java',
      'Запустите компьютер и написать функцию "Привет Мир".',
      'Это поможет вам продвинуться от ваших начальных "привет мир" к тому, чем вы действительно сможете потом гордиться.',
      'Теперь давайте запустим! в настоящее время, Наша программа не будет делать ничего, кроме открытой, сказать "привет мир" и закрытие.',
      'Входными данными может быть любой набор символов от простого «привет мир» до сонета Шекспира.',
    ],
    'hello world' : [
      'The usefulness of the "Hello World" programs shown in the previous chapter is rather questionable.',
      'When we wrote the first Hello World program and fired it up, it was extremely exciting.',
      'This will write "hello world" on the display.',
      'All of this happens behind the scenes and as a user, all you will see are the words "hello world".',
      'Forums: "Hello world" is not deleted.',
    ],
    'hedgehog' : [
      'Why hedgehog, we still do not know, but the unfortunate animal was offended.',
      'Among the protected mammals listed are hedgehog, pine-martens, bats.',
      'I think that was a real hedgehog.',
      'Not a hedgehog or a squirrel, the king-father walks.',
      'But intellectually Soros is more like a narrow-minded hedgehog.',
    ],
    'еж' : [
      'Почти месяц еж жил роскошной жизнью в квартире женщины.',
      'Старающийся спрятаться от вас еж снится к возникновению необходимости быть предельно осторожными и терпеливыми.',
      'Считается, что еж мало изменился за этот период времени.',
      'На каждом уровне, Алиса должна забить синий еж в норе.',
      'Синий еж Соник вызвал одобрение у общества.',
    ]
  };

  // pattern null self handling
  static List<String> getExamplesFor(String text) => _examples[text] ?? [];

  static getVoicingPath(String word) => 'lib/pronunciations/$word.mp3';
}
