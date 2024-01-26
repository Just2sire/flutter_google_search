import 'package:flutter/material.dart';
import 'package:google_search_app/services/api_service.dart';
import 'package:google_search_app/utils/colors.dart';
import 'package:google_search_app/widgets/search_footer.dart';
import 'package:google_search_app/widgets/search_header.dart';
import 'package:google_search_app/widgets/search_result_component.dart';
import 'package:google_search_app/widgets/search_tabs.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;
  const SearchScreen({
    super.key,
    required this.searchQuery,
    required this.start,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final navigate = Navigator.of(context);
    return Title(
      color: Colors.blue,
      title: searchQuery,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Web Header
                const SearchHeader(),
                // tabs for news images etc
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width <= 768 ? 10 : 150,
                  ),
                  child: const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SearchTabs(),
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 0.3,
                ),
                // search results
                FutureBuilder(
                  future: ApiService().fetchData(
                    queryTerm: searchQuery,
                    start: start,
                  ),
                  builder: (context, snapshot) {
                    // if (snapshot.connectionState == ConnectionState.waiting) {
                    //   return const Center(
                    //     child: CircularProgressIndicator(),
                    //   );
                    // }

                    if (snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  left: size.width <= 768 ? 10 : 150,
                                  top: 12,
                                ),
                                child: Text(
                                  "About ${snapshot.data?['searchInformation']['formattedTotalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF70757a),
                                  ),
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    snapshot.data?['items'].length as int,
                                itemBuilder: (context, index) {
                                  final itemData =
                                      snapshot.data?['items'][index] as Map;
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: size.width <= 768 ? 10 : 150,
                                          top: 10,
                                        ),
                                        child: SearchResultComponent(
                                          desc: itemData["snippet"],
                                          link: itemData["formattedUrl"],
                                          text: itemData["title"],
                                          linkToGo: itemData["link"],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    if (start != '0') {
                                      navigate.push(
                                        MaterialPageRoute(
                                          builder: (context) => SearchScreen(
                                            searchQuery: searchQuery,
                                            start: (int.parse(start) - 10)
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text(
                                    "< Prev",
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
                                  onPressed: () {
                                    navigate.push(
                                      MaterialPageRoute(
                                        builder: (context) => SearchScreen(
                                          searchQuery: searchQuery,
                                          start: (int.parse(start) + 10)
                                              .toString(),
                                        ),
                                      ),
                                    );
                                  },
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
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                // pagination buttons
              ],
            ),
          ),
        ),
      ),
    );
  }
}
