import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:facility_info/facility.dart';
import 'dart:math';

class EditPage extends StatefulWidget {
  final Facility facility;
  const EditPage({Key? key, required this.facility}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final formKey = GlobalKey<FormState>();
  bool isvalid = false;

  Widget textFormField(String title, String detail, double width,
      FormFieldSetter onSaved, FormFieldValidator validator) {
    return Container(
      width: width,
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: Column(children: [
        Container(
          width: width - 40,
          child: Row(
            children: [
              Container(
                //color: Colors.green,
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
              (["시설 이름", "카테고리", "위치"].contains(title)
                  ? Container(
                      //color: Colors.green,
                      height: 36,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          " 필수",
                          textAlign: TextAlign.left,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              color: Color(0xff0075E8),
                              fontSize: 12,
                              height: 1.0,
                              fontFamily: 'Noto_Sans_KR'),
                        ),
                      ),
                    )
                  : const Text("")),
            ],
          ),
        ),
        Container(
          width: width - 40,
          height: 36,
          child: TextFormField(
            initialValue: detail,
            onSaved: onSaved,
            validator: validator,
            autovalidateMode: AutovalidateMode.always,
            onChanged: (value) {
              if ((formKey.currentState?.validate() ?? false) &&
                  value != detail) {
                setState(() {
                  isvalid = true;
                });
              } else {
                setState(() {
                  isvalid = false;
                });
              }
            },
            style: TextStyle(
                color: Colors.black,
                fontSize: 14 / MediaQuery.of(context).textScaleFactor,
                height: 24 / 14,
                fontFamily: 'Noto_Sans_KR'),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffF4F4F4),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              hintText: title + " 입력",
              hintStyle: TextStyle(
                  color: const Color(0xff989898),
                  fontSize: 14 / MediaQuery.of(context).textScaleFactor,
                  height: 24 / 14,
                  fontFamily: 'Noto_Sans_KR'),
              errorStyle: const TextStyle(color: Colors.transparent, height: 0),
              contentPadding: const EdgeInsets.only(bottom: 12, left: 10),
            ),
          ),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white));
    List<String> infolist = ["", "", "", "", "", ""];
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
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  color: Color(0xff0075E8),
                                  fontFamily: 'Noto_Sans_KR'),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                          child: Text(
                        (widget.facility.id == "" ? "시설 추가" : "시설 정보 편집"),
                        textScaleFactor: 1.0,
                        style: const TextStyle(fontFamily: 'Noto_Sans_KR'),
                      )),
                    ),
                    GestureDetector(
                        onTap: () async {
                          if ((formKey.currentState?.validate() ?? false) &&
                              isvalid) {
                            formKey.currentState!.save();
                            int index = [
                              "식당",
                              "매점",
                              "베이커리/패스트푸드",
                              "카페",
                              "체육시설",
                              "학내 인권 상담 기구",
                              "의료복지시설",
                              "기념품매장",
                              "인쇄",
                              "은행/우체국/ATM",
                              "기타편의시설"
                            ].indexOf(infolist[1]);
                            String categoryIndex = 'category' +
                                ((index + 1) < 10
                                    ? '0' + (index + 1).toString()
                                    : (index + 1).toString());
                            if (widget.facility.id == "") {
                              const availableChars =
                                  "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ0123456789";
                              String newid;
                              do {
                                newid = List.generate(
                                        20,
                                        (index) => availableChars[Random()
                                            .nextInt(availableChars.length)])
                                    .join();
                              } while (await DBHelper()
                                  .checkIdAlreadyExits(newid)
                                  .then((value) => value));
                              Facility newFacility = Facility(
                                  facilityName: infolist[0],
                                  category: infolist[1],
                                  categoryIndex: categoryIndex,
                                  id: newid,
                                  operatingTime: infolist[2],
                                  contactNumber: infolist[3],
                                  location: infolist[4],
                                  extraInfo: infolist[5]);
                              await DBHelper()
                                  .insertFacility(newFacility)
                                  .then((value) {
                                Navigator.pop(context, "Saved");
                              });
                            } else {
                              Facility newFacility = Facility(
                                  facilityName: infolist[0],
                                  category: infolist[1],
                                  categoryIndex: categoryIndex,
                                  id: widget.facility.id,
                                  operatingTime: infolist[2],
                                  contactNumber: infolist[3],
                                  location: infolist[4],
                                  extraInfo: infolist[5]);
                              await DBHelper()
                                  .updateFacility(
                                      widget.facility.id, newFacility)
                                  .then((value) {
                                Navigator.pop(context, "Saved");
                              });
                            }
                          }
                        },
                        child: Container(
                          color: Colors.white,
                          width: 56,
                          height: 56,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("저장",
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                      color: isvalid
                                          ? const Color(0xff0075E8)
                                          : const Color(0xffC4C4C4),
                                      fontFamily: 'Noto_Sans_KR'))
                            ],
                          ),
                        ))
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
                textFormField("시설 이름", widget.facility.facilityName, width,
                    (value) {
                  infolist[0] = value;
                }, (value) {
                  if (value.length < 1) {
                    return "필수 항목";
                  }
                  return null;
                }),
                Container(
                  width: width,
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 20, right: 20),
                  child: Column(children: [
                    Container(
                      width: width - 40,
                      child: Row(
                        children: [
                          Container(
                            //color: Colors.green,
                            height: 36,
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "카테고리",
                                textAlign: TextAlign.left,
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    color: Color(0xff666666),
                                    fontSize: 12,
                                    height: 1.0,
                                    fontFamily: 'Noto_Sans_KR'),
                              ),
                            ),
                          ),
                          Container(
                            //color: Colors.green,
                            height: 36,
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                " 필수",
                                textAlign: TextAlign.left,
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    color: Color(0xff0075E8),
                                    fontSize: 12,
                                    height: 1.0,
                                    fontFamily: 'Noto_Sans_KR'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width - 40,
                      height: 36,
                      child: DropdownButtonFormField(
                        value: widget.facility.category,
                        items: [
                          "식당",
                          "매점",
                          "베이커리/패스트푸드",
                          "카페",
                          "체육시설",
                          "학내 인권 상담 기구",
                          "의료복지시설",
                          "기념품매장",
                          "인쇄",
                          "은행/우체국/ATM",
                          "기타편의시설"
                        ].map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              textScaleFactor: 1.0,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  height: 24 / 14,
                                  fontFamily: 'Noto_Sans_KR'),
                            ),
                          );
                        }).toList(),
                        elevation: 2,
                        onSaved: (value) {
                          infolist[1] = value.toString();
                        },
                        onChanged: (value) {
                          if (value != widget.facility.category) {
                            setState(() {
                              isvalid = true;
                            });
                          } else {
                            setState(() {
                              isvalid = false;
                            });
                          }
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF4F4F4),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          contentPadding: EdgeInsets.only(bottom: 12, left: 10),
                        ),
                      ),
                    )
                  ]),
                ),
                textFormField(
                    "운영시간", widget.facility.operatingTime ?? "", width,
                    (value) {
                  infolist[2] = value;
                }, (value) {
                  return null;
                }),
                textFormField("연락처", widget.facility.contactNumber ?? "", width,
                    (value) {
                  infolist[3] = value;
                }, (value) {
                  return null;
                }),
                textFormField("위치", widget.facility.location, width, (value) {
                  infolist[4] = value;
                }, (value) {
                  if (value.length < 1) {
                    return '필수 항목';
                  }
                  return null;
                }),
                textFormField("추가 정보", widget.facility.extraInfo ?? "", width,
                    (value) {
                  infolist[5] = value;
                }, (value) {
                  return null;
                }),
              ]),
            )),
          ),
        ));
  }
}
