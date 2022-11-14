import 'package:boride_driver/mainScreens/main_screen.dart';
import 'package:boride_driver/tabPages/profile_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _EditPageState();
}

class _EditPageState extends State<AccountPage> {
  String accountName = "";
  String bankName = "";
  String accountNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
            );
          },
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: const Text(
          "Enter Account Number",
          style: TextStyle(color: Colors.black, fontFamily: "Brand-Regular"),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.08,
              right: MediaQuery.of(context).size.width * 0.08,
              top: MediaQuery.of(context).size.height * 0.05),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      "Bank information",
                      style: TextStyle(
                        fontFamily: "Brand-Regular",
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Text(
                      "Enter your bank account details. The information you entered will be used to send your earnings.",
                      style: TextStyle(
                        fontFamily: "Brand-Regular",
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 55,
                      width: 350,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 243, 245, 247),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          onChanged: (value) {
                            setState(() {
                              bankName = value;
                            });
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(null)
                          ],
                          decoration: const InputDecoration(
                            hintText: "Name of bank",
                            hintStyle: TextStyle(fontFamily: "Brand-Regular"),
                            labelStyle: TextStyle(fontFamily: "Brand-Regular"),
                            // prefixIcon: Icon(Icons.person),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 55,
                      width: 350,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 243, 245, 247),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.words,
                          onChanged: (value) {
                            setState(() {
                              accountName = value;
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: "Account name",
                            hintStyle: TextStyle(fontFamily: "Brand-Regular"),
                            //  prefixIcon: Icon(Icons.person),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 55,
                      width: 350,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 243, 245, 247),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.words,
                          onChanged: (value) {
                            setState(() {
                              accountNumber = value;
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: "Account number",
                            hintStyle: TextStyle(fontFamily: "Brand-Regular"),
                            //  prefixIcon: Icon(Icons.person),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 370,
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Center(
                          child: Text(
                            "Please make sure that the information you entered are correct.",
                            style: TextStyle(
                              fontFamily: "Brand-Regular",
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.2),
                      child: ElevatedButton(
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            "Submit",
                            style: TextStyle(fontFamily: "Brand-Regular"),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  updateProfile() {
    Map bankMap = {
      "id": FirebaseAuth.instance.currentUser!.uid,
      "bank_name": bankName,
      "account_name": accountName,
      "account_number": FirebaseAuth.instance.currentUser!.phoneNumber,
    };
    DatabaseReference profileRef = FirebaseDatabase.instance
        .ref()
        .child("users")
        .child(FirebaseAuth.instance.currentUser!.uid);
    profileRef.child("bank_details").set(bankMap);

    Navigator.pop(context);
  }
}
