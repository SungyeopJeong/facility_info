import 'package:flutter/material.dart';
import 'MyNavBar.dart';
import 'Search.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: InfoBody(height: height - statusBarHeight - 56, width: width),
      ),
      bottomNavigationBar:
          MyNavBar(height: height, width: width, activeIndex: 0),
    );
  }
}

class InfoBody extends StatefulWidget {
  final double height;
  final double width;
  const InfoBody({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  State<InfoBody> createState() => _InfoBodyState();
}

class _InfoBodyState extends State<InfoBody> {
  @override
  Widget build(BuildContext context) {
    final double listHeight = widget.height - 56;
    return Column(
      children: [
        const SearchBar(),
        Container(
          color: Colors.black,
          height: listHeight,
        )
      ],
    );
  }
}
