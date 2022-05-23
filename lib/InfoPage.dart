import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MyNavBar.dart';
import 'Search.dart';
import 'facility.dart';
import 'DetailPage.dart';
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

  Facility facilityFromDoc(QueryDocumentSnapshot doc, String categoryIndex) {
    return Facility(
        facilityName: doc['facilityName'] as String,
        category: doc['category'] as String,
        categoryIndex: categoryIndex,
        operatingTime: doc['operatingTime'] as String?,
        contactNumber: doc['contactNumber'] as String?,
        location: doc['location'] as String,
        extraInfo: doc['extraInfo'] as String?);
  }

  Future<void> getAllData() async {
    for (int index = 1; index <= 11; index++) {
      String categoryIndex =
          'category' + (index < 10 ? '0' + index.toString() : index.toString());
      String path = '/facility/' + categoryIndex + '/' + categoryIndex;
      await FirebaseFirestore.instance
          .collection(path)
          .orderBy('facilityName')
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          DBHelper dbHelper = DBHelper();
          Facility facility = facilityFromDoc(doc, categoryIndex);
          dbHelper.insertFacility(facility);
        }
      });
    }
  }

  Widget tileWaiting() {
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
            onTap: () {
              Navigator.push(
                  context,
                  SlidePageRoute(
                      page: DetailPage(
                    facilityName: facilityList[index].facilityName,
                  )));
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
                              facilityList[index].operatingTime ??
                                  "운영시간 정보가 없습니다.",
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
          return tileBuilder(facilityList!);
        });
  }

  @override
  Widget build(BuildContext context) {
    final double listheight = widget.height - 56;
    DBHelper dbHelper = DBHelper();
    //dbHelper.deleteAllFacility();
    return FutureBuilder(
        future: dbHelper.checkEmpty(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return progressIndicator();
          }
          if (snapshot.data == true) {
            // get data from firebase(once)
            return FutureBuilder(
                future: getAllData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return progressIndicator();
                  }
                  return Expanded(
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
                  );
                });
          } else {
            // get data from sqlite
            return Container(
              height: listheight,
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
            );
          }
        });
  }
}
