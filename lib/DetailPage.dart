import 'package:facility_info/facility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MyNavBar.dart';
import 'EditPage.dart';

class DetailPage extends StatefulWidget {
  final String facilityName;
  const DetailPage({Key? key, required this.facilityName}) : super(key: key);

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
                            style: TextStyle(color: Colors.black),
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

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white));
    DBHelper dbHelper = DBHelper();
    return FutureBuilder<Facility>(
      future: dbHelper.getFacility(widget.facilityName),
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
                        SizedBox(width: width - 128),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                SlidePageRoute(
                                    page: EditPage(facility: facility!)));
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
                          onTap: () {},
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
                          fontFamily: 'Noto_Sans_KR'),
                    ),
                  ),
                  Container(
                    color: const Color(0xffE5E5E5),
                    width: width,
                    height: 2,
                  ),
                  detailBar("카테고리", facility.category, width, ""),
                  detailBar("운영시간", facility.operatingTime ?? "", width,
                      facility.operatingTime == null ? "운영시간 정보가 없습니다." : ""),
                  detailBar("연락처", facility.contactNumber ?? "", width,
                      facility.contactNumber == null ? "연락처 정보가 없습니다." : ""),
                  detailBar("위치", facility.location, width, ""),
                  detailBar("추가 정보", facility.extraInfo ?? "", width,
                      facility.extraInfo == null ? "추가 정보가 없습니다." : "")
                ]),
              )),
            ));
      },
    );
  }
}
