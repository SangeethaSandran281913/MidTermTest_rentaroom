import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rentaroom/room.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


// ignore: camel_case_types
class info extends StatefulWidget {
  final Room room;
  const info({Key? key, required this.room}) : super(key: key);

  @override
  _infoState createState() => _infoState();
}

// ignore: camel_case_types
class _infoState extends State<info> {
  late double screenHeight, screenWidth, resWidth;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 600) {
      resWidth = screenWidth;
    } else {
      resWidth = screenWidth * 0.75;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      title: Text(
      'Rent A Room',
      style: GoogleFonts.pacifico(fontSize: 30),
      ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
              height: screenHeight / 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: ImageSlideshow(
                  initialPage: 0,
                  children: [
                    CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: "https://slumberjer.com/rentaroom/images/" +
                          widget.room.roomid.toString() +
                          "_1.jpg",
                      placeholder: (context, url) =>
                          const LinearProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: "https://slumberjer.com/rentaroom/images/" +
                          widget.room.roomid.toString() +
                          "_2.jpg",
                      placeholder: (context, url) =>
                          const LinearProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: "https://slumberjer.com/rentaroom/images/" +
                          widget.room.roomid.toString() +
                          "_3.jpg",
                      placeholder: (context, url) =>
                          const LinearProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ],
                  autoPlayInterval: 3000,
                  isLoop: true,
                ),
              )),
          Text(widget.room.title.toString(),
              style: const TextStyle(
                fontSize: 25, 
                fontWeight: FontWeight.bold)),
                
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              elevation: 10,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Table(
                  columnWidths: const {
                    0: FractionColumnWidth(0.4),
                    1: FractionColumnWidth(0.7)
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.top,
                  children: [
                    
                    TableRow(children: [
                      const Text('Description',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'League Spartan',
                            fontSize: 16, 
                            fontWeight: FontWeight.bold)),
                     Text(widget.room.description.toString(),
                     style: const TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'League Spartan',
                            fontSize: 14.5, 
                            fontWeight: FontWeight.normal)),
                    ]),

                    TableRow(children: [
                      const Text('Price',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontFamily: 'League Spartan',
                              fontSize: 16, 
                              fontWeight: FontWeight.bold)),
                      Text("RM " +
                          double.parse(widget.room.price.toString())
                              .toStringAsFixed(2) + " /month  ",
                     style: const TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'League Spartan',
                            fontSize: 14.5, 
                            fontWeight: FontWeight.normal) ),
                    ]),

                    TableRow(children: [
                      const Text('Deposit',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'League Spartan',
                            fontSize: 16, 
                            fontWeight: FontWeight.bold)),
                      Text("RM " + widget.room.deposit.toString() +".00",
                     style: const TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'League Spartan',
                            fontSize: 14.5, 
                            fontWeight: FontWeight.normal)),
                    ]),


                    TableRow(children: [
                      const Text('Area',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'League Spartan',
                            fontSize: 16, 
                            fontWeight: FontWeight.bold)),
                      Text(widget.room.area.toString(),
                     style: const TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'League Spartan',
                            fontSize: 14.5, 
                            fontWeight: FontWeight.normal)),
                    ]),
                    
                    TableRow(children: [
                      const Text('State',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'League Spartan',
                            fontSize: 16, 
                            fontWeight: FontWeight.bold)),
                      Text(widget.room.state.toString(),
                     style: const TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'League Spartan',
                            fontSize: 14.5, 
                            fontWeight: FontWeight.normal)),
                    ]),

                    

                    TableRow(children: [
                      const Text('Date Created',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'League Spartan',
                            fontSize: 16, 
                            fontWeight: FontWeight.bold)),
                      Text(widget.room.date_created.toString(),
                     style: const TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'League Spartan',
                            fontSize: 14.5, 
                            fontWeight: FontWeight.normal)),
                    ]),

                    TableRow(children: [
                      const Text('Latitude',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'League Spartan',
                            fontSize: 16, 
                            fontWeight: FontWeight.bold)),
                      Text(widget.room.latitude.toString(),
                     style: const TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'League Spartan',
                            fontSize: 14.5, 
                            fontWeight: FontWeight.normal)),
                    ]),

                    TableRow(children: [
                      const Text('Longitude',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'League Spartan',
                            fontSize: 16, 
                            fontWeight: FontWeight.bold)),
                      Text(widget.room.longitude.toString(),
                     style: const TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'League Spartan',
                            fontSize: 14.5, 
                            fontWeight: FontWeight.normal)),
                    ]),
                    
                    TableRow(children: [
                    TableCell(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const SizedBox(
                            width: 3,
                          ),
                          const Icon(
                            Icons.phone,
                            // size: 40,
                            color: Colors.blueGrey,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                              alignment: Alignment.center,
                              child: const Text("Phone ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey))),
                        ],
                      ),
                    ),
                    TableCell(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () => _callPhone(context),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(widget.room.contact.toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey)),
                              ),
                            ),
                          ]),
                    )
                  ]),

                  
                  ]),
                  
              ),
            ),
          ),
        ],
      )),
    );
  }

  _callPhone(BuildContext context) { showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        title: const Text(
          'Make a phone call ?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman',
            fontSize:22,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          MaterialButton(
              onPressed: () {
                Navigator.of(context).pop(false);
                _makePhoneCall('tel:' + widget.room.contact.toString());
              },
              child: Text(
                "Yes",
                style: TextStyle(
                  color: Colors.blue[600],
                ),
              )),
          MaterialButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                "No",
                style: TextStyle(
                  color: Colors.blue[600],
                ),
              )),
        ],
      ),
    );}

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  
}