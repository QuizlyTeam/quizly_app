import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizly_app/widgets/header.dart';
import 'package:quizly_app/pages/menu.dart';

class Score extends StatelessWidget {
  final Map score;
  final String player;
  const Score({super.key, required this.score, required this.player});

  List<Widget> generateTable(double y, double x){
    List<Widget> ans = [];

    Map sortedScore;

    sortedScore = Map.fromEntries(
        score.entries.toList()..sort((e1, e2) => -e1.value.compareTo(e2.value))
    );

    sortedScore.forEach((key, value) {
      Text record = Text(
        '$key : $value',
        style: TextStyle(
          fontWeight: key == player ? FontWeight.bold : FontWeight.normal,
          fontSize: 46 * y
        ),
      );
      ans.add(record);
    });

    ElevatedButton returnToMenu = ElevatedButton(
        onPressed: () {
          Get.to(MenuPage(nick: player,));
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan,
            fixedSize: Size(280 * x, 96 * y),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            )),
        child: Text(
          'Return to menu',
          style: TextStyle(fontSize: 30 * y, color: Colors.white),
        )
    );

    ans.add(returnToMenu);

    return ans;
  }

  @override
  Widget build(BuildContext context) {
    double y = MediaQuery.of(context).size.height / 866.2857142857143;
    double x = MediaQuery.of(context).size.width / 411.42857142857144;

    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child:MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.grey[300],
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(70),
                  child: Header(
                    leftIcon: 'assets/images/profile.png',
                    rightIcon: 'assets/images/settings.png',
                    y: y,
                  ),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: generateTable(y, x),
                  ),
                ),
              )
          ),
        ));
  }
}
