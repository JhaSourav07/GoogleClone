import 'package:flutter/material.dart';
import 'package:google_clone/responsive/colors.dart';

class SearchButton extends StatelessWidget {
  final String title;
  final Function onTap;

  final dynamic text;
  const SearchButton({Key? key, required this.text, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(4)
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 18,
      ),
      color: searchColor,
      child: Text(
          title,
      ),
      onPressed: () {},
    );
  }
}