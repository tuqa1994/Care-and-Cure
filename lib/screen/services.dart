import 'dart:ffi';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../provider/UsersProvider.dart';
import '../provider/doctorsProvider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'dart:convert';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: ListView(
        children: [
          // user
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                height: 200,
                color: Colors.white,
              ),
              AppBar(
                actions: [
                  //masseges
                  Stack(alignment: AlignmentDirectional.center, children: [
                    Icon(
                      Icons.chat_bubble_outline,
                      size: 30,
                    ),
                    Positioned(
                      right: 0,
                      top: 30,
                      child: CircleAvatar(
                        child: Text(
                          "2",
                          style: TextStyle(color: Colors.white),
                        ),
                        radius: 8,
                        backgroundColor: Color.fromARGB(255, 146, 247, 254),
                      ),
                    ),
                  ]),
                  //notification
                  Stack(alignment: AlignmentDirectional.center, children: [
                    Icon(
                      Icons.notifications_outlined,
                      size: 30,
                    ),
                    Positioned(
                      right: 0,
                      top: 30,
                      child: CircleAvatar(
                        child: Text(
                          "5",
                          style: TextStyle(color: Colors.white),
                        ),
                        radius: 8,
                        backgroundColor: Color.fromARGB(255, 146, 247, 254),
                      ),
                    ),
                  ]),
                  SizedBox(
                    width: 20,
                  )
                ],
                toolbarHeight: 100,
                leading: Builder(
                  builder: (BuildContext context) {
                    // Drawer
                    return IconButton(
                      icon: //const Icon(Icons.menu),
                          SvgPicture.asset("image/4dots.svg",
                              height: 40,
                              width: 40,
                              allowDrawingOutsideViewBox: true,
                              color: Colors.white), //,

                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                       tooltip: MaterialLocalizations.of(context)
                         .openAppDrawerTooltip,
                    );
                  },
                ),
                backgroundColor: const Color.fromARGB(255, 96, 226, 255),
              ),
              Positioned(
                top: 70,
                right: 0,
                left: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  height: 150,
                ),
              ),
              Consumer<UsersDbProvider>(builder: (context, model, child) {
                return Positioned(
                  top: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 53,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("${model.user[0]['image']}"),
                      backgroundColor: Colors.red,
                      radius: 50,
                    ),
                  ),
                );
              }),
              Consumer<UsersDbProvider>(builder: (context, model, child) {
                return Positioned(
                  bottom: 40,
                  child: Row(
                    children: [
                      Text(
                        "Hallo, ",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "${model.user[0]['name']}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              }),
              Positioned(
                bottom: 10,
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text(
                      "Irbid, Jordan",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              )
            ],
          ),
          //serch
          Container(
            height: 61,
            margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Stack(alignment: AlignmentDirectional.centerEnd, children: [
              Card(
                  elevation: 5,
                  shadowColor: Colors.grey,
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 30,
                        ),
                        hintText: "Search Doctors, Health Issues",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  )),
              Container(
                width: 15,
                height: 51,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 75, 236, 251),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
              )
            ]),
          ),
          //doctor
          DoctorBox(),
          //upcoming
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Upcoming Apointment",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "See All",
                  style:
                      TextStyle(color: const Color.fromARGB(255, 96, 226, 255)),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 245, 192, 210),
                      boxShadow: [
                        BoxShadow(
                            // spreadRadius: 3,
                            blurRadius: 5,
                            blurStyle: BlurStyle.outer,
                            offset: Offset(4, 4),
                            color: Color.fromARGB(255, 216, 216, 216))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('image/m1.jpg'),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Dr. Zaher abd',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 20,
                          ),
                          Text("\n  Monday june 22",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 11)),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.schedule,
                            size: 20,
                          ),
                          Text(
                            "  At 08:00 PM",
                            style: TextStyle(fontSize: 14, color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            // spreadRadius: 3,
                            blurRadius: 5,
                            blurStyle: BlurStyle.outer,
                            offset: Offset(4, 4),
                            color: Color.fromARGB(255, 216, 216, 216)),
                      ],
                      color: Color.fromARGB(255, 192, 244, 245),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('image/w1.jpg'),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Dr. Zaher abd',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 20,
                          ),
                          Text("\n  Monday june 22",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 11)),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.schedule,
                            size: 20,
                          ),
                          Text(
                            "  At 08:00 PM",
                            style: TextStyle(fontSize: 14, color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                RotatedBox(
                  quarterTurns: -1,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Make New",
                      style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 96, 226, 255)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorBox extends StatefulWidget {
  const DoctorBox({super.key});

  @override
  State<DoctorBox> createState() => _DoctorBoxState();
}

class _DoctorBoxState extends State<DoctorBox> {
  Future<ImageProvider<Object>?> stateCodeUrl(String url) async {
    var responce = await http.get(Uri.parse(url));
    if (responce.statusCode == 200) {
      return NetworkImage(url);
    } else {
      return const AssetImage("image/a1.jpg");
    }
  }

  @override
  void initState() {
    context.read<DoctorProvidor>().getDoctors();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    var doctors = context.watch<DoctorProvidor>().doctors;
    return doctors.isEmpty || doctors == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: doctors.length,
            itemBuilder: (BuildContext context, int i) {
              int index = i;
              return Container(
                height: 220,
                margin: EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 236, 236, 236),
                          offset: Offset(2, 4))
                    ],
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 1.5),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Color.fromARGB(247, 244, 243, 243),
                        Colors.white
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            // ignore: sort_child_properties_last
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage("image/a1.jpg"),
                              radius: 50,
                              child: CircleAvatar(
                                backgroundColor: Colors.white.withOpacity(0),
                                backgroundImage: NetworkImage(
                                    '${doctors[index].doctorImageURL}'),
                                radius: 50,
                              ),
                            ),
                            backgroundColor: Colors.white.withOpacity(0),
                            radius: 60,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Dr. ${doctors[index].doctorName}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: (() {
                                  launch(
                                      'mailto:${doctors[index].doctorEmail}');
                                }),
                                child: Row(
                                  children: [
                                    Icon(Icons.email_outlined),
                                    Text(" ${doctors[index].doctorEmail}"),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: (() {
                                  launch('tel:${doctors[index].phoneNumber}');
                                }),
                                child: Row(
                                  children: [
                                    Icon(Icons.phone_iphone),
                                    Text(" ${doctors[index].phoneNumber}"),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              InkWell(
                                onTap: (() {
                                  MapsLauncher.launchCoordinates(
                                      double.parse(
                                          doctors[index].address.latitude),
                                      double.parse(
                                          doctors[index].address.longitude),
                                      'location');
                                }),
                                child: Text(
                                  "${doctors[index].address.city}, ${doctors[index].address.country}",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 96, 226, 255),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text("\n  Monday june 22",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11)),
                            SizedBox(
                              width: 50,
                            ),
                            Icon(
                              Icons.schedule,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              "  08:00 PM",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      )
                    ]),
              );
            },
          );
  }
}
