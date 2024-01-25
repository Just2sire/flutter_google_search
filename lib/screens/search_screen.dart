import 'package:flutter/material.dart';
import 'package:google_search_app/services/api_service.dart';
import 'package:google_search_app/utils/colors.dart';
import 'package:google_search_app/widgets/search_footer.dart';
import 'package:google_search_app/widgets/search_header.dart';
import 'package:google_search_app/widgets/search_tabs.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Web Header
            const SearchHeader(),
            // tabs for news images etc
            const Padding(
              padding: EdgeInsets.only(
                left: 150,
              ),
              child: SearchTabs(),
            ),
            const Divider(
              height: 0,
              thickness: 0.3,
            ),
            // search results
            FutureBuilder(
                future: ApiService().fetchData(queryTerm: "queryTerm"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: 150,
                          top: 12,
                        ),
                        child: Text(
                          "About ${snapshot.data?['searchInformation']['formattedTotalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)",
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF70757a),
                          ),
                        ),
                      )
                    ],
                  );
                }),
            // pagination buttons
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "< Previous",
                      style: TextStyle(
                        fontSize: 15,
                        color: blueColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Next >",
                      style: TextStyle(
                        fontSize: 15,
                        color: blueColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const SearchFooter(),
          ],
        ),
      ),
    );
  }
}
