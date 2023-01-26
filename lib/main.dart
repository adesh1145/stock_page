import 'package:flutter/material.dart';
import 'AllTabFiles/Statistic/statistics.dart';
import 'AllTabFiles/home.dart';
import 'AllTabFiles/wallet.dart';
import 'AllTabFiles/profile.dart';


void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  
  Widget build(BuildContext context) {
     
    return MaterialApp(
        title: "Internship Task",
        theme: ThemeData(),
        home: const StateFulWidgetScreen(),
        ) ;
        }
}


class StateFulWidgetScreen extends StatefulWidget {
  const StateFulWidgetScreen({super.key});

  @override
  State<StateFulWidgetScreen> createState() => _StateFulWidgetScreenState();
}

class _StateFulWidgetScreenState extends State<StateFulWidgetScreen> {
   var color= const Color.fromRGBO(63, 115, 111, 1);
    var allTabPage=[homePage,const StatisticsTabPage(),walletPage,profilePage];
    int tabIndex=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

//Start ---------Bottom Nagivation Bar-----------------
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: color,
            type: BottomNavigationBarType.fixed,
            elevation: 7,
            iconSize: 35,
            currentIndex: tabIndex,
            items: const [
           BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: ""),
           BottomNavigationBarItem(icon: Icon(Icons.bar_chart),label: ""),
           BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined),label: ""),
           BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: ""),
          ],
          onTap: ((value) {
           setState(() {
              tabIndex=value;
           });
          }),
          ),
// End -------------Bottom Nagivation Bar-----------------
        
        body: allTabPage[tabIndex],
        );
 
  }
}