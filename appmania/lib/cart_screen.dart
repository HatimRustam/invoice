import 'package:appmania/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class cart_screen extends StatefulWidget {
  const cart_screen({super.key});

  @override
  State<cart_screen> createState() => _cart_screenState();
}

class _cart_screenState extends State<cart_screen> {
  double Subtotal = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/background.jpg",
                    ),
                    colorFilter:
                        ColorFilter.mode(Colors.black87, BlendMode.screen),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: double.infinity,
            height: 100,
            // decoration: BoxDecoration(color: Colors.red),
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      CupertinoIcons.back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Text(
                    "Cart",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30,
                      )),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: height - 140,
              decoration: BoxDecoration(
                  color: Color(0xffF7F6FB),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: height - 500,
                          child: SingleChildScrollView(
                            child: Column(
                                children: cartlist
                                    .map((e) => Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffffffff),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              height: 100,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15.0,
                                                    right: 15,
                                                    top: 10,
                                                    bottom: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Image.asset(
                                                        e.image.toString()),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          e.name.toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        Text(e.price.toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500))
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      right:
                                                                          10.0),
                                                              child: Icon(
                                                                  CupertinoIcons
                                                                      .minus_circle_fill),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      right:
                                                                          10.0),
                                                              child: Text(
                                                                  e.qnty
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          18)),
                                                            ),
                                                            Icon(Icons
                                                                .add_circle_rounded),
                                                          ],
                                                        ),
                                                        Text(
                                                            sum1(e.qnty!, e.price!)
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                                fontSize: 17))
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              Subtotal =
                                                                  Subtotal -
                                                                      Subtotal;
                                                              // total=total-3.50;
                                                              cartlist
                                                                  .remove(e);
                                                            });
                                                          },
                                                          child: Icon(
                                                              CupertinoIcons
                                                                  .delete)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList()),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15, top: 10, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15.0),
                                        child: Image.asset(
                                          "assets/images/coupon.png",
                                          width: 40,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        "Promo Code",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 17),
                                      )
                                    ],
                                  ),
                                  Container(
                                    width: 90,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Color(0xff5ED240),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Center(
                                        child: Text(
                                      "Apply",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15, top: 10, bottom: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Subtotal",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18)),
                                      Text(Subtotal.toString(),
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 18))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 6.0, bottom: 6),
                                    child: Divider(
                                      height: 5,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Delivery",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18)),
                                      Text("3.50",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 18))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 6.0, bottom: 6),
                                    child: Divider(
                                      height: 4,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18)),
                                      Text(total.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            pdf_function(sum1, total, height, Subtotal);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10),
                            child: Container(
                              width: double.infinity,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Color(0xff5ED240),
                                  borderRadius: BorderRadius.circular(18)),
                              child: Center(
                                  child: Text(
                                "CHECKOUT",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 23),
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  var total;

  sum1(int qty, double price) {
    print("Qty$qty");
    var ans = qty * price;
    // Subtotal=Subtotal+ans;
    subTotal(ans.toInt());
    return ans;
  }

  subTotal(int ans) {
    print(ans);
    Subtotal = Subtotal + ans;
    Total();
    return Subtotal;
  }

  Total() {
    total = Subtotal + 3.50;
  }
}

pdf_function(Function fun,  total, double height,double Subtotal) async {
  final ByteData image = await rootBundle.load('assets/images/background.jpg');

  Uint8List imageData = (image).buffer.asUint8List();

  final pdf = pw.Document();
  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4.copyWith(
          marginBottom: 0, marginLeft: 0, marginRight: 0, marginTop: 0),
      build: (pw.Context context) {
        return pw.Stack(
          children: [
            pw.Container(
              width: double.infinity,
              height: height,
              decoration: pw.BoxDecoration(
                  image: pw.DecorationImage(
                      image: pw.MemoryImage(
                        (imageData),
                      ),
                      fit: pw.BoxFit.cover)),
            ),
            pw.Align(
              alignment: pw.Alignment.bottomCenter,
              child: pw.Container(
                width: double.infinity,
                height: height - 140,
                decoration: pw.BoxDecoration(
                    color: PdfColor.fromInt(0xffF7F6FB),
                    borderRadius: pw.BorderRadius.only(
                      topRight: pw.Radius.circular(30),
                      topLeft: pw.Radius.circular(30),
                    )),
                child: pw.Padding(
                  padding: const pw.EdgeInsets.only(left: 20.0, right: 20),
                  child: pw.Padding(
                    padding: const pw.EdgeInsets.only(top: 30.0),
                    child: pw.Column(
                      children: [
                        pw.Container(
                          // color: PdfColors.red,
                          height: height * 63 / 100,
                          child: pw.Column(
                              children: cartlist
                                  .map((e) => pw.Center(
                                        child: pw.Padding(
                                          padding: const pw.EdgeInsets.only(
                                              bottom: 5),
                                          child: pw.Container(
                                            width: double.infinity,
                                            decoration: pw.BoxDecoration(
                                                color: PdfColor.fromInt(
                                                    0xffffffff),
                                                borderRadius:
                                                    pw.BorderRadius.circular(
                                                        15)),
                                            height: 100,
                                            child: pw.Padding(
                                              padding: const pw.EdgeInsets.only(
                                                  left: 15.0,
                                                  right: 15,
                                                  top: 10,
                                                  bottom: 10),
                                              child: pw.Row(
                                                mainAxisAlignment: pw
                                                    .MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  pw.Column(
                                                    crossAxisAlignment: pw
                                                        .CrossAxisAlignment
                                                        .start,
                                                    mainAxisAlignment: pw
                                                        .MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      pw.Text(
                                                        e.name.toString(),
                                                        style: pw.TextStyle(
                                                          color:
                                                              PdfColors.black,
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                      pw.Text(
                                                          e.price.toString(),
                                                          style: pw.TextStyle(
                                                            color:
                                                                PdfColors.black,
                                                            fontSize: 17,
                                                          ))
                                                    ],
                                                  ),
                                                  pw.Column(
                                                    crossAxisAlignment: pw
                                                        .CrossAxisAlignment
                                                        .center,
                                                    mainAxisAlignment: pw
                                                        .MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      pw.Row(
                                                        children: [
                                                          pw.Padding(
                                                            padding: const pw
                                                                .EdgeInsets.only(
                                                                right: 10.0),
                                                            child: pw.Text(
                                                                "x" +
                                                                    e.qnty
                                                                        .toString(),
                                                                style: pw.TextStyle(
                                                                    color: PdfColors
                                                                        .black,
                                                                    fontSize:
                                                                        18)),
                                                          ),
                                                        ],
                                                      ),
                                                      pw.Text(
                                                          fun(e.qnty!, e.price!)
                                                              .toString(),
                                                          style: pw.TextStyle(
                                                              color: PdfColors
                                                                  .grey700,
                                                              fontSize: 17))
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList()),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.only(top: 20.0),
                          child: pw.Container(
                            width: double.infinity,
                            decoration:
                                pw.BoxDecoration(color: PdfColors.white),
                            child: pw.Padding(
                              padding: const pw.EdgeInsets.only(
                                  left: 15.0, right: 15, top: 10, bottom: 10),
                              child: pw.Column(
                                children: [
                                  pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    children: [
                                      pw.Text("Subtotal",
                                          style: pw.TextStyle(
                                              color: PdfColors.grey,
                                              fontSize: 18)),
                                      pw.Text(Subtotal.toString(),
                                          style: pw.TextStyle(
                                              color: PdfColors.grey,
                                              fontSize: 18))
                                    ],
                                  ),
                                  pw.Padding(
                                    padding: const pw.EdgeInsets.only(
                                        top: 6.0, bottom: 6),
                                    child: pw.Divider(
                                      height: 5,
                                      color: PdfColors.grey,
                                    ),
                                  ),
                                  pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    children: [
                                      pw.Text("Delivery",
                                          style: pw.TextStyle(
                                              color: PdfColors.grey,
                                              fontSize: 18)),
                                      pw.Text("3.50",
                                          style: pw.TextStyle(
                                              color: PdfColors.grey,
                                              fontSize: 18))
                                    ],
                                  ),
                                  pw.Padding(
                                    padding: const pw.EdgeInsets.only(
                                        top: 6.0, bottom: 6),
                                    child: pw.Divider(
                                      height: 4,
                                      color: PdfColors.grey,
                                    ),
                                  ),
                                  pw.Row(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.spaceBetween,
                                    children: [
                                      pw.Text("Total",
                                          style: pw.TextStyle(
                                              color: PdfColors.black,
                                              fontSize: 18)),
                                      pw.Text(total.toString(),
                                          style: pw.TextStyle(
                                              color: PdfColors.black,
                                              fontSize: 18))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }));

  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}
