import 'package:flutter/material.dart';
import 'package:test_booble_translator/static_objects.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key}) : super();

  var data;
  SettingsScreen.withData(this.data);

  @override
  _SettingsScreen createState() => _SettingsScreen(data);
}

class _SettingsScreen extends State<SettingsScreen> {
  // TODO these fields must be in HomeScreen widget

  var _wordsVoicing;
  var _examplesOfUsing;
  _SettingsScreen(data) {
    _wordsVoicing = data[0];
    _examplesOfUsing = data[1];
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Color.fromARGB(255, 6, 127, 64),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.amber,
              size: 50,
            ),
            onPressed: () {
              Navigator.pop(context, [_wordsVoicing, _examplesOfUsing]);
            },
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StaticObjects.iconWithVolumeUp,
                    Text(
                      "Озвучка слов",
                      style: TextStyle(fontSize: 27),
                    ),
                    Checkbox(
                      value: _wordsVoicing,
                      onChanged: (bool? value) {
                        setState(
                          () {
                            _wordsVoicing = value ?? false;
                          },
                        );
                      },
                    ),
                    // TODO cut from release version
                    // ElevatedButton(
                    //   style: StaticObjects.usualButtonStyle,
                    //   onPressed: () {
                    //     // TODO implement onPressed event
                    //   },
                    //   child: Text(StaticObjects.statesOfButton[0]),
                    // ),
                  ],
                ),
                Text(
                  "При отключении данного параметра при переводе текста вы не будете получать его озвучку, что может ускорить время перевода на 33%.",
                  style: StaticObjects.inputAndOutputTextStyle,
                ),
                StaticObjects.dividerForExamples,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.list,
                      color: Colors.amber,
                      size: 70,
                    ),
                    Text(
                      softWrap: true,
                      "Примеры",
                      style: TextStyle(fontSize: 27),
                    ),
                    Checkbox(
                      value: _examplesOfUsing,
                      onChanged: (bool? value) {
                        setState(
                          () {
                            _examplesOfUsing = value ?? false;
                          },
                        );
                      },
                    ),
                    // TODO cut from release version
                    // ElevatedButton(
                    //   style: StaticObjects.usualButtonStyle,
                    //   onPressed: () {
                    //     // TODO implement onPressed event
                    //   },
                    //   child: Text(StaticObjects.statesOfButton[0]),
                    // ),
                  ],
                ),
                Text(
                  "При отключении данного параметра при переводе текста вы не будете получать примеры его использования в контексте, что может ускорить время перевода на 33%.",
                  style: StaticObjects.inputAndOutputTextStyle,
                ),
              ],
            ),
          ),
        ),
        // backgroundColor: Color.fromARGB(255, 195, 195, 195),
        backgroundColor: Color.fromARGB(255, 112, 146, 190),
      ),
    );
  }
}
