import 'package:flutter/material.dart';
import 'package:google_search_app/widgets/langage_text.dart';

class TranslationButton extends StatelessWidget {
  const TranslationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      alignment: WrapAlignment.center,
      children: [
        Text('Google offered in:'),
        SizedBox(width: 5),
        LanguageText(title: 'Français'),
        SizedBox(width: 5),
        LanguageText(title: 'English'),
        SizedBox(width: 5),
        LanguageText(title: 'Ewe'),
        SizedBox(width: 5),
        LanguageText(title: 'Chinese'),
        SizedBox(width: 5),
        LanguageText(title: 'Mandarin'),
        SizedBox(width: 5),
        LanguageText(title: 'Kabyè'),
        SizedBox(width: 5),
        LanguageText(title: 'Wollof'),
        SizedBox(width: 5),
        LanguageText(title: 'Lingala'),
        SizedBox(width: 5),
        LanguageText(title: 'Español'),
      ],
    );
  }
}