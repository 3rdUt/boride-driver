import 'package:boride_driver/authentication/driver_registation.dart';
import 'package:boride_driver/global/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../infoHandler/app_info.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({Key? key}) : super(key: key);

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
              color: Colors.black, fontFamily: "Brand-Regular", fontSize: 25),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: ListView(children: [
        Column(
          children: [
            Container(
              //padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Container(
                      margin: const EdgeInsets.only(top: 25),
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            radius: 45,
                            //  backgroundImage: AssetImage(''),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(children: [
                    Text(onlineDriverData.name ?? "Getting name...",
                        style: const TextStyle(
                            fontSize: 24,
                            fontFamily: "Brand-Bold",
                            fontWeight: FontWeight.bold)),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Text(onlineDriverData.email ?? "Getting info...",
                          style: const TextStyle(
                              fontSize: 14,
                              fontFamily: "Brand-Regular",
                              fontWeight: FontWeight.w400)),
                    ),
                  ]),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text(
                                "4.5",
                                style: TextStyle(
                                  fontFamily: "Brand-Regular",
                                  fontSize: 25,
                                  // fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Ratings",
                              style: TextStyle(fontFamily: "Brand-Regular"),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 70,
                            width: 110,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                                child: Text(
                              "Oct, 22",
                              style: TextStyle(
                                fontFamily: "Brand-Regular",
                                fontSize: 25,
                                // fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            )),
                          ),
                          Container(
                            child: Text(
                              "Date Joined",
                              style: TextStyle(fontFamily: "Brand-Regular"),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text(
                                Provider.of<AppInfo>(context, listen: false)
                                    .allTripsHistoryInformationList
                                    .toSet()
                                    .toList()
                                    .length
                                    .toString(),
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  fontFamily: "Brand-Regular",
                                  fontSize: 30,
                                  // fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Trips",
                              style: TextStyle(fontFamily: "Brand-Regular"),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Divider(
                      height: 1,
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("Vehicle Brand: "),
                                    Text("Toyota"),
                                  ],
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                            ),
                            Container(
                                child: Row(
                              children: [
                                Text("Vehicle Model: "),
                                Text("Camry"),
                              ],
                            )),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Vehicle Color: "),
                                    Text("Grey"),
                                  ],
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                            ),
                            Container(
                                child: Row(
                              children: [
                                Text("Vehicle Year: "),
                                Text("2013"),
                              ],
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height * 0.07,),
                  Container(
                    width: 370,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20)),
                    height: 250,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.help_outline),
                              SizedBox(width: 40),
                              Expanded(
                                child: Text(
                                  'Help & Support',
                                  style: TextStyle(
                                    fontFamily: "Brand-Regular",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Icon(Icons.arrow_forward_ios_outlined)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.person_add),
                              SizedBox(width: 40),
                              Expanded(
                                child: Text(
                                  'Invite Friends',
                                  style: TextStyle(
                                    fontFamily: "Brand-Regular",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios_outlined)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await FirebaseAuth.instance.signOut();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const NewDriver()));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.logout),
                                SizedBox(width: 40),
                                Expanded(
                                  child: Text(
                                    'Logout',
                                    style: TextStyle(
                                      fontFamily: "Brand-Regular",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
