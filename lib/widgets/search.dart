import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone/responsive/colors.dart';
import 'package:google_clone/screens/search_screen.dart';


class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            'assets/images/google-logo.png',
             height: size.height *.12,
          ),
        ),
        const SizedBox(height: 20,),
        SizedBox(
          width: size.width > 768 ? size.width * 0.4: size.width * 0.9,
          child: TextFormField(
            onFieldSubmitted: (query) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchScreen(
                    // You can pass the query to the SearchResults page if needed
                    start: '0',
                    searchQuery: query,
                  ),
                ),
              );
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(30) ),
                borderSide: const BorderSide(color: searchBorder),

              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/images/search-icon.svg',
                  color: searchBorder,
                  width:1,
                  height:1,
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                    'assets/images/mic-icon.svg'
                ),
              ),
          ),

          ),
        ),

      ],
    );
  }
}