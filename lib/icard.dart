import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Icard extends StatefulWidget {
  const Icard({super.key});

  @override
  State<Icard> createState() => _IcardState();
}

class _IcardState extends State<Icard> {
  bool isHover = false;
  Offset mousePos = new Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) {
        setState(() {
          isHover = true;
        });
      },
      onHover: (e) {
        setState(() {
          mousePos += e.delta;
          mousePos *= 0.12;
        });
      },
      onExit: (e) {
        setState(() {
          isHover = false;
        });
      },
      child: Container(
        height: 450,
        width: 280,
        color: Colors.white,
        child: Stack(
          children: [backImage()],
        ),
      ),
    );
  }

  backImage() {
    return AnimatedPositioned(
      curve: Curves.easeOutCubic,
      height: isHover ? 600 : 450,
      duration: Duration(milliseconds: 1000),
      child: Container(
        width: 500,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage("assets/images/one.jpg"),
          ),
        ),
      ),
    );
  }
}
