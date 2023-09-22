import 'package:flutter/material.dart';
import 'package:hackathon/screens/login_screen.dart';
import 'package:hackathon/screens/screen1.dart';
import 'package:hackathon/screens/screen2.dart';
import 'package:hackathon/screens/screen3.dart';
import 'package:hackathon/screens/screen4.dart';
import 'package:hackathon/screens/screen5.dart';
import 'package:hackathon/screens/screen6.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          // 여기에서 원하는 텍스트 스타일을 설정합니다.
          bodyLarge: TextStyle(
            fontFamily: 'BMHANNA', // 사용하려는 글꼴 패밀리 이름
            fontSize: 16,
            // 기타 스타일 속성들
          ),
          // 추가적인 텍스트 스타일 설정 가능
        ),
      ),
      title: '충청톤',
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Screen1(),
        '/screen2': (context) => const Screen2(),
        '/screen3': (context) => const Screen3(),
        '/screen4': (context) => Screen4(),
        '/screen5': (context) => Screen5(),
        '/screen6': (context) => Screen6(),
      },
    );
  }
}
