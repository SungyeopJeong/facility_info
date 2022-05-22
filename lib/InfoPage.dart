import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'MyNavBar.dart';
import 'Search.dart';
import 'facility.dart';
import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';

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
                      onPressed: () {},
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
                        onPressed: () {},
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
  Widget progressIndicator() {
    return Container(
        color: Colors.white,
        width: widget.width,
        height: widget.height - 56,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [CircularProgressIndicator()]));
  }

  Facility docFromJson(QueryDocumentSnapshot doc) {
    return Facility(
        facilityName: doc['facilityName'],
        category: doc['category'],
        operatingTime: doc['operatingTime'],
        contactNumber: doc['contactNumber'],
        location: doc['location'],
        extraInfo: doc['extraInfo']);
  }

  Future<List<String>> getData(String path) async {
    List<String> facilityList = [];

    await FirebaseFirestore.instance
        .collection(path)
        .orderBy('facilityName')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        DBHelper dbHelper = DBHelper();
        Facility facility = docFromJson(doc);
        dbHelper.insertFacility(facility);
        facilityList.add(facility.category);
        facilityList.add(facility.facilityName);
        facilityList.add(facility.operatingTime ?? "(운영시간 정보 없음)");
      }
    });
    return facilityList;
  }

  Widget tile(String path) {
    return FutureBuilder<List<String>>(
        future: getData(path),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
              width: widget.width,
              height: 30,
              child: const Center(
                  child: Text(
                "(loading)",
                style: TextStyle(color: Color(0xffC4C4C4)),
              )),
            );
          }
          List<String>? facilityList = snapshot.data;
          return ConfigurableExpansionTile(
            header: SizedBox(
                width: widget.width - 60,
                height: 30,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: widget.width / 2,
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        facilityList![0],
                        textScaleFactor: 1.0,
                        style: const TextStyle(
                            color: Color(0xff666666),
                            fontSize: 12,
                            height: 20 / 12,
                            fontFamily: 'Noto_Sans_KR'),
                        overflow: TextOverflow.ellipsis,
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
            initiallyExpanded: true,
            children: [
              for (int index = 1; index < facilityList.length; index += 3)
                Container(
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
                              child: Text(
                                facilityList[index],
                                textScaleFactor: 1.0,
                                style: const TextStyle(
                                    fontSize: 14,
                                    height: 20 / 14,
                                    fontFamily: 'Noto_Sans_KR'),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              width: widget.width / 2 - 30,
                              height: 20,
                              child: Text(
                                facilityList[index + 1],
                                textScaleFactor: 1.0,
                                style: const TextStyle(
                                    color: Color(0xff989898),
                                    fontSize: 10,
                                    height: 2.0,
                                    fontFamily: 'Noto_Sans_KR'),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final double listHeight = widget.height - 56;
    DBHelper dbHelper = DBHelper();
    return FutureBuilder(
        future: dbHelper.checkEmpty(),
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return progressIndicator();
          } else {
            if (snapshot.data == true) {
              // get data from firebase(once)
              return Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 11,
                    itemBuilder: ((context, index) {
                      String indexToString = ((index + 1) < 10
                          ? '0' + (index + 1).toString()
                          : (index + 1).toString());
                      return tile('facility/category' +
                          indexToString +
                          '/category' +
                          indexToString);
                    })),
              );
            } else {
              // get data from sqlite
              return const Text("wait");
            }
          }
        });
    /*return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('facility').snapshots(),
        builder: (context, snapshot) {
          //if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              color: Colors.white,
              width: widget.width,
              height: listHeight,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [CircularProgressIndicator()]));
          /*}
          List<QueryDocumentSnapshot> items = snapshot.data!.docs;
          return Container(
            color: Colors.black,
            height: listHeight,
            child: ReorderableListView(
              children: <Widget>[
                for (int index = 0; index < items.length; index++)
                  ListTile(
                      key: Key('$index'),
                      title: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(color: Colors.white)),
                        child: Column(children: [
                          Text(
                            snapshot.data?.docs[index]['facilityName'] ?? '',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            snapshot.data?.docs[index]['category'] ?? '(없음)',
                            overflow: TextOverflow.ellipsis,
                          )
                        ]),
                      ))
              ],
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final QueryDocumentSnapshot item = items.removeAt(oldIndex);
                  items.insert(newIndex, item);
                });
              },
              padding: EdgeInsets.zero,
              shrinkWrap: true,
            ),
          );*/
        });*/
  }
}
