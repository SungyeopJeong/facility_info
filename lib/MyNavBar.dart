import 'package:flutter/material.dart';
import 'InfoPage.dart';
import 'KeyPadPage.dart';
import 'ForumPage.dart';

class SlidePageRoute extends PageRouteBuilder {
  final dynamic page;
  SlidePageRoute({this.page})
      : super(
            pageBuilder: (
              context,
              animation,
              secondaryAnimation,
            ) =>
                page,
            transitionDuration: const Duration(seconds: 0));
}

class MyNavBar extends StatefulWidget {
  final double height;
  final double width;
  final int activeIndex;

  const MyNavBar(
      {Key? key,
      required this.height,
      required this.width,
      required this.activeIndex})
      : super(key: key);

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 56,
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.push(context, SlidePageRoute(page: const InfoPage()));
              },
              child: buildNavBar("시설 정보", widget.activeIndex == 0, 1)),
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .popUntil((route) => route.isCurrent == route.isFirst);
                Navigator.pop(context);
                Navigator.push(
                    context, SlidePageRoute(page: const KeyPadPage()));
              },
              child: buildNavBar("키패드", widget.activeIndex == 1, 2)),
          GestureDetector(
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.push(
                    context, SlidePageRoute(page: const ForumPage()));
              },
              child: buildNavBar("수정 요청", widget.activeIndex == 2, 3))
        ],
      ),
    );
  }

  SizedBox buildNavBar(label, active, iconNumber) {
    return SizedBox(
      width: widget.width / 3,
      child: Center(
        child: Container(
          width: widget.width * 100 / 360,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                      color: active ? const Color(0xff0075E8) : Colors.white,
                      width: 2))),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 6,
              ),
              SizedBox(
                  width: 24,
                  height: 24,
                  child: iconNumber == 1
                      ? Icon(Icons.store_outlined,
                          color: active
                              ? const Color(0xff0075E8)
                              : const Color(0xffC4C4C4))
                      : (iconNumber == 2
                          ? ImageIcon(
                              const AssetImage("assets/image/keypad_24.png"),
                              color: active
                                  ? const Color(0xff0075E8)
                                  : const Color(0xffC4C4C4),
                            )
                          : Icon(Icons.forum_outlined,
                              color: active
                                  ? const Color(0xff0075E8)
                                  : const Color(0xffC4C4C4)))),
              Text(
                label,
                textScaleFactor: 1.0,
                style: TextStyle(
                    color: active
                        ? const Color(0xff0075E8)
                        : const Color(0xffC4C4C4),
                    fontSize: 10,
                    height: 1.2,
                    fontFamily: 'Noto_Sans_KR'),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
