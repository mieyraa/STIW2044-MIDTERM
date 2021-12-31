import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rentaroom/room.dart';

class DetailScreen extends StatefulWidget {
  final Room room;

  const DetailScreen({Key? key, required this.room}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late double screenHeight, screenWidth, resWidth;
  final df = DateFormat('dd/MM/yyyy hh:mm a');

  @override
  void initState() {
    super.initState();
  }

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
      appBar: AppBar(
        title: const Text('ROOM DETAILS'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Stack(
        children: [
          SizedBox(
              width: resWidth,
              child: Stack(
                clipBehavior: Clip.none, fit: StackFit.expand,
                children: [
                  Column(
                  children: [
                    const SizedBox(height: 10),
                    SizedBox(
                          width: screenWidth,
                          child: Text(widget.room.title.toString(),
                          style: TextStyle(fontSize: resWidth*0.065, color: Colors.blueAccent.shade100, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(height: screenHeight*0.2),
                        Expanded(
                          child: SizedBox(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.shade100,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),)
                            ),  
                          child: SingleChildScrollView(
                            child: Column(                                            
                                        children: [
                                          SizedBox(height: screenHeight*0.12),
                                          Table(
                                          columnWidths: const{
                                            0: FractionColumnWidth(0.3),
                                            1: FractionColumnWidth(0.05),
                                            2: FractionColumnWidth(0.65)
                                          },
                                          defaultVerticalAlignment: TableCellVerticalAlignment.top,         
                                        children: [
                                          
                                          TableRow(
                                            children: [
                                               Text("Room ID",
                                               style: TextStyle(fontSize: resWidth*0.05, color: Colors.black, fontWeight: FontWeight.bold)),
                                               Text(":", style: TextStyle(fontSize: resWidth*0.05, color: Colors.black, fontWeight: FontWeight.bold)),
                                               Text(widget.room.roomid.toString(),
                                               style: TextStyle(fontSize: resWidth*0.05, color: Colors.black),
                                              ),
                                            ]),
                                             const TableRow(
                                            children: [
                                               SizedBox(height:10), SizedBox(height:10), SizedBox(height:10),
                                            ]),
                                           TableRow(
                                            children: [
                                               Text("Description",
                                               style: TextStyle(fontSize: resWidth*0.05, color: Colors.black, fontWeight: FontWeight.bold)),
                                               Text(":", style: TextStyle(fontSize: resWidth*0.05, color: Colors.black, fontWeight: FontWeight.bold)),
                                               Text(widget.room.description.toString(), textAlign: TextAlign.justify,
                                               style: TextStyle(fontSize: resWidth*0.05, color: Colors.black),
                                              ),
                                              
                                            ]), 
                                            const TableRow(
                                            children: [
                                               SizedBox(height:10), SizedBox(height:10), SizedBox(height:10),
                                            ]),  
                                            TableRow(
                                            children: [
                                               Text("Contact No.",
                                               style: TextStyle(fontSize: resWidth*0.05, color: Colors.black, fontWeight: FontWeight.bold)),
                                               Text(":", style: TextStyle(fontSize: resWidth*0.05, color: Colors.black, fontWeight: FontWeight.bold)),
                                               Text(widget.room.contact.toString(),
                                               style: TextStyle(fontSize: resWidth*0.05, color: Colors.black),
                                              ),
                                            ]), 
                                            const TableRow(
                                            children: [
                                               SizedBox(height:10), SizedBox(height:10), SizedBox(height:10),
                                            ]),
                                            TableRow(
                                            children: [
                                            Text("Price",
                                              style: TextStyle(fontSize: resWidth*0.05, color: Colors.black, fontWeight: FontWeight.bold),
                                              ),
                                           Text(":", style: TextStyle(fontSize: resWidth*0.05, color: Colors.black, fontWeight: FontWeight.bold)),
                                           Text("RM" + double.parse(widget.room.price.toString(),).toStringAsFixed(2),
                                            style: TextStyle(fontSize: resWidth*0.05, color: Colors.black),
                                            ),
                                            ]), 
                                             const TableRow(
                                            children: [
                                               SizedBox(height:10), SizedBox(height:10), SizedBox(height:10),
                                            ]),  
                                             TableRow(
                                            children: [
                                            Text("Deposit",
                                              style: TextStyle(fontSize: resWidth*0.05, color: Colors.black, fontWeight: FontWeight.bold),
                                              ),
                                           Text(":", style: TextStyle(fontSize: resWidth*0.05, color: Colors.black, fontWeight: FontWeight.bold)),
                                           Text("RM" + double.parse(widget.room.deposit.toString(),).toStringAsFixed(2),
                                            style: TextStyle(fontSize: resWidth*0.05, color: Colors.black),
                                            ),
                                            ]), 
                                             const TableRow(
                                            children: [
                                               SizedBox(height:10), SizedBox(height:10), SizedBox(height:10),
                                            ]), 
                                            TableRow(
                                            children: [
                                               Text("Area",
                                               style: TextStyle(fontSize: resWidth*0.05, color: Colors.black, fontWeight: FontWeight.bold)),
                                               Text(":", style: TextStyle(fontSize: resWidth*0.05, color: Colors.black, fontWeight: FontWeight.bold)),
                                               Text(widget.room.area.toString(),
                                               style: TextStyle(fontSize: resWidth*0.05, color: Colors.black),
                                              ),
                                            ]), 
                                            const TableRow(
                                            children: [
                                               SizedBox(height:10), SizedBox(height:10), SizedBox(height:10),
                                            ]),
                                            TableRow(
                                            children: [
                                               Text("State",
                                               style: TextStyle(fontSize: resWidth*0.05, color: Colors.black, fontWeight: FontWeight.bold)),
                                               Text(":", style: TextStyle(fontSize: resWidth*0.05, color: Colors.black, fontWeight: FontWeight.bold)),
                                               Text(widget.room.state.toString(),
                                               style: TextStyle(fontSize: resWidth*0.05, color: Colors.black),
                                              ),
                                            ]), 
                                            const TableRow(
                                            children: [
                                              SizedBox(height:10), SizedBox(height:10), SizedBox(height:10),
                                            ]),
                                            TableRow(
                                            children: [
                                               Text("Date Created",
                                               style: TextStyle(fontSize: resWidth*0.05, color: Colors.black, fontWeight: FontWeight.bold)),
                                               Text(":", style: TextStyle(fontSize: resWidth*0.05, color: Colors.black, fontWeight: FontWeight.bold)),
                                             
                                               Text(df.format(DateTime.parse(widget.room.date_created.toString())), 
                                               style: TextStyle(fontSize: resWidth*0.05, color: Colors.black),
                                              ),
                                            ]),
                                            const TableRow(
                                            children: [
                                              SizedBox(height:10), SizedBox(height:10), SizedBox(height:10),
                                            ]),
                                            TableRow(
                                            children: [
                                               Text("Latitude",
                                               style: TextStyle(fontSize: resWidth*0.05, color: Colors.black, fontWeight: FontWeight.bold)),
                                               Text(":", style: TextStyle(fontSize: resWidth*0.05, color: Colors.black, fontWeight: FontWeight.bold)),
                                               Text(widget.room.latitude.toString(),
                                               style: TextStyle(fontSize: resWidth*0.05, color: Colors.black),
                                              ),
                                            ]), 
                                            const TableRow(
                                            children: [
                                               SizedBox(height:10), SizedBox(height:10), SizedBox(height:10),
                                            ]),
                                            TableRow(
                                            children: [
                                               Text("Longitude",
                                               style: TextStyle(fontSize: resWidth*0.05, color: Colors.black, fontWeight: FontWeight.bold)),
                                               Text(":", style: TextStyle(fontSize: resWidth*0.05, color: Colors.black, fontWeight: FontWeight.bold)),
                                               Text(widget.room.longitude.toString(),
                                               style: TextStyle(fontSize: resWidth*0.05, color: Colors.black),
                                              ),
                                            ]), 
                                            const TableRow(
                                            children: [
                                               SizedBox(height:10), SizedBox(height:10), SizedBox(height:10),
                                            ]),     
                                        ],
                            ),
                          ]),
                            ),
                            ),
                          ),
                        )],
                ),
              Center(
                child: Column(
                  children: [
                    SizedBox(height: screenHeight*0.09),
                    SizedBox(
                      height: screenHeight / 3.5,
                      width: resWidth*0.8,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          SizedBox(
                            child: Container(
                              height: screenHeight / 3.5,
                              width: resWidth*0.8,
                              decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                              image: NetworkImage("https://slumberjer.com/rentaroom/images/" +widget.room.roomid.toString()+"_" +"1.jpg",),
                              fit: BoxFit.cover
                            ),
                            border: Border.all(
                            color: Colors.blue.shade900,
                            width: 8,
                            ),
                            borderRadius: BorderRadius.circular(60)
                            ),             
                          ),
                          ),  
                          SizedBox(width: resWidth*0.05),
                          SizedBox(
                            height: screenHeight / 3.8,
                            width: resWidth*0.8,
                            child: Container(
                            decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                            image: NetworkImage("https://slumberjer.com/rentaroom/images/" +widget.room.roomid.toString()+"_" +"2.jpg",),
                            fit: BoxFit.cover
                            ),
                            border: Border.all(
                            color: Colors.blue.shade900,
                            width: 8,
                            ),
                            borderRadius: BorderRadius.circular(60)
                            ),              
                            )),
                           SizedBox(width: resWidth*0.05),
                           SizedBox(
                            height: screenHeight / 3.8,
                            width: resWidth*0.8,
                            child: Container(
                            decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                            image: NetworkImage("https://slumberjer.com/rentaroom/images/" +widget.room.roomid.toString()+"_" +"3.jpg",),
                            fit: BoxFit.cover
                            ),
                            border: Border.all(
                            color: Colors.blue.shade900,
                            width: 8,
                            ),
                            borderRadius: BorderRadius.circular(60)
                            ),              
                            )),                     
                              ]),
                          ),
                  ]),
              )]),
              ),
              ]),
    );
  }
}
