import 'package:appmania/cart_screen.dart';
import 'package:appmania/product_model.dart';
import 'package:appmania/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              CupertinoIcons.location_solid,
              color: Colors.black,
            ),
            Text(
              "Habiganj city",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => cart_screen(),
                ));
              },
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Icon(Icons.menu, color: Colors.black),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 15, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "Find The ",
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                    wordSpacing: 1,
                    fontSize: 35,
                  ),
                  children: [
                    TextSpan(
                        text: "Best\n",
                        style: TextStyle(
                            fontSize: 40,
                            letterSpacing: 1,
                            wordSpacing: 1,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: "Food",
                        style: TextStyle(
                            fontSize: 40,
                            letterSpacing: 1,
                            wordSpacing: 1,
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                      text: " Around You",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                        wordSpacing: 1,
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(CupertinoIcons.search),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Search your favourit food",
                              style: TextStyle(fontSize: 16.5),
                            ),
                          ],
                        ),
                        Icon(Icons.filter_list)
                      ],
                    ),
                  ),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  child: RichText(
                    text: TextSpan(
                      text: "Find ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                      ),
                      children: [
                        TextSpan(
                            text: "5Km>",
                            style: TextStyle(fontSize: 18, color: Colors.red)),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Center(
                          child: Text(
                        "Salads",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      )),
                      width: 110,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xff5dcf41),
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    Container(
                      child: Center(
                          child: Text(
                        "Hot sale",
                        style:
                            TextStyle(color: Color(0xff414141), fontSize: 17),
                      )),
                      width: 110,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xff5dcf41),
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    Container(
                      child: Center(
                          child: Text(
                        "Popularity",
                        style:
                            TextStyle(color: Color(0xff414141), fontSize: 17),
                      )),
                      width: 110,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xff5dcf41),
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: product
                        .map((e) => Center(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Stack(children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) => second_screen(
                                              image: e.img,
                                              name: e.name,
                                              price: e.price,
                                            ),
                                          ));
                                        },
                                        child: Container(
                                          width: 170,
                                          height: 240,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0),
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 130,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                      image: AssetImage(e.img!),
                                                      fit: BoxFit.contain,
                                                    )),
                                                  ),
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        e.name!,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 17),
                                                      )),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        "20min",
                                                        style: TextStyle(
                                                            fontSize: 17),
                                                      ),
                                                      Text(
                                                        "☆4.5",
                                                        style: TextStyle(
                                                            fontSize: 17),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: Container(
                                                        width: 40,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  bottomRight:
                                                                      Radius
                                                                          .circular(
                                                                              20),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20)),
                                                          color:
                                                              Color(0xff5ed240),
                                                        ),
                                                        child: InkWell(
                                                          onTap: () {
                                                            cartlist.add(cartmodel(
                                                                name: e.name,
                                                                price: e.price,
                                                                image: e.img
                                                                    .toString(),
                                                                qnty: 1));
                                                            Navigator.of(
                                                                    context)
                                                                .push(
                                                                    MaterialPageRoute(
                                                              builder: (context) =>
                                                                  cart_screen(),
                                                            ));
                                                          },
                                                          child: Icon(Icons.add,
                                                              color:
                                                                  Colors.white),
                                                        )),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30.0, top: 5),
                                                    child: Text(
                                                      "RS " +
                                                          e.price.toString(),
                                                      style: TextStyle(
                                                          fontSize: 16.5,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  )
                                                ],
                                              ))),
                                    ]),
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
