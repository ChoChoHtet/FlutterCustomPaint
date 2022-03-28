import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_custom_paint/utils/constants.dart';

class CustomLayout extends StatefulWidget {
  const CustomLayout({Key? key}) : super(key: key);

  @override
  State<CustomLayout> createState() => _CustomLayoutState();
}

class _CustomLayoutState extends State<CustomLayout> {
  Formations formations = Formations.FOUR_FOUR_ONE;
  @override
  Widget build(BuildContext context) {
    // top to bottom method
    return Scaffold(
      body: Stack(
        children:  [
          const FootballPitchBackgroundView(),
          FormationView(formations:formations)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            formations = Formations.values[Random().nextInt(Formations.values.length)];
          });
        },
      ),
    );
  }
}

class FormationView extends StatelessWidget {
  final Formations formations;

   const FormationView({Key? key, required this.formations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _generateFormation(formations),
    );
  }

  Widget _generateFormation(Formations formations) {
    switch (formations) {
      case Formations.FOUR_FOUR_ONE:
        return const FormatFourFourTwoView();
      case Formations.FOUR_TWO_THREE_ONE:
        return const FormatTwoThreeOneView();
      case Formations.FOUR_THREE_THREE:
        return const FormatFourThreeThreeView();
      case Formations.THREE_FOUR_THREE:
        return const FormatThreeFourThreeView();
    }
  }
}

class FormatTwoThreeOneView extends StatelessWidget {
  const FormatTwoThreeOneView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            const PlayerView(),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(3, (index) => const PlayerView()),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(2, (index) => const PlayerView()),
            ),
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(4, (index) => const PlayerView()),
            ),
            const PlayerView(
              isGoalKeeper: true,
            )
          ],
        ),
      ),
    );
  }
}

class FormatFourFourTwoView extends StatelessWidget {
  const FormatFourFourTwoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(2, (index) => const PlayerView()),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => const PlayerView()),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 25,
          ),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => const PlayerView()),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          const PlayerView(
            isGoalKeeper: true,
          )
        ],
      ),
    );
  }
}

class FormatFourThreeThreeView extends StatelessWidget {
  const FormatFourThreeThreeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => const PlayerView()),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => const PlayerView()),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 25,
          ),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => const PlayerView()),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          const PlayerView(
            isGoalKeeper: true,
          )
        ],
      ),
    );
  }
}

class FormatThreeFourThreeView extends StatelessWidget {
  const FormatThreeFourThreeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => const PlayerView()),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => const PlayerView()),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 25,
          ),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => const PlayerView()),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          const PlayerView(
            isGoalKeeper: true,
          )
        ],
      ),
    );
  }
}

class PlayerView extends StatelessWidget {
  final bool isGoalKeeper;
  const PlayerView({Key? key, this.isGoalKeeper = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: isGoalKeeper ? Colors.yellowAccent : Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

class FootballPitchBackgroundView extends StatelessWidget {
  const FootballPitchBackgroundView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        "assets/football_pitch.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
