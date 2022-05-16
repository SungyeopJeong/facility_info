import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'MyNavBar.dart';

class KeyPadPage extends StatefulWidget {
  const KeyPadPage({Key? key}) : super(key: key);

  @override
  State<KeyPadPage> createState() => _KeyPadPageState();
}

class _KeyPadPageState extends State<KeyPadPage> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: KeyPadBody(
          height: height - statusBarHeight - 56,
          width: width,
        ),
      ),
      bottomNavigationBar:
          MyNavBar(height: height, width: width, activeIndex: 1),
    );
  }
}

class KeyPadBody extends StatefulWidget {
  final double height;
  final double width;
  const KeyPadBody({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  State<KeyPadBody> createState() => _KeyPadBodyState();
}

class _KeyPadBodyState extends State<KeyPadBody> {
  String input = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: widget.height * 264 / 584,
          child: Center(child: Text(input)),
        ),
        SizedBox(
          height: widget.height * 320 / 584,
          child: Center(
              child: Column(
            children: [
              SizedBox(
                  height: widget.height * 55 / 584,
                  child: Row(children: [
                    buildNumPad(0, 0),
                    buildNumPad(1, 1),
                    buildNumPad(2, 2)
                  ])),
              SizedBox(
                  height: widget.height * 55 / 584,
                  child: Row(children: [
                    buildNumPad(0, 3),
                    buildNumPad(1, 4),
                    buildNumPad(2, 5)
                  ])),
              SizedBox(
                  height: widget.height * 55 / 584,
                  child: Row(children: [
                    buildNumPad(0, 6),
                    buildNumPad(1, 7),
                    buildNumPad(2, 8)
                  ])),
              SizedBox(
                  height: widget.height * 55 / 584,
                  child: Row(
                    children: [
                      buildNumPad(0, 9),
                      buildNumPad(1, 10),
                      buildNumPad(2, 11)
                    ],
                  )),
              Container(
                  color: Colors.white,
                  width: widget.width,
                  height: widget.height * 100 / 584,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: widget.width * 120 / 360,
                            height: widget.height * 100 / 584,
                          ),
                          SizedBox(
                            width: widget.width * 120 / 360,
                            height: widget.height * 100 / 584,
                            child: Center(
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await FlutterPhoneDirectCaller.callNumber(
                                        input);
                                  },
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.zero),
                                      shape: MaterialStateProperty.all(
                                          const CircleBorder()),
                                      fixedSize: MaterialStateProperty.all(Size(
                                          widget.width * 60 / 360,
                                          widget.height * 60 / 584)),
                                      splashFactory: NoSplash.splashFactory,
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              ((states) {
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return const Color(0xff258E40);
                                        } else {
                                          return const Color(0xff34C85A);
                                        }
                                      })),
                                      elevation: MaterialStateProperty.all(0)),
                                  child: Container(
                                      width: widget.width * 60 / 360,
                                      height: widget.height * 60 / 584,
                                      padding: const EdgeInsets.all(0),
                                      child: Center(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                            Icon(
                                              Icons.call_rounded,
                                              size: 36,
                                            ),
                                          ])))),
                            ),
                          ),
                          SizedBox(
                            width: widget.width * 120 / 360,
                            height: widget.height * 100 / 584,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: widget.width * 20 / 360,
                                  right: widget.width * 50 / 360),
                              child: ElevatedButton(
                                  onLongPress: () {
                                    setState(() {
                                      input = "";
                                    });
                                  },
                                  onPressed: () {
                                    setState(() {
                                      input = input != ""
                                          ? input.substring(0, input.length - 1)
                                          : "";
                                    });
                                  },
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.zero),
                                      shape: MaterialStateProperty.all(
                                          const CircleBorder()),
                                      fixedSize: MaterialStateProperty.all(Size(
                                          widget.width * 50 / 360,
                                          widget.height * 50 / 584)),
                                      splashFactory: NoSplash.splashFactory,
                                      backgroundColor:
                                          MaterialStateProperty.resolveWith(
                                              ((states) {
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return input != ""
                                              ? const Color(0xffC4C4C4)
                                              : Colors.transparent;
                                        } else {
                                          return Colors.transparent;
                                        }
                                      })),
                                      elevation: MaterialStateProperty.all(0)),
                                  child: Container(
                                      width: widget.width * 40 / 360,
                                      height: widget.height * 40 / 584,
                                      padding: const EdgeInsets.all(0),
                                      child: Center(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                            Icon(
                                              Icons.backspace,
                                              size: 24,
                                              color: input != ""
                                                  ? const Color(0xff666666)
                                                  : const Color(0xffC4C4C4),
                                            ),
                                          ])))),
                            ),
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          )),
        )
      ],
    );
  }

  ElevatedButton buildNumPad(align, index) {
    List<String> imageName = [
      "one.png",
      "two.png",
      "three.png",
      "four.png",
      "five.png",
      "six.png",
      "seven.png",
      "eight.png",
      "nine.png",
      "asterisk.png",
      "zero.png",
      "hash.png"
    ];
    List<String> inputString = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '*',
      '0',
      '#'
    ];
    return ElevatedButton(
        onPressed: () {
          setState(() {
            input += inputString[index];
          });
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
            fixedSize: MaterialStateProperty.all(
                Size(widget.width * 120 / 360, widget.height * 55 / 584)),
            splashFactory: NoSplash.splashFactory,
            backgroundColor: MaterialStateProperty.resolveWith(((states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color(0xffC4C4C4);
              } else {
                return Colors.white;
              }
            })),
            elevation: MaterialStateProperty.all(0)),
        child: Container(
            width: widget.width * 120 / 360,
            height: widget.height * 55 / 584,
            padding: EdgeInsets.only(
                left: widget.width * (50 - 15 * align) / 360,
                right: widget.width * (20 + 15 * align) / 360),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image(
                image: AssetImage('assets/image/' + imageName[index]),
              ),
            ])));
  }
}
