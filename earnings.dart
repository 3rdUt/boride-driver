import 'package:boride_driver/assistants/assistant_methods.dart';
import 'package:boride_driver/brand_colors.dart';
import 'package:boride_driver/infoHandler/app_info.dart';
import 'package:boride_driver/mainScreens/trips_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EarningsTabPage extends StatefulWidget {
  const EarningsTabPage({Key? key}) : super(key: key);

  @override
  _EarningsTabPageState createState() => _EarningsTabPageState();
}

class _EarningsTabPageState extends State<EarningsTabPage> {
  @override
  void initState() {
    super.initState();
    AssistantMethods.readDriverEarnings(context);
  }

  @override
  Widget build(BuildContext context) {
    double tEarnings = double.parse(Provider.of<AppInfo>(context, listen: true)
        .driverTotalEarnings
        .toString());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Earnings",
          style: TextStyle(color: Colors.black, fontFamily: "Brand-Regular"),
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          "\$ " + tEarnings.toStringAsFixed(0),
                          style: const TextStyle(
                            fontFamily: "Brand-Bold",
                            color: Colors.grey,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                //total number of trips
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10)),
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => const TripsHistoryScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        shadowColor: Colors.transparent),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Trip History",
                            style: TextStyle(
                              fontFamily: "Brand-Bold",
                              fontSize: 25,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            "images/car_logo.png",
                            width: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
