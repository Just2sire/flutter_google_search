import 'package:flutter/material.dart';
import 'package:google_search_app/utils/colors.dart';

class SearchFooter extends StatelessWidget {
  const SearchFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          color: footerColor,
          padding: EdgeInsets.symmetric(
            horizontal: 150,
            vertical: 15,
          ),
          child: Row(
            children: [
              Text(
                "Togo",
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 20,
                width: 0.5,
                color: Colors.blue,
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(Icons.circle, color: Color(0xFF70757A),size: 12,),
              const SizedBox(width: 10,),
              const Text("200023, Munbai", style: TextStyle(
                fontSize: 14,
                color: primaryColor,
              ),),
            ],
          ),
        ),
        const Divider(
          thickness: 0, height: 9,color: Colors.black26,
        ),
        Container(
          color: footerColor,
          padding: const EdgeInsets.symmetric(horizontal: 50,),
          child: Row(
            children: [
              Text(
                "Help",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 20,),
              Text(
                "Send FeedBack",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 20,),
              Text(
                "Privacy",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 20,),
              Text(
                "Terms",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
