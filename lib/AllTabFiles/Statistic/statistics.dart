// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'graph.dart';



class StatisticsTabPage extends StatefulWidget {
  const StatisticsTabPage({super.key});

  @override
  State<StatisticsTabPage> createState() => _StatisticsTabPageState();
}

class _StatisticsTabPageState extends State<StatisticsTabPage> {
// Start ------------Varriable And Function Declaration----------------
  int stockIndex = 1;
  var colour = Color.fromRGBO(63, 115, 111, 1);
      // ----This Function For Changing COlor etc of Selected Stack List  ----
  Color stockListDataColor(stockIndex, index) =>
      stockIndex == index ? Colors.white : Colors.black;
  var dropDownList = ["Expence", "Item 2", "Item 3"];
  var dropDownValue = "Expence";

  // End ------------Varriable And Function Declaration----------------
  @override
  Widget build(BuildContext context) {
// Start ------------- Create Stack For Fixed Widget Like Statistic Heading --To-- Top Spending Label-------------
    return Stack(
      children: [
        Column(
          children: [
// STart------------------ Statistic Heading And All Icons-------------
            Container(
              height: MediaQuery.of(context).size.width * 0.25,
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: (() {}),
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Expanded(
                      child: Text(
                    "Statistics",
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  )),
                  IconButton(
                    icon: const Icon(Icons.logout_outlined),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
// End------------------ Statistic Heading And All Icons-------------

//Start ------------Tab Bar Area Abnd Graph Section---------------
            Container(
              margin: EdgeInsets.all(10),
        //Start----------  Tab bar------------
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 45,
                      child: TabBar(
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colour,
                        ),
                        unselectedLabelColor: Color.fromRGBO(76, 74, 74, 1),
                        tabs: const [
                          Text("Day"),
                          Text("Week"),
                          Text("Month"),
                          Text("Year"),
                        ],
                      ),
                    ),
        //End----------  Tab bar------------

        // Start --------Drop Down Container Designing ----------
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromRGBO(76, 74, 74, .5),
                            width: 2,
                          ),
                        ),
                // Start ----------Drop Down Button------------
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                                borderRadius: BorderRadius.circular(10),
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconEnabledColor:
                                    Color.fromRGBO(76, 74, 74, .5),
                                value: dropDownValue,
                                
                                style: TextStyle(color: Color.fromRGBO(76, 74, 74, .9),),
                                items: dropDownList.map(
                                  (String dropDownListElement) {
                                    return DropdownMenuItem(
                                      value: dropDownListElement,
                                      child: Text(dropDownListElement),
                                    );
                                  },
                                ).toList(),
                                onChanged: ((String? value) {
                                  setState(() {
                                    dropDownValue = value!;
                                  });
                                })),
                          ),
                        ),
                // End ----------Drop Down Button------------       
                      ),
                    ),
        // End --------Drop Down Container Designing ----------

         //Start ---------------Graph Container--------------------
                    SizedBox(
                      height: 250,
                      child: TabBarView(children: [
                        //  GraphView Function declaration in /Graph.dart file
                        graphView(),
                        graphView(),
                        graphView(),
                        graphView(),
                      ]),
                    ),

        // END------------Graph Container--------------------
                  ],
                ),
              ),
            ),
      // Start -------------------Top spending Heading----------------
            Container(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  "Top Spending",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.swap_vert),
                  onPressed: () {},
                ),
              ),
            ),
      // End -------------------Top spending Heading----------------
          ],
        ),
// START------------Stock List------------
        Positioned(
          top: 578.8,
          child: SizedBox(
            // color: Colors.red,
            width: MediaQuery.of(context).size.width,
            height: 177.9,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: ((context, index) {
                return InkWell(
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    decoration: index == stockIndex
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colour,
                            boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: colour,
                                  offset: Offset(0, 3),
                                ),
                              ])
                        : BoxDecoration(),
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundImage: AssetImage(
                            stockdetail.map((e) => e.pic).toList()[index],
                          )),
                      title: Text(
                        stockdetail.map((e) => e.name).toList()[index],
                        style: TextStyle(
                            color: stockListDataColor(stockIndex, index),
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle:
                          Text(stockdetail.map((e) => e.time).toList()[index],
                              style: TextStyle(
                                color: stockListDataColor(stockIndex, index),
                              )),
                      trailing: Text(
                        stockdetail.map((e) => e.rate).toList()[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: index == stockIndex
                              ? Colors.white
                              : Colors.red[500],
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      stockIndex = index;
                      stockDetailIndex = index;
                    });
                  },
                );
              }),
              itemCount: stockdetail.map((e) => e.name).toList().length,
            ),
          ),
        ),
  // END------------Stock List------------
      ],
    );
  }
}
