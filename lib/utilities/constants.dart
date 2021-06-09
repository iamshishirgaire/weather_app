import 'package:flutter/material.dart';

//styles//
final kTextStyleLabel =
    TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);
final kChipLabel =
    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
final kdatestyle =
    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

//models//

class ReusableContainer extends StatelessWidget {
  ReusableContainer(this.containerChild);
  final Widget containerChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF152C39), borderRadius: BorderRadius.circular(20)),
      child: containerChild,
    );
  }
}

class CardContent extends StatelessWidget {
  final String title;
  final String h1;
  final String h2;
  final Widget icon;
  CardContent(this.title, this.h1, this.h2, this.icon);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: kChipLabel,
        ),
        icon,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              h1,
              style: kdatestyle,
            ),
            Text(
              h2,
              style: kdatestyle,
            ),
          ],
        )
      ],
    );
  }
}
