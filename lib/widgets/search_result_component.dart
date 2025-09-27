import 'package:flutter/material.dart';
import 'package:google_clone/responsive/colors.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class SearchResultComponent extends StatefulWidget {
  final String link;
  final String text;
  final String linkToGo;
  final String desc;
  const SearchResultComponent({
    Key? key,
    required this.text,
    required this.linkToGo,
    required this.link,
    required this.desc,
  }) : super(key: key);

  @override
  State<SearchResultComponent> createState() => _SearchResultComponentState();
}

class _SearchResultComponentState extends State<SearchResultComponent> {
  bool _showUnderline = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // This Text widget was missing a title/text.
        // Assuming you want to display the link text here.
        Text(widget.link),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () async {
              if (await canLaunch(widget.linkToGo)) {
                await launch(widget.linkToGo);
              } else {
                throw 'Could not launch ${widget.linkToGo}';
              }
            },
            onHover: (hovering) {
              setState(() {
                _showUnderline = hovering;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.link,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF202124),
                  ),
                ),
                Text(
                  widget.text, // This was widget.text, assuming it's the title
                  style: TextStyle(
                    color: blueColor,
                    decoration: _showUnderline
                        ? TextDecoration.underline
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          widget.desc,
          style: const TextStyle(fontSize: 14, color: primaryColor),
        ),
      ],
    );
  }
}
