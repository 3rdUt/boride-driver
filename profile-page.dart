import 'package:boride_driver/authentication/driver_registation.dart';
import 'package:boride_driver/global/global.dart';
import 'package:boride_driver/mainScreens/account-info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
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
                      margin: const EdgeInsets.only(top: 15),
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.black87,
                            radius: 50,
                            backgroundImage: AssetImage(
                              'images/drake.jpeg',
                            ),
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
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "4.5",
                                    style: TextStyle(
                                      fontFamily: "Brand-Regular",
                                      fontSize: 25,
                                      // fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 249, 175, 65),
                                  ),
                                ],
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
                            height: 80,
                            width: 130,
                            decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                                child: Text(
                              "Oct, 22",
                              style: TextStyle(
                                fontFamily: "Brand-Regular",
                                fontSize: 25,
                                // fontWeight: FontWeight.w300,
                                color: Colors.white,
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
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.black87,
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
                                  color: Colors.white,
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Divider(
                      height: 1,
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(20)),
                    height: 95,
                    width: 370,
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Vehicle Brand: ",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Toyota",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Vehicle Model: ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Camry",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Vehicle Color: ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Blue",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height * 0.07,),

                  Container(
                    width: 370,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 225, 226, 233),
                        borderRadius: BorderRadius.circular(20)),
                    height: 300,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AccountPage()));
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
                                Icon(Icons.credit_card),
                                SizedBox(width: 40),
                                Expanded(
                                  child: Text(
                                    'Add Account Number',
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
          ],
        ),
      ]),
    );
  }
}
