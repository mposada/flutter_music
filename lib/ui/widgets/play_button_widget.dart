
import 'package:flutter/material.dart';
import 'package:workshop/ui/widgets/play_button.dart';

class PlayButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          boxShadow: [
            BoxShadow(color: Colors.grey, offset: Offset(0.0, 1.0), blurRadius: 5.0)
          ],
        ),
        child: CustomPaint(size: Size(30.0, 30.0), painter: PlayButton())
    );
  }

}