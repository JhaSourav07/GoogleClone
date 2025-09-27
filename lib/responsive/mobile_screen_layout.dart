import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_clone/responsive/colors.dart';

import '../widgets/mobile/mobile_footer.dart';
import '../widgets/search.dart';
import '../widgets/translation_buttons.dart';
import '../widgets/web/search_buttons.dart';
import '../widgets/web/web_footer.dart';

class MobileScreenLayout extends StatelessWidget {
  // final Widget mobileScreenLayout;

  const MobileScreenLayout({
    Key? key,
    // required this.mobileScreenLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: primaryColor),
          onPressed: () {},
        ),
        title: SizedBox(
          width: size.width * 0.4,
          child: const DefaultTabController(
            length: 2,
            child: TabBar(
              labelColor: blueColor,
              unselectedLabelColor: Colors.grey,
              indicatorColor: blueColor,
              tabs: [
                Tab(
                  child: Text('All',),
                ),
                Tab(
                  child: Text('Images', ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/images/more-apps.svg',
              color: primaryColor,
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ).copyWith(right: 10),
            child: MaterialButton(
              onPressed: () {},
              child: const Text(
                'Sign In',
                style: TextStyle(color: Colors.black),
              ),
              color: const Color(0xffa6c9e1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.25),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Search(),
                      SizedBox(height: 20),
                      // SearchButton(text: 'nulttontitle', title: '', onTap: () {}),
                      SearchButtons(),
                      SizedBox(height: 20),
                      TranslationButtons(),
                    ],
                  ),
                  const MobileFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
