import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rentaroom/room.dart';
import 'package:rentaroom/detailscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 List roomList = [];
 Map mapResponse = {};

  String titlecenter = "Loading data...";
  late double screenHeight, screenWidth, resWidth;
  late ScrollController _scrollController;
  int scrollcount = 10;
  int rowcount = 2;
  int numroom = 0;

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
      rowcount = 2;
    } else {
      resWidth = screenWidth * 0.75;
      rowcount = 3;
    }

    return Scaffold(
         appBar: AppBar(
          title: Text('HOME', textAlign: TextAlign.center,
          style: TextStyle(fontSize: resWidth * 0.07)),
          backgroundColor: Colors.blue.shade900,
          leading: IconButton(
          icon: const Icon(Icons.home), onPressed: () {  },
          ),
      ),
        body: roomList.isEmpty
            ? Center(
                child: Text(titlecenter,
                    style: TextStyle(
                        fontSize: resWidth*0.04, fontWeight: FontWeight.bold)))
            : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  children: [
                    Text("Rooms Available",
                        style: TextStyle(fontSize: resWidth*0.05, fontWeight: FontWeight.bold, color: Colors.blueAccent.shade400)),
                    Text(numroom.toString() + " found",
                    style: TextStyle(fontSize: resWidth*0.03)),
                    SizedBox(height: resWidth*0.02),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: rowcount,
                        controller: _scrollController,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        children: List.generate(scrollcount, (index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 10,
                              child: InkWell(
                            onTap: () => { 
                              _roomDetails(index)
                            },
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 55,
                                  child: CachedNetworkImage(
                                    width: screenWidth,
                                    fit: BoxFit.cover,
                                    imageUrl: "https://slumberjer.com/rentaroom/images/" +roomList[index]['roomid'].toString()+"_" +"1.jpg",
                                    imageBuilder: (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                    image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                                     )),
                                    placeholder: (context, url) => const LinearProgressIndicator(),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                  ),
                                ),
                                Flexible(
                                    flex: 45,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(12,0,8,0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [  
                                          Center(
                                          child: Text(
                                              truncateString(roomList[index]['title'].toString()),
                                              style: TextStyle(fontSize: resWidth * 0.042,fontWeight: FontWeight.bold, color: Colors.blueAccent.shade400)),
                                          ),
                                          const SizedBox(height: 0.5,),
                                         Text(
                                              "Monthly Price: RM " + double.parse(roomList[index]['price']).toStringAsFixed(2),
                                               style: TextStyle(fontSize: resWidth * 0.03,
                                         )),
                                         Text(
                                              "Deposit: RM " + double.parse(roomList[index]['deposit']).toStringAsFixed(2),
                                              style: TextStyle(fontSize: resWidth * 0.03,
                                         )),
                                          Text(
                                              "Area: " + truncateString(roomList[index]['area'].toString()),
                                              style: TextStyle(fontSize: resWidth * 0.03,
                                          )),
                                        ]),
                                    )),
                              ]),
                          ));
                        }),
                      ),
                    ),
                  ]),
            ),);
  }

  Future _loadRooms() async {
    http.post(Uri.parse("https://slumberjer.com/rentaroom/php/load_rooms.php"),
        body: {}).then((response) {
        var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['status'] == 'success') {
        setState(() {
          mapResponse = jsonDecode(response.body);
          roomList = mapResponse['data']["rooms"];
          numroom = roomList.length;
          if (scrollcount >= roomList.length) {
            scrollcount = roomList.length;
          }
        });
      } else {
        setState(() {
          titlecenter = "No Data";
        });
      }
    });
  }

  String truncateString(String str) {
    if (str.length > 15) {
      str = str.substring(0, 15);
      return str + "...";
    } else {
      return str;
    }
  }

  _roomDetails(int index) async {
    
    Room room = Room(
        
        roomid: roomList[index]['roomid'],
        contact: roomList[index]['contact'],
        title: roomList[index]['title'],
        description: roomList[index]['description'],
        price: roomList[index]['price'],
        deposit: roomList[index]['deposit'],
        state: roomList[index]['state'],
        area: roomList[index]['area'],
        date_created: roomList[index]['date_created'],
        latitude: roomList[index]['latitude'],
        longitude: roomList[index]['longitude']
    );
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => DetailScreen( room: room,)));
    _loadRooms();
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        if (roomList.length > scrollcount) {
          scrollcount = scrollcount + 10;
          if (scrollcount >= roomList.length) {
            scrollcount = roomList.length;
          }
        }
      });
    }
  }
}