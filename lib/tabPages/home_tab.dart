// ignore_for_file: sort_child_properties_last

import 'dart:developer';

import 'package:drivers_app/form/form.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../item_page/item_page.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({super.key});

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  String? _mapStyle;
  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 17.0,
  );
  GoogleMapController? myMapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            bottom: 0,
            child: GoogleMap(
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                myMapController = controller;
                myMapController!.setMapStyle(_mapStyle);
              },
              initialCameraPosition: _kGooglePlex,
            ),
          ),
          buildProfileTile(),
          buildTextField(),
          Positioned(
              top: 270,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CustomForm(),
                            )),
                        child: Container(
                          height: 100,
                          width: 100,
                          alignment: Alignment.bottomCenter,
                          margin: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Image.asset("assets/cruise_bike.png"),
                              const Text("Bike"),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: const Offset(3, 3),
                                  blurRadius: 5,
                                  spreadRadius: 5)
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CustomForm(),
                            )),
                        child: Container(
                          height: 100,
                          width: 100,
                          alignment: Alignment.bottomCenter,
                          margin: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Image.asset("assets/car.png"),
                              const Text("Car"),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: const Offset(3, 3),
                                  blurRadius: 5,
                                  spreadRadius: 5)
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.bottomCenter,
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Image.asset(
                                fit: BoxFit.cover,
                                height: 70,
                                width: 70,
                                "assets/parcel.png"),
                            Text("Parcel"),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                offset: const Offset(3, 3),
                                blurRadius: 5,
                                spreadRadius: 5)
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.bottomCenter,
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Image.asset(
                                height: 70, width: 70, "assets/food.png"),
                            const Text("Food"),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                offset: const Offset(3, 3),
                                blurRadius: 5,
                                spreadRadius: 5)
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.bottomCenter,
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Image.asset(
                                height: 70, width: 70, "assets/tong.png"),
                            const Text("Tong"),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                offset: const Offset(3, 3),
                                blurRadius: 5,
                                spreadRadius: 5)
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.bottomCenter,
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Image.asset(
                                fit: BoxFit.cover,
                                height: 70,
                                width: 70,
                                "assets/more.png"),
                            const Text("More"),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                offset: const Offset(3, 3),
                                blurRadius: 5,
                                spreadRadius: 5)
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          Positioned(
            left: 0,
            right: 0,
            top: 530,
            child: Container(
              // width: 100,
              height: 120,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SelectItemPage(),
                        ));
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Image.asset(
                            fit: BoxFit.cover,
                            height: 70,
                            width: 70,
                            "assets/shopping.png"),
                        const Text("Shopping"),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            offset: const Offset(3, 3),
                            blurRadius: 5,
                            spreadRadius: 5)
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Image.asset(
                          fit: BoxFit.cover,
                          height: 70,
                          width: 70,
                          "assets/up_coming.jpg"),
                      const Text("Up Coming"),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(3, 3),
                          blurRadius: 5,
                          spreadRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Image.asset(
                          fit: BoxFit.cover,
                          height: 70,
                          width: 70,
                          "assets/up_coming.jpg"),
                      const Text("Up Coming"),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(3, 3),
                          blurRadius: 5,
                          spreadRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Image.asset(
                          fit: BoxFit.cover,
                          height: 70,
                          width: 70,
                          "assets/up_coming.jpg"),
                      const Text("Up Coming"),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(3, 3),
                          blurRadius: 5,
                          spreadRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Image.asset(
                          fit: BoxFit.cover,
                          height: 70,
                          width: 70,
                          "assets/up_coming.jpg"),
                      const Text("Up Coming"),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(3, 3),
                          blurRadius: 5,
                          spreadRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Image.asset(
                          fit: BoxFit.cover,
                          height: 70,
                          width: 70,
                          "assets/up_coming.jpg"),
                      const Text("Up Coming"),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(3, 3),
                          blurRadius: 5,
                          spreadRadius: 5)
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              ]),
            ),
          ),
          buildCurrentLocationIcon(),
          buildNotification(),
        ],
      ),
    );
  }

  Widget buildProfileTile() {
    return Positioned(
      top: 60,
      left: 20,
      right: 20,
      child: Container(
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("images/divers.png"),
                      fit: BoxFit.fill)),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                      text: "Good Morning ",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    TextSpan(
                      text: "ALL Rider",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
                const Text(
                  "Where are you going?",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField() {
    return Positioned(
      top: 170,
      left: 20,
      right: 20,
      child: Container(
        height: 50,
        padding: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 4,
                  blurRadius: 10)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xffA7A7A7),
          ),
          decoration: InputDecoration(
            hintText: 'Search for a destination',
            hintStyle:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
            suffixIcon: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(Icons.search),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget buildCurrentLocationIcon() {
    return const Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.only(bottom: 30, right: 8),
        child: CircleAvatar(
          backgroundColor: Colors.green,
          child: Icon(
            Icons.my_location,
            color: Colors.white,
          ),
          radius: 20,
        ),
      ),
    );
  }

  Widget buildNotification() {
    return const Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: 30, right: 8),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.notifications,
            color: Color(0xffC3CDD6),
          ),
        ),
      ),
    );
  }
}
