import 'package:flutter/material.dart';

// NavigationLink 위젯 정의
class NavigationLink extends StatefulWidget {
  final String text;
  final String routeName;

  const NavigationLink({
    Key? key,
    required this.text,
    required this.routeName,
  }) : super(key: key);

  @override
  State<NavigationLink> createState() => _NavigationLinkState();
}

class _NavigationLinkState extends State<NavigationLink> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        // 마우스 호버 효과 시작
        // 파란색 효과를 어떻게 적용할지 여기에 작성
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        // 마우스 호버 효과 종료
        // 파란색 효과를 어떻게 해제할지 여기에 작성
        setState(() {
          isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, widget.routeName),
        child: Column(
          children: [
            Text(
              widget.text,
              style: TextStyle(
                color: isHovered
                    ? Colors.blue // 마우스 호버 시 파란색으로 변경
                    : const Color.fromARGB(255, 225, 225, 225),
                fontSize: 20,
                fontFamily: 'BMHANNA',
              ),
            ),
            const SizedBox(
              height: 64,
            )
          ],
        ),
      ),
    );
  }
}
