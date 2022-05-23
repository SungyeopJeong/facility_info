import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'facility.dart';

class EditPage extends StatefulWidget {
  final Facility facility;
  const EditPage({Key? key, required this.facility}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final formKey = GlobalKey<FormState>();

  Widget editBar(String title, String detail, double width) {
    return Container(
        width: width,
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        child: Column(children: [
          Container(
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
          ),
          Container(
            //color: Colors.red,
            width: width - 40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                detail != "" ? detail : title + " 입력",
                textAlign: TextAlign.left,
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: detail == "" ? const Color(0xff989898) : Colors.black,
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: Colors.white,
                        width: 56,
                        height: 56,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "취소",
                              style: TextStyle(color: Color(0xff0075E8)),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Expanded(child: Center(child: Text("시설 정보 편집"))),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        color: Colors.white,
                        width: 56,
                        height: 56,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("저장",
                                style: TextStyle(color: Color(0xff0075E8)))
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ),
        body: Form(
          key: formKey,
          child: Container(
            color: Colors.white,
            height: height - statusBarHeight - 56,
            child: SingleChildScrollView(
                child: SizedBox(
              width: width,
              child: Column(children: [
                editBar("시설 이름", widget.facility.facilityName, width),
                editBar("카테고리", widget.facility.category, width),
                editBar("운영시간", widget.facility.operatingTime ?? "", width),
                editBar("연락처", widget.facility.contactNumber ?? "", width),
                editBar("위치", widget.facility.location, width),
                editBar("추가 정보", widget.facility.extraInfo ?? "", width)
              ]),
            )),
          ),
        ));
  }
}
