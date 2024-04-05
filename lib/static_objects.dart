import 'package:flutter/material.dart';

class StaticObjects {
  
  StaticObjects._origin();

  static final List<String> statesOfButton = ["Вкл.", "Выкл."];

  static final ButtonStyle usualButtonStyle = ElevatedButton.styleFrom(
    textStyle: TextStyle(
      fontSize: 20,
    ),
    foregroundColor: Color.fromARGB(255, 31, 38, 137),
    backgroundColor: Colors.amber,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static final OutlineInputBorder borderForOutputField = OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromARGB(255, 63, 72, 204),
      width: 3.0,
    ),
    borderRadius: BorderRadius.circular(8),
  );

  static final TextStyle inputAndOutputTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 18,
  );

  static final EdgeInsets paddingForExamples =
      EdgeInsets.only(left: 10, right: 10);

  static Divider dividerForExamples = Divider(
    color: Color.fromARGB(255, 63, 72, 204),
    thickness: 3.0,
  );

  static OutlineInputBorder bordersForTextFieldForInput = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.amber,
      width: 3.0,
    ),
    borderRadius: BorderRadius.circular(8),
  );

  static ButtonStyle styleOfEmptyButton = ElevatedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 6, 127, 64),
    foregroundColor: Color.fromARGB(255, 6, 127, 64),
    elevation: 0,
    disabledBackgroundColor: Color.fromARGB(255, 4, 80, 41),
  );

  static Icon iconWithVolumeUp = Icon(
    Icons.volume_up,
    size: 70.0,
    color: Colors.amber,
  );
}
