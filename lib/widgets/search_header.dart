import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_clone/responsive/colors.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'assets/images/google-logo.png',
              height: 30,
              width: 92,
            ),
          ),
          const SizedBox(width: 27),
          Container(
            width: size.width * .45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: searchColor),
            ),
            child: TextFormField(
              style: const TextStyle(fontSize: 16),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 150),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/images/mic-icon.svg',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 20),
                        const Icon(Icons.search, color: blueColor),
                        SvgPicture.asset(
                          'assets/images/search-icon.svg',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(width: 15),
                      ],
                    ),

                  ),
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
