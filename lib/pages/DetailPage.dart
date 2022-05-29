import 'package:facility_info/facility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:facility_info/MyNavBar.dart';
import 'EditPage.dart';
import 'InfoPage.dart';

class DetailPage extends StatefulWidget {
  final String id;
  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Widget detailBar(
      String title, String detail, double width, String placeholder) {
    return Container(
        width: width,
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        child: Column(children: [
          (title != "연락처")
              ? Container(
                  //color: Colors.green,
                  width: width - 40,
                  height: 36,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      textAlign: TextAlign.left,
                      textScaleFactor: 1.0,
                      style: const TextStyle(
                          color: Color(0xff666666),
                          fontSize: 12,
                          height: 1.0,
                          fontFamily: 'Noto_Sans_KR'),
                    ),
                  ),
                )
              : Container(
                  //color: Colors.green,
                  width: width - 40,
                  height: 36,
                  child: Row(children: [
                    SizedBox(
                      height: 36,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          title,
                          textAlign: TextAlign.left,
                          textScaleFactor: 1.0,
                          style: const TextStyle(
                              color: Color(0xff666666),
                              fontSize: 12,
                              height: 1.0,
                              fontFamily: 'Noto_Sans_KR'),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: detail));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          elevation: 0,
                          duration: Duration(milliseconds: 1000),
                          content: Text(
                            'Copied to Clipboard',
                            textScaleFactor: 1.0,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Noto_Sans_KR'),
                          ),
                          backgroundColor: Color(0xffE5E5E5),
                        ));
                      },
                      child: Container(
                        color: Colors.white,
                        width: 36,
                        height: 36,
                        child: const Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              child: Icon(
                                Icons.content_copy_outlined,
                                size: 12,
                                color: Color(0xff666666),
                              ),
                            )),
                      ),
                    ),
                  ])),
          Container(
            //color: Colors.red,
            width: width - 40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                placeholder == "" ? detail : placeholder,
                textAlign: TextAlign.left,
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: placeholder != ""
                      ? const Color(0xff989898)
                      : Colors.black,
                  fontSize: 14,
                  height: 24 / 14,
                  fontFamily: 'Noto_Sans_KR',
                ),
              ),
            ),
          ),
        ]));
  }

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
    DBHelper dbHelper = DBHelper();
    return FutureBuilder<Facility>(
      future: dbHelper.getFacility(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              color: Colors.white,
              width: width,
              height: height - statusBarHeight - 56,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [CircularProgressIndicator()]));
        }
        Facility? facility = snapshot.data;
        return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: Padding(
                padding: EdgeInsets.only(top: statusBarHeight),
                child: Container(
                    color: Colors.white,
                    height: 56,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            color: Colors.white,
                            width: 40,
                            height: 40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Icon(Icons.arrow_back_ios_outlined),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: width - 136),
                        GestureDetector(
                          onTap: () async {
                            final result = await Navigator.push(
                                context,
                                SlidePageRoute(
                                    page: EditPage(facility: facility!)));
                            setState(() {});
                            if (result == "Saved") {
                              Future.delayed(const Duration(milliseconds: 500))
                                  .then((_) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  elevation: 0,
                                  duration: Duration(milliseconds: 1000),
                                  content: Text(
                                    'Saved',
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'Noto_Sans_KR'),
                                  ),
                                  backgroundColor: Color(0xffE5E5E5),
                                ));
                              });
                            }
                          },
                          child: Container(
                            color: Colors.white,
                            width: 40,
                            height: 40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Icon(Icons.edit_outlined),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
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
                                                    "공유",
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
                                                    "삭제",
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
                                                                      height:
                                                                          60,
                                                                      decoration: const BoxDecoration(
                                                                          //color: Colors
                                                                          //    .yellow,
                                                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4))),
                                                                      child:
                                                                          const Center(
                                                                        child:
                                                                            Text(
                                                                          "정말로 삭제하시겠습니까?",
                                                                          textAlign:
                                                                              TextAlign.left,
                                                                          textScaleFactor:
                                                                              1.0,
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 12,
                                                                              height: 1.0,
                                                                              fontFamily: 'Noto_Sans_KR'),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        buildButton(
                                                                            MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4)))),
                                                                            MaterialStateProperty.all(Size(width / 4, 40)),
                                                                            "취소",
                                                                            const Color(0xff0075E8), () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        }),
                                                                        buildButton(
                                                                            MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(4)))),
                                                                            MaterialStateProperty.all(Size(width / 4, 40)),
                                                                            "삭제",
                                                                            const Color(0xffFD6059), () async {
                                                                          await dbHelper
                                                                              .deleteFacility(facility!.id)
                                                                              .then((value) {
                                                                            Navigator.popUntil(context,
                                                                                (route) => route.isFirst);
                                                                            Navigator.push(context,
                                                                                SlidePageRoute(page: const InfoPage()));
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
                          child: Container(
                            color: Colors.white,
                            width: 40,
                            height: 40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Icon(Icons.more_vert_outlined),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ),
            body: Container(
              color: Colors.white,
              height: height - statusBarHeight - 56,
              child: SingleChildScrollView(
                  child: SizedBox(
                width: width,
                child: Column(children: [
                  Container(
                    width: width,
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      facility!.facilityName,
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.0,
                      style: const TextStyle(
                        fontSize: 20,
                        height: 1.0,
                        fontFamily: 'Noto_Sans_KR',
                      ),
                    ),
                  ),
                  Container(
                    color: const Color(0xffE5E5E5),
                    width: width,
                    height: 2,
                  ),
                  detailBar("카테고리", facility.category, width, ""),
                  detailBar(
                      "운영시간",
                      facility.operatingTime ?? "",
                      width,
                      [null, ""].contains(facility.operatingTime)
                          ? "운영시간 정보가 없습니다."
                          : ""),
                  detailBar(
                      "연락처",
                      facility.contactNumber ?? "",
                      width,
                      [null, ""].contains(facility.contactNumber)
                          ? "연락처 정보가 없습니다."
                          : ""),
                  detailBar("위치", facility.location, width, ""),
                  detailBar(
                      "추가 정보",
                      facility.extraInfo ?? "",
                      width,
                      [null, ""].contains(facility.extraInfo)
                          ? "추가 정보가 없습니다."
                          : "")
                ]),
              )),
            ));
      },
    );
  }
}
