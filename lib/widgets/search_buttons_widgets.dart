import 'package:flutter/material.dart';
import 'package:google_search_app/widgets/search_button.dart';

class SearchButtons extends StatelessWidget {
  const SearchButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SearchButton(title: "Google Search",),
            SizedBox(width: 20,),
            SearchButton(title: "I'm feeling lucky",),
          ],
        )
      ],
    );
  }
}