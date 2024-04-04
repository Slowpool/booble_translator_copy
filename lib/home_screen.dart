import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_booble_translator/static_objects.dart';
import 'package:test_booble_translator/language_to_language.dart';
import 'package:test_booble_translator/settings_screen.dart';
import 'package:test_booble_translator/type_of_data_determinant.dart';
import 'package:test_booble_translator/data_base.dart';
import 'package:test_booble_translator/HTTP_requester.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  static const ENGLISH_LANGUAGE_CAPTION = 'английский';
  static const RUSSIAN_LANGUAGE_CAPTION = 'русский';

  bool _wordsVoicingEnabled = true;
  bool _examplesOfUsingEnabled = true;

  bool get examplesAreUsed => _examplesOfUsingEnabled && listOfExamples.isNotEmpty;
  Widget exampleWithIndex(int index) {
    var exampleIsExist = listOfExamples.elementAtOrNull(index) != null;
    if (examplesAreUsed && exampleIsExist) {
      return Column(
        children: [
          Padding(
            padding: StaticObjects.paddingForExamples,
            child: Text(
              listOfExamples[index],
              style: StaticObjects.inputAndOutputTextStyle,
            ),
          ),
          StaticObjects.dividerForExamples,
        ],
      );
    } else {
      return SizedBox();
    }
  }

  bool translateToEnglish = false;
  Object? pronunciation;
  List<String> listOfExamples = [];

  final TextEditingController enteredTextController = TextEditingController();
  final TextEditingController translationTextController = TextEditingController();

  get enteredText => enteredTextController.text;

  set wordsVoicing(bool value) {
    setState(() {
      print('voicing: $value');
      _wordsVoicingEnabled = value;
    });
  }

  set examplesOfUsing(bool value) {
    setState(() {
      print('examples: $value');
      _examplesOfUsingEnabled = value;
    });
  }

  var _voicingButtonOnPressed = () {
    print('*here will be voicing*');
  };

  // @override
  // initState() {
  //   enteredTextController =
  // }

  Future<dynamic> copyrightViolationMessage() {
    enteredTextController.clear();
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: AlertDialog(
            insetPadding: EdgeInsets.symmetric(vertical: 200),
            title: Text("Попытка нарушения ГК РФ", style: StaticObjects.inputAndOutputTextStyle),
            content: Center(child: Text(
                // TODO remove the rofl
                "Вы попытались нарушить пункт 2.9 статьи 1270 ГК РФ «Исключительное право на произведение»: Использованием произведения независимо от того, совершаются ли соответствующие действия в целях извлечения прибыли или без такой цели, считается, в частности: перевод или другая переработка произведения. Дальнейший перевод не будет выполняться, а ваши данные об устройстве, включая местоположение, номер телефона, снилс и история передвижения, были отправлены в ближайшее отделение полиции. Удачного изучения английского языка!")),
            actions: [
              Center(
                child: ElevatedButton(
                  child: Text("Я больше не буду пытаться нарушить ГК РФ"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    enteredTextController.dispose();
    translationTextController.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // This method prevent the screen rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Booble translator',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 40, bottom: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // английский -> русский
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 160.0,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            translateToEnglish = !translateToEnglish;
                          });
                        },
                        style: StaticObjects.usualButtonStyle,
                        child: Text(translateToEnglish ? RUSSIAN_LANGUAGE_CAPTION : ENGLISH_LANGUAGE_CAPTION),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.amber,
                      size: 70,
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            translateToEnglish = !translateToEnglish;
                          });
                        },
                        style: StaticObjects.usualButtonStyle,
                        child: Text(translateToEnglish ? ENGLISH_LANGUAGE_CAPTION : RUSSIAN_LANGUAGE_CAPTION),
                      ),
                    ),
                  ],
                ),
                // Box for text input
                SizedBox(
                  height: 200,
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    maxLength: 5000,
                    cursorColor: Colors.black,
                    style: StaticObjects.inputAndOutputTextStyle,
                    controller: enteredTextController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 128, 198, 255),
                      enabledBorder: StaticObjects.bordersForTextFieldForInput,
                      focusedBorder: StaticObjects.bordersForTextFieldForInput,
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      counterStyle: StaticObjects.inputAndOutputTextStyle,
                      hintText: "Введите текст",
                    ),
                  ),
                ),
                // listen translate and settings
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Voicing button
                    ElevatedButton(
                      onPressed: _wordsVoicingEnabled && translateToEnglish ? _voicingButtonOnPressed : null,
                      style: StaticObjects.styleOfEmptyButton,
                      child: StaticObjects.iconWithVolumeUp,
                    ),
                    // Translate button
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        // TODO add handling of translation
                        onPressed: enteredText.isEmpty
                            ? () {
                                print('text was empty');
                              }
                            : (DatabaseWithCopyrightTexts.isCopyrightText(enteredText)
                                ? copyrightViolationMessage
                                : () {
                                    setState(() {
                                      translationTextController.text = HTTP_requester.getTranslation(enteredText);
                                      if (TypeOfDataDeterminant.isWord(enteredText)) {
                                        pronunciation = HTTP_requester.getPronunciation();
                                      }
                                      if (_examplesOfUsingEnabled && TypeOfDataDeterminant.isPhrase(enteredText)) {
                                        listOfExamples = HTTP_requester.getExamplesFor(enteredText);
                                      } else {
                                        listOfExamples.clear();
                                      }
                                    });
                                  }),
                        style: StaticObjects.usualButtonStyle,
                        child: Text('Перевести'),
                      ),
                    ),
                    // Settings button
                    ElevatedButton(
                      onPressed: () async {
                        var data = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => SettingsScreen.withData([_wordsVoicingEnabled, _examplesOfUsingEnabled]),
                          ),
                        );
                        wordsVoicing = data[0] as bool;
                        examplesOfUsing = data[1] as bool;
                      },
                      style: StaticObjects.styleOfEmptyButton,
                      child: Icon(
                        Icons.settings,
                        size: 70.0,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
                // translation with examples
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: [
                        TextField(
                          readOnly: true,
                          maxLines: null,
                          cursorColor: Colors.black,
                          controller: translationTextController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 112, 146, 190),
                            enabledBorder: StaticObjects.borderForOutputField,
                            focusedBorder: StaticObjects.borderForOutputField,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 40),
                          child: Card(
                            margin: EdgeInsets.only(top: 10),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Color.fromARGB(255, 63, 72, 204),
                                width: 3.0,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            // background color
                            color: Color.fromARGB(255, 127, 127, 127),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                exampleWithIndex(0),
                                exampleWithIndex(1),
                                exampleWithIndex(2),
                                exampleWithIndex(3),
                                exampleWithIndex(4),
                              ],
                            ),
                            // borderOnForeground: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 6, 127, 64),
        // backgroundColor: Color.fromARGB(255, 11, 90, 49),
      ),
      color: Colors.green,
    );
  }
}
