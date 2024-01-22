import 'package:flutter/material.dart';
import 'package:google_search_app/utils/colors.dart';
import 'package:svg_flutter/svg.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(
        top: 25,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 28,
              right: 15,
              top: 4,
            ),
            child: Image.asset(
              "assets/images/google-logo.png",
              height: 30,
              width: 92,
            ),
          ),
          const SizedBox(
            width: 27,
          ),
          Container(
            width: size.width * 0.45,
            height: 44,
            decoration: BoxDecoration(
              color: searchColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: searchColor,
              ),
            ),
            child: TextFormField(
              style: const TextStyle(
                fontSize: 16,
              ),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset("assets/images/mic-icon.svg", height: 20, width: 20,),
                      const SizedBox(width: 5,),
                    ],
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
