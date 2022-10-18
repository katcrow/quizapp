import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class QuestionScreenHolder extends StatelessWidget {
  const QuestionScreenHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var line = Container(
      width: double.infinity,
      height: 12,
      color: Theme.of(context).scaffoldBackgroundColor,
    );
    var answer = Container(
      width: double.infinity,
      height: 50,
      color: Theme.of(context).scaffoldBackgroundColor,
    );

    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.blueGrey.withOpacity(0.5),
      child: EasySeparatedColumn(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 20);
        },
        children: [
          EasySeparatedColumn(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 10);
            },
            children: [
              line,
              line,
              line,
              line,
            ],
          ),
          answer,
          answer,
          answer,
          answer,
        ],
      ),
    );
  }
}
