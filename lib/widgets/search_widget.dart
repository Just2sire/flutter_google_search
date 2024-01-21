import 'package:flutter/material.dart';
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
            width: size.width * 0.18,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: size.width * width,
          child: TextFormField(
            cursorColor: Colors.black,
            cursorWidth: 1,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: primaryColor,
              hintText:
                  "Effectuez une recherche sur Google ou saisissez une URL",
              hintStyle: TextStyle(
                color: Colors.black45,
              ),
              contentPadding: EdgeInsets.all(5),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(
                  right: 8.0,
                  left: 5,
                ),
                child: Icon(
                  Icons.search,
                  color: searchBorder,
                ),
              ),
              // prefixIcon: Padding(
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: 8.0,
              //   ),
              //   child: SvgPicture.asset(
              //     "assets/images/search-icon.svg",
              //     color: searchColor,
              //     width: 1,
              //     height: 1,
              //   ),
              // ),
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
              // suffixIcon: Padding(
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: 8.0,
              //   ),
              //   child: SvgPicture.asset(
              //     "assets/images/lens-icon.svg",
              //     width: 1,
              //     height: 1,
              //   ),
              // ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(32),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
        )
      ],
    );
  }
}
