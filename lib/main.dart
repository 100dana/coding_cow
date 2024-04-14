/*
* 2024-04-01
* 딩카 문제화면1
* 각 위젯마다 시작, 끝 주석으로 표기하기
* 속성에 대한 간략한 설명 주석으로 넣기
* 한글 작성시 항상 자간 -2 (letterSpacing: -2)
* 다음 속성이 없더라도 무조건 반점 찍기
* icon 종류는 https://www.fluttericon.com/ 에서 마우스 올려보기
* */


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp( // root widget
      theme: ThemeData( // font setting (나눔고딕코딩)
        fontFamily: 'NanumCoding',
      ),
      home: Scaffold(
        body: SafeArea( // 앱이 상태창 아래부터 표시되도록 함
          bottom: false,
          child: Column(
            children: [
              Container ( // top bar
                color: Color(0xff2355DA),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Container(
                    alignment: Alignment.topRight, // X박스 align right
                    child: SizedBox( // X박스
                      width: 50,
                      height: 50,
                      child: TextButton(
                        onPressed: () {

                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xffCD4F2C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          padding: EdgeInsets.all(5),
                        ),
                        child: Container(
                          color: Color(0xffD27F69),
                          child: Center(
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ), // end of X box,
                ),
              ),
              Row(
                children: [
                  Container(
                    child: Image(
                      image: AssetImage('icon/d41805b471e9667c2ba83170165dcae0.png'),
                      width: 80,
                      height: 80,
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                  Container (
                    child: Text(
                      '짝수/홀수 판별 프로그램',
                      style: TextStyle(
                        letterSpacing: -2,
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                  Container (
                  child: NestedFolderShape(
                  width: 400,
                  height: 550,
                  outerColor: Colors.yellow,
                  innerColor: Colors.white,
                  topWidth: 280,
                  innerTopWidth: 350,
                  innerHeight: 600
                    ),
                  ),
                    Positioned(
                      top:10,left: 20,
                      child: Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 40,
                        child: Text('LV.???',
                        style: TextStyle(
                          letterSpacing: -2,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ),
                    Container(
                      child: Text('#include <stdio.h>\nvoid main() {\n  int n=3;\n  if(   ) {\n     printf("짝수");',
                      style: TextStyle(
                        letterSpacing: -2,
                        fontSize: 25,
                      ),
                      ),
                    )
      ],
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                child: SizedBox(
                  height: 50,
                ),
              ),
                  BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      items: [
                        BottomNavigationBarItem(
                          label: '힌트',
                            icon: ImageIcon(
                              AssetImage('icon/free-icon-light-bulb-2987996.png'),
                            ),
                        ),
                        BottomNavigationBarItem(
                          label: '메모',
                            icon: ImageIcon(
                              AssetImage('icon/free-icon-note-1302002.png')
                            ))
                      ],
                  ),
                ],
              )
            ],
          ),
        ), // end of middle
      ),
    );
  }
}

class NestedFolderShape extends StatelessWidget {
  final double width;
  final double height;
  final Color outerColor;
  final Color innerColor;
  final double topWidth;
  final double innerTopWidth;
  final double innerHeight;

  NestedFolderShape({required this.width, required this.height, required this.outerColor, required this.innerColor, required this.topWidth, required this.innerTopWidth, required this.innerHeight});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: NestedFolderPainter(outerColor: outerColor, innerColor: innerColor, topWidth: topWidth, innerTopWidth: innerTopWidth, innerHeight: innerHeight),
    );
  }
}

class NestedFolderPainter extends CustomPainter {
  final Color outerColor;
  final Color innerColor;
  final double topWidth;
  final double innerTopWidth;
  final double innerHeight;

  NestedFolderPainter({required this.outerColor, required this.innerColor, required this.topWidth, required this.innerTopWidth, required this.innerHeight});

  @override
  void paint(Canvas canvas, Size size) {
    Paint outerPaint = Paint()..color = outerColor;
    Paint innerPaint = Paint()..color = innerColor;

    double foldHeight = size.height * 0.1;
    double innerFoldHeight = innerHeight * 0.8;

    Path outerPath = Path()
      ..moveTo(20, 0)
      ..lineTo(size.width - topWidth, 0)
      ..lineTo(size.width ,foldHeight)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, foldHeight)

      ..close()
      ..moveTo(size.width - topWidth, 0)
      ..lineTo(size.width - topWidth +20, foldHeight)
      ..lineTo(size.width, foldHeight);

    double innerTopLeft = (size.width - innerTopWidth) / 2;

    double innerStartY = size.height - foldHeight + (foldHeight - innerFoldHeight);


    Path innerPath = Path()
      ..moveTo(innerTopLeft, innerStartY*1.5)
      ..lineTo(innerTopLeft + innerTopWidth, innerStartY*1.5)
      ..lineTo(innerTopLeft + innerTopWidth, innerStartY + innerFoldHeight*0.95)
      ..lineTo(innerTopLeft, innerStartY + innerFoldHeight*0.95)
      ..close();

    canvas.drawPath(outerPath, outerPaint);
    canvas.drawPath(innerPath, innerPaint);
  }

  @override
  bool shouldRepaint(NestedFolderPainter oldDelegate) {
    return oldDelegate.topWidth != topWidth || oldDelegate.innerTopWidth != innerTopWidth || oldDelegate.outerColor != outerColor || oldDelegate.innerColor != innerColor || oldDelegate.innerHeight != innerHeight;
  }
}