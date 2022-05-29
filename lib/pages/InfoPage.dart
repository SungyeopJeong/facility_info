import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:facility_info/MyNavBar.dart';
import 'package:facility_info/Search.dart';
import 'package:facility_info/facility.dart';
import 'DetailPage.dart';
import 'KeyPadPage.dart';
import 'EditPage.dart';
import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  Widget buildButton(
      MaterialStateProperty<OutlinedBorder> shape,
      MaterialStateProperty<Size> size,
      String text,
      Color color,
      Function() onPressed) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: shape,
            fixedSize: size,
            splashFactory: NoSplash.splashFactory,
            backgroundColor: MaterialStateProperty.resolveWith(((states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color(0xffE5E5E5);
              } else {
                return Colors.white;
              }
            })),
            elevation: MaterialStateProperty.all(0)),
        child: Text(
          text,
          textAlign: TextAlign.left,
          textScaleFactor: 1.0,
          style: TextStyle(
              color: color,
              fontSize: 12,
              height: 1.0,
              fontFamily: 'Noto_Sans_KR'),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white));
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(top: statusBarHeight),
          child: Column(
            children: [
              const SearchBar(),
              Container(
                color: Colors.white,
                width: width,
                height: 30,
                padding: EdgeInsets.only(left: width - 60),
                child: Row(children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: IconButton(
                      onPressed: () async {
                        await Navigator.push(
                            context,
                            SlidePageRoute(
                                page: EditPage(
                              facility: Facility(
                                  facilityName: "",
                                  category: "식당",
                                  id: "",
                                  location: ""),
                            )));
                        setState(() {});
                      },
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.add_outlined,
                          color: Color(0xff666666)),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: IconButton(
                        onPressed: () {
                          showGeneralDialog(
                              context: context,
                              barrierDismissible: true,
                              barrierLabel: "",
                              pageBuilder: (BuildContext context,
                                  Animation animation,
                                  Animation secondaryAnimation) {
                                return Padding(
                                    padding: EdgeInsets.only(
                                        top: statusBarHeight + 48, right: 16),
                                    child: Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                            height: 92,
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Column(children: [
                                              buildButton(
                                                  MaterialStateProperty.all(
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .zero)),
                                                  MaterialStateProperty.all(
                                                      const Size(120, 36)),
                                                  "카테고리 편집",
                                                  Colors.black,
                                                  () {}),
                                              buildButton(
                                                  MaterialStateProperty.all(
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .zero)),
                                                  MaterialStateProperty.all(
                                                      const Size(120, 36)),
                                                  "초기화",
                                                  Colors.black, () {
                                                Navigator.pop(context);
                                                showGeneralDialog(
                                                    context: context,
                                                    barrierDismissible: true,
                                                    barrierLabel: "",
                                                    pageBuilder: (BuildContext
                                                            context,
                                                        Animation animation,
                                                        Animation
                                                            secondaryAnimation) {
                                                      return Material(
                                                        type: MaterialType
                                                            .transparency,
                                                        child: Center(
                                                          child: Container(
                                                            width: width / 2,
                                                            height: 100,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4)),
                                                            child: Column(
                                                                children: [
                                                                  Container(
                                                                    height: 60,
                                                                    decoration: const BoxDecoration(
                                                                        //color: Colors
                                                                        //    .yellow,
                                                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4))),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        "정말로 초기화하시겠습니까?",
                                                                        textAlign:
                                                                            TextAlign.left,
                                                                        textScaleFactor:
                                                                            1.0,
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                12,
                                                                            height:
                                                                                1.0,
                                                                            fontFamily:
                                                                                'Noto_Sans_KR'),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      buildButton(
                                                                          MaterialStateProperty.all(const RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(
                                                                                      4)))),
                                                                          MaterialStateProperty.all(Size(
                                                                              width /
                                                                                  4,
                                                                              40)),
                                                                          "취소",
                                                                          const Color(
                                                                              0xff0075E8),
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      }),
                                                                      buildButton(
                                                                          MaterialStateProperty.all(const RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.only(
                                                                                  bottomRight: Radius.circular(
                                                                                      4)))),
                                                                          MaterialStateProperty.all(Size(
                                                                              width /
                                                                                  4,
                                                                              40)),
                                                                          "초기화",
                                                                          const Color(
                                                                              0xffFD6059),
                                                                          () async {
                                                                        await DBHelper()
                                                                            .deleteAllFacility()
                                                                            .then((value) {
                                                                          Navigator.popUntil(
                                                                              context,
                                                                              (route) => route.isFirst);
                                                                          Navigator.pushReplacement(
                                                                              context,
                                                                              SlidePageRoute(page: const KeyPadPage()));
                                                                        });
                                                                      }),
                                                                    ],
                                                                  )
                                                                ]),
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              })
                                            ]))));
                              });
                        },
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.more_vert_outlined,
                            color: Color(0xff666666))),
                  ),
                  const SizedBox(
                    width: 6,
                  )
                ]),
              ),
              InfoList(height: height - statusBarHeight - 56 - 30, width: width)
            ],
          )),
      bottomNavigationBar:
          MyNavBar(height: height, width: width, activeIndex: 0),
    );
  }
}

class InfoList extends StatefulWidget {
  final double height;
  final double width;
  const InfoList({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  State<InfoList> createState() => _InfoListState();
}

class _InfoListState extends State<InfoList> {
  Widget tileWaiting() {
    return Container(
      color: Colors.white,
      width: widget.width,
      height: 30,
      child: const Center(
          child: Text(
        "loading",
        textScaleFactor: 1.0,
        style: TextStyle(
            fontSize: 12,
            color: Color(0xffC4C4C4),
            height: 1.0,
            fontFamily: 'Noto_Sans_KR'),
      )),
    );
  }

  Widget tileBuilder(List<Facility> facilityList) {
    return ConfigurableExpansionTile(
      header: SizedBox(
          width: widget.width - 60,
          height: 30,
          child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: widget.width / 2,
                height: 20,
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    facilityList[0].category,
                    textScaleFactor: 1.0,
                    style: const TextStyle(
                        color: Color(0xff666666),
                        fontSize: 12,
                        height: 1.0,
                        fontFamily: 'Noto_Sans_KR'),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ))),
      animatedWidgetFollowingHeader: const SizedBox(
          width: 60,
          child: Icon(
            Icons.expand_more_outlined,
            color: Color(0xff666666),
          )),
      headerBackgroundColorStart: Colors.white,
      headerBackgroundColorEnd: Colors.white,
      bottomBorderOn: false,
      borderColorStart: const Color(0xffC4C4C4),
      borderColorEnd: const Color(0xffC4C4C4),
      children: [
        for (int index = 0; index < facilityList.length; index++)
          GestureDetector(
            onTap: () async {
              await Navigator.push(
                  context,
                  SlidePageRoute(
                      page: DetailPage(
                    id: facilityList[index].id,
                  )));
              setState(() {});
            },
            child: Container(
              color: Colors.white,
              width: widget.width,
              height: 60,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: widget.width / 2,
                  padding: const EdgeInsets.only(left: 30),
                  child: SizedBox(
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: widget.width / 2 - 30,
                          height: 20,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              facilityList[index].facilityName,
                              textScaleFactor: 1.0,
                              style: const TextStyle(
                                  fontSize: 14,
                                  height: 1.0,
                                  fontFamily: 'Noto_Sans_KR'),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: widget.width / 2 - 30,
                          height: 20,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              ([
                                null,
                                ""
                              ].contains(facilityList[index].operatingTime)
                                  ? "운영시간 정보가 없습니다."
                                  : facilityList[index].operatingTime!),
                              textScaleFactor: 1.0,
                              style: const TextStyle(
                                  color: Color(0xff989898),
                                  fontSize: 10,
                                  height: 1.0,
                                  fontFamily: 'Noto_Sans_KR'),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
      ],
    );
  }

  Widget tileFromSqlite(String categoryIndex) {
    DBHelper dbHelper = DBHelper();
    return FutureBuilder<List<Facility>>(
        future: dbHelper.getCategoryFacility(categoryIndex),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return tileWaiting();
          }
          List<Facility>? facilityList = snapshot.data;
          if (facilityList!.isNotEmpty) {
            return tileBuilder(facilityList);
          } else {
            return tileWaiting();
          }
        });
  }

  Widget tileList(double listheight) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 11,
            itemBuilder: ((context, index) {
              String categoryIndex = 'category' +
                  ((index + 1) < 10
                      ? '0' + (index + 1).toString()
                      : (index + 1).toString());
              return tileFromSqlite(categoryIndex);
            })),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double listheight = widget.height - 56;
    return tileList(listheight);
  }
}
