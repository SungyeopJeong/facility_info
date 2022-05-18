import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
        color: Colors.white,
        height: 56,
        padding:
            const EdgeInsets.only(top: 10, left: 16, bottom: 10, right: 16),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: width - 32,
            padding: const EdgeInsets.only(left: 18),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xffC4C4C4), width: 1)),
            child: const Align(
              alignment: Alignment(-1.0, 0),
              child: ImageIcon(
                AssetImage('assets/image/search_24.png'),
              ),
            ),
          ),
        ));
  }
}
