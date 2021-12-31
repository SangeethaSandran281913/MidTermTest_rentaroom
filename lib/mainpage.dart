import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:rentaroom/room.dart';
import 'package:rentaroom/infopage.dart';

//title,price[monthly],deposit, area
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late double screenHeight, screenWidth, resWidth;
  List roomdata = [];
  late ScrollController _scrollController;
  int scount = 10;
  int rcount = 2;
  int nroomdata = 0;
  String align = "Hold Tight - Loadinggg..";
  final df = DateFormat('dd/MM/yyyy hh:mm a');


  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _loadRooms();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 600) {
      resWidth = screenWidth;
      rcount = 2;
    } else {
      resWidth = screenWidth * 0.75;
      rcount = 3;
    }

    return Scaffold(
      body: roomdata.isEmpty
          ? Center(
              child: Text(align, textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.blueGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,)))
                      
          : Column(
              children: [
               
                const Padding(
                  
                  padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
                  child: Text("Rent A Room", textAlign: TextAlign.center,
                      style:
                          TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 35,)),
                ),
                
                Expanded(
                 
                  child: GridView.count(
                    crossAxisCount: rcount,
                    controller: _scrollController,
                    children: List.generate(scount, (data) {
                      return Card(
                          child: InkWell(
                        onTap: () => {_roomDetails(data)},
                        child: Column(
                          children: [
                           
                            Flexible(
                              flex: 10,
                              child: CachedNetworkImage(
                                width: screenWidth,
                                height: double.infinity,
                                
                               fit: BoxFit.cover,
                                imageUrl:
                                    "https://slumberjer.com/rentaroom/images/" +
                                        roomdata[data]['roomid'] +
                                        "_1.jpg",
                                placeholder: (context, url) =>
                                    const LinearProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            Flexible(
                                flex: 25,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [

                                      const SizedBox(
                                        height: 3,
                                         ),  

                                      Text(         
                                          truncateString(roomdata[data]
                                                  ['title']
                                              .toString()),
                                              textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.blueGrey,                                              
                                              fontSize: resWidth * 0.045,
                                              fontFamily: 'League Spartan',
                                              fontWeight: FontWeight.bold)),
                                        const SizedBox(
                                        height: 10,
                                         ),  
                                   
                                      Row (children :[ const Icon(
                                        Icons.bedroom_parent,
                                        color: Colors.blueGrey,
                                        size: 20.0,),
                                      Flexible(child: Text(' RM ' +
                                              double.parse(
                                                      roomdata[data]['price'])
                                                  .toStringAsFixed(2) +
                                              ' /month',
                                          style: TextStyle(
                                            color: Colors.blueGrey,  
                                            fontFamily: 'RobotoMono',
                                            fontSize: resWidth * 0.035,
                                          )),                                      
                                      ),
                                      ]),
                                      
                                      Row (children :[ const Icon(
                                        Icons.attach_money_outlined,
                                        color: Colors.blueGrey,
                                        size: 20.0, ),
                                      Flexible(child: Text(" RM " +
                                              roomdata[data]['deposit'] +
                                              " Deposit  ",
                                          style: TextStyle(
                                            color: Colors.blueGrey,  
                                            fontFamily: 'RobotoMono',
                                            fontSize: resWidth * 0.035,
                                          )),                                      
                                      ),
                                      ]),
                                          
                                      Row (children :[ const Icon(
                                        Icons.place,
                                        color: Colors.blueGrey,
                                        size: 20.0,),
                                      Flexible(child: Text(" " + roomdata[data]['area'] + ", " + roomdata[data]['state'],
                                          style: TextStyle(
                                            color: Colors.blueGrey,  
                                            fontFamily: 'RobotoMono',
                                            fontSize: resWidth * 0.035,
                                          )),                                      
                                      ),
                                      ]),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ));
                    }),
                  ),
                ),
              ],
            ),
    );
  }

  String truncateString(String str) {
    if (str.length > 40) {
      str = str.substring(0, 40);
      return str ;
    } else {
      return str;
    }
  }

  void _loadRooms() {
    http.post(Uri.parse("https://slumberjer.com/rentaroom/php/load_rooms.php"),
        body: {}).then((response) {
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['status'] == 'success') {
        print(response.body);
        var extractdata = data['data'];
        setState(() {
          roomdata = extractdata["rooms"];
          nroomdata = roomdata.length;
          if (scount >= roomdata.length) {
            scount = roomdata.length;
          }
        });
      } else {
        setState(() {
          align = "No Data";
        });
      }
    });
  }

  _roomDetails(int data) {
    Room room = Room(
        roomid: roomdata[data]['roomid'],
        contact: roomdata[data]['contact'],
        title: roomdata[data]['title'],
        description: roomdata[data]['description'],
        price: roomdata[data]['price'],
        deposit: roomdata[data]['deposit'],
        state: roomdata[data]['state'],
        area: roomdata[data]['area'],
        date_created: roomdata[data]['date_created'],
        latitude: roomdata[data]['latitude'],
        longitude: roomdata[data]['longitude']);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => info(
                  room: room,
                )));
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        if (roomdata.length > scount) {
          scount = scount + 10;
          if (scount >= roomdata.length) {
            scount = roomdata.length;
          }
        }
      });
    }
  }
}
