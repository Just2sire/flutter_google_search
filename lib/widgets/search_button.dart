import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final String title;
  const SearchButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return MaterialButton(
      onPressed: () {},
      hoverColor: Colors.white10,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          side: BorderSide(
            color: Colors.white,
            width: 0.3,
            strokeAlign: 0.3,
          )),
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 18,
      ),
      child: Text(
        title,
        style: const TextStyle(),
      ),
    );
  }
}
