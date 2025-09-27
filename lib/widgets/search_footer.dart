import 'package:flutter/material.dart';
import 'package:google_clone/responsive/colors.dart';

class SearchFooter extends StatelessWidget {
  const SearchFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          color: footerColor,
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: size.width > 768 ? 150 : 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'India',
                style: TextStyle(color: Colors.black54, fontSize: 15),
              ),
              Row(
                children: [
                  const Text(
                    'Help',
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Send feedback',
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Privacy',
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Terms',
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Settings',
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  const SizedBox(width: 10),
                  Container(height: 20, width: 20, color: Colors.blue),
                  const SizedBox(width: 10),
                  const Icon(Icons.circle, size: 12, color: Color(0xFF70757A)),
                  const SizedBox(width: 10),
                  const Text(
                    '140413, Punjab',
                    style: TextStyle(color: primaryColor, fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(thickness: 0, height: 9, color: Colors.black26),
        Container(
          color: footerColor,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              Text(
                'Help',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              const SizedBox(width: 20,),
              Text(
                'Send feedback',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              const SizedBox(width: 20,),
              Text(
                'Privacy',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              const SizedBox(width: 20,),
              Text(
                'Terms',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            const SizedBox(width: 20,),
              Text(
                'Settings',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ],
          ),
        )
      ],
    );
  }
}
