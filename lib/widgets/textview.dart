import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextRegular extends StatelessWidget {
  final double textSize;
  final String text;
  final Color textColor;
  final TextOverflow overflow;

  TextRegular(
      {@required this.text, this.textSize, this.textColor, this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow != null ? overflow : TextOverflow.visible,
      style: TextStyle(
        color: textColor != null ? textColor : Colors.black,
        fontSize: textSize != null ? textSize : 12.0,
        fontFamily: 'Roboto-Regular',
      ),
    );
  }
}

class TextMedium extends StatelessWidget {
  final double textSize;
  final String text;
  final Color textColor;
  final TextOverflow overflow;

  TextMedium(
      {@required this.text, this.textSize, this.textColor, this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow != null ? overflow : TextOverflow.visible,
      style: TextStyle(
          color: textColor != null ? textColor : Colors.black,
          fontSize: textSize != null ? textSize : 12.0,
          fontFamily: 'Roboto-Medium'),
    );
  }
}

class TextBold extends StatelessWidget {
  final double textSize;
  final String text;
  final Color textColor;
  final TextOverflow overflow;

  TextBold({@required this.text, this.textSize, this.textColor, this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow != null ? overflow : TextOverflow.visible,
      style: TextStyle(
          color: textColor != null ? textColor : Colors.black,
          fontSize: textSize != null ? textSize : 12.0,
          fontFamily: 'Roboto-Bold'),
    );
  }
}

class TextItalic extends StatelessWidget {
  final double textSize;
  final String text;
  final Color textColor;
  final TextOverflow overflow;

  TextItalic({@required this.text, this.textSize, this.textColor, this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow != null ? overflow : TextOverflow.visible,
      style: TextStyle(
          color: textColor != null ? textColor : Colors.black,
          fontSize: textSize != null ? textSize : 12.0,
          fontFamily: 'Roboto-Italic'),
    );
  }
}

class TextThin extends StatelessWidget {
  final double textSize;
  final String text;
  final Color textColor;
  final TextOverflow overflow;

  TextThin({@required this.text, this.textSize, this.textColor, this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow != null ? overflow : TextOverflow.visible,
      style: TextStyle(
          color: textColor != null ? textColor : Colors.black,
          fontSize: textSize != null ? textSize : 12.0,
          fontFamily: 'Roboto-Thin'),
    );
  }
}
