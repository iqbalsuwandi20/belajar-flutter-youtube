import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/question_twentyfour.dart';
// import 'package:flutter_basic/widgets/question_twentytree.dart';
// import 'package:flutter_basic/widgets/question_twentytwo.dart';
// import 'package:flutter_basic/widgets/question_twentyone.dart';
// import 'package:flutter_basic/widgets/question_twenty.dart';
// import 'package:flutter_basic/widgets/question_nineteen.dart';
// import 'package:flutter_basic/widgets/question_eighteen.dart';
// import 'package:flutter_basic/widgets/question_seventeen.dart';
// import 'package:flutter_basic/widgets/question_sixteen.dart';
// import 'package:flutter_basic/widgets/question_fiveteen.dart';
// import 'package:flutter_basic/widgets/question_fourteen.dart';
// import 'package:flutter_basic/widgets/question_thirteen.dart';
// import 'package:flutter_basic/widgets/question_eleven.dart';
// import 'package:flutter_basic/widgets/question_twelve.dart';
// import 'package:flutter_basic/widgets/question_nine.dart';
// import 'package:flutter_basic/widgets/question_ten.dart';
// import 'package:flutter_basic/widgets/question_eight.dart';
// import 'package:flutter_basic/widgets/question_seven.dart';
// import 'package:flutter_basic/widgets/question_five.dart';
// import 'package:flutter_basic/widgets/question_six.dart';
// import 'package:flutter_basic/widgets/question_four.dart';
// import 'package:flutter_basic/widgets/question_tree.dart';
// import 'package:flutter_basic/widgets/question_one.dart';
// import 'package:flutter_basic/widgets/question_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuestionTwentyfour(),
    );
  }
}
