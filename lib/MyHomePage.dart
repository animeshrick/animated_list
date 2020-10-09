import 'package:animated_list/animated_appbar.dart';
import 'package:animated_list/login_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CatagoryScroller.dart';
import 'constants.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  final globalKey = GlobalKey<ScaffoldState>();

  List<Widget> itemsData = [];

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {
      double value = controller.offset / 119;
      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    int _currentIndex = 0;
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Warning"),
                  content: Text('Are you sure to Exit ?'),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text('Yes')),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text('No')),
                  ],
                ));
      },
      child: Scaffold(
        key: globalKey,
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   flexibleSpace: Container(
        //     decoration: BoxDecoration(
        //         gradient: LinearGradient(
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //       colors: [Colors.grey, Colors.white10],
        //     )),
        //   ),
        //   elevation: 0,
        //   backgroundColor: Colors.white,
        //   leading: Icon(
        //     Icons.menu,
        //     color: Colors.black,
        //   ),
        //   actions: <Widget>[
        //     IconButton(
        //       icon: Icon(Icons.search, color: Colors.black),
        //       onPressed: () {},
        //     ),
        //   ],
        // ),
        appBar: AnimatedAppBar(''),
        drawer: Drawer(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          splashColor: Colors.blue,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginUI()));
          },
          child: Icon(Icons.exit_to_app),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.white,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.blueGrey[800],
          height: 50,
          items: <Widget>[
            Icon(Icons.home, color: Colors.blue, size: 25),
            Icon(Icons.search, color: Colors.deepPurpleAccent, size: 25),
            Icon(Icons.more_horiz, color: Colors.amberAccent, size: 25),
          ],
          animationDuration: Duration(milliseconds: 500),
          index: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  margin: EdgeInsets.all(10),
                  child: Image.asset('assets/card.png'),
                ),

                // Column(
                //   children: [
                //     Padding(
                //       padding: EdgeInsets.only(
                //           top: 20.0, left: 20, right: 20, bottom: 2),
                //       child: Card(
                //         semanticContainer: true,
                //         clipBehavior: Clip.antiAliasWithSaveLayer,
                //         elevation: 8,
                //         color: Colors.black,
                //         margin: EdgeInsets.zero,
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.only(
                //                 bottomLeft: Radius.circular(10),
                //                 topLeft: Radius.circular(10),
                //                 bottomRight: Radius.circular(10),
                //                 topRight: Radius.circular(10))),
                //         child: Stack(
                //           children: <Widget>[
                //             Container(
                //               width: MediaQuery.of(context).size.width,
                //               height: 200,
                //               child: Image.network(
                //                   'https://cutewallpaper.org/21/white-background-wallpaper-hd/flower-canvas-white-background-vector-4k-hd-wallpaper.jpg',
                //                   fit: BoxFit.fill),
                //             ),
                //             Column(
                //               mainAxisAlignment: MainAxisAlignment.start,
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Padding(
                //                   padding: const EdgeInsets.only(
                //                       left: 15, right: 15, top: 15),
                //                   child: Row(
                //                     mainAxisAlignment: MainAxisAlignment.start,
                //                     crossAxisAlignment:
                //                         CrossAxisAlignment.start,
                //                     children: [
                //                       Text('Welcome to Hax',
                //                           style: TextStyle(
                //                               color: Colors.black,
                //                               fontSize: 25,
                //                               fontWeight: FontWeight.bold)),
                //                       Spacer(),
                //                       Column(
                //                         children: <Widget>[
                //                           Text('* * * *',
                //                               style: TextStyle(
                //                                   color: Colors.black,
                //                                   fontSize: 25,
                //                                   fontWeight: FontWeight.bold)),
                //                           Text('Points',
                //                               style: TextStyle(
                //                                   color: Colors.black,
                //                                   fontSize: 15)),
                //                         ],
                //                       )
                //                     ],
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding:
                //                       EdgeInsets.only(left: 15, bottom: 10),
                //                   child: CircleAvatar(
                //                     child: Image.network(
                //                         'https://static.javatpoint.com/tutorial/ethical-hacking/images/black-hat-hacker.png'),
                //                     radius: 30,
                //                     // backgroundImage:
                //                     //     AssetImage('assets/pizza.png')
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding:
                //                       EdgeInsets.only(bottom: 10, left: 15),
                //                   child: Row(
                //                     crossAxisAlignment:
                //                         CrossAxisAlignment.start,
                //                     mainAxisAlignment: MainAxisAlignment.start,
                //                     children: [
                //                       Column(
                //                         crossAxisAlignment:
                //                             CrossAxisAlignment.start,
                //                         children: <Widget>[
                //                           Text(
                //                             'User Name'.toUpperCase(),
                //                             textAlign: TextAlign.left,
                //                             style: TextStyle(
                //                                 color: Colors.black,
                //                                 fontSize: 15,
                //                                 fontWeight: FontWeight.bold),
                //                           ),
                //                           Text(
                //                             'User Phone Number'.toUpperCase(),
                //                             textAlign: TextAlign.left,
                //                             style: TextStyle(
                //                                 color: Colors.black,
                //                                 fontSize: 12),
                //                           ),
                //                         ],
                //                       ),
                //                       Spacer(),
                //                       Padding(
                //                         padding: EdgeInsets.only(right: 0.0),
                //                         child: FlatButton(
                //                           shape: RoundedRectangleBorder(
                //                             borderRadius: BorderRadius.only(
                //                                 bottomLeft: Radius.circular(30),
                //                                 topLeft: Radius.circular(30),
                //                                 bottomRight: Radius.circular(0),
                //                                 topRight: Radius.circular(0)),
                //                           ),
                //                           color: Colors.black54,
                //                           onPressed: () {},
                //                           child: Text(
                //                             'Check Rewards',
                //                             style: TextStyle(
                //                                 fontSize: 13,
                //                                 color: Colors.white,
                //                                 fontWeight: FontWeight.bold),
                //                           ),
                //                         ),
                //                       )
                //                     ],
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     const SizedBox(
                //       height: 8,
                //     ),
                //   ],
                // ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        child: Text('Trending',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        onTap: () {
                          final snackBar =
                              SnackBar(content: Text('Tapped Trending'));
                          globalKey.currentState.showSnackBar(snackBar);
                        },
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          final snackBar =
                              SnackBar(content: Text('Tapped View All'));
                          globalKey.currentState.showSnackBar(snackBar);
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: closeTopContainer ? 0 : 1,
                  child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: size.width,
                      alignment: Alignment.topCenter,
                      height: closeTopContainer ? 0 : categoryHeight,
                      child: categoriesScroller),
                ),
                Expanded(
                    child: ListView.builder(
                        controller: controller,
                        itemCount: itemsData.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          double scale = 1.0;
                          if (topContainer > 0.5) {
                            scale = index + 0.5 - topContainer;
                            if (scale < 0) {
                              scale = 0;
                            } else if (scale > 1) {
                              scale = 1;
                            }
                          }
                          return Opacity(
                            opacity: scale,
                            child: Transform(
                              transform: Matrix4.identity()
                                ..scale(scale, scale),
                              alignment: Alignment.bottomCenter,
                              child: Align(
                                  heightFactor: 0.7,
                                  alignment: Alignment.topCenter,
                                  child: itemsData[index]),
                            ),
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["name"],
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post["brand"],
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\INR ${post["price"]}",
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Image.asset(
                  "assets/${post["image"]}",
                  height: double.infinity,
                )
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }
}
