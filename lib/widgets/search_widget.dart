import 'package:flutter/material.dart';
import 'package:google_search_app/screens/search_screen.dart';
import 'package:google_search_app/utils/colors.dart';
import 'package:svg_flutter/svg.dart';

class SearchWidget extends StatelessWidget {
  final double width;
  const SearchWidget({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            "assets/images/google-logo.png",
            width: size.width <= 769 ? size.width * 0.6 : size.width * 0.18,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: size.width * width,
          child: TextFormField(
            // cursorColor: Colors.black,
            cursorWidth: 1,
            onFieldSubmitted: (query) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchScreen(
                      searchQuery: query,
                      start: '0',
                    );
                  },
                ),
              );
            },
            // style: const TextStyle(
            //   color: Colors.black,
            // ),
            decoration: InputDecoration(
              filled: true,
              fillColor: backgroundColor,
              hintText:
                  "Effectuez une recherche sur Google ou saisissez une URL",
              // hintStyle: const TextStyle(
              //   color: Colors.black45,
              // ),
              contentPadding: const EdgeInsets.all(5),
              prefixIcon: const Padding(
                padding: EdgeInsets.only(
                  right: 8.0,
                  left: 5,
                ),
                child: Icon(
                  Icons.search,
                  color: searchBorder,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: SvgPicture.asset(
                  "assets/images/mic-icon.svg",
                  width: 1,
                  height: 1,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: blueColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: blueColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
