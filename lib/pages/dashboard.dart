import 'package:flutter/material.dart';
import 'package:smart_home/components/button.dart';
import 'package:smart_home/pages/air_conditioner.dart';
import 'package:smart_home/pages/lamp.dart';
import 'package:smart_home/pages/window.dart';

class Dashboard extends StatefulWidget {
  final int initialTab;
  const Dashboard({super.key, this.initialTab = 0});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currntIndex = 0;
  bool _isClicked = false;

  @override
  void initState() {
    super.initState();
    _currntIndex = widget.initialTab;
  }

  void _onClicked () {
    setState(() {
      _isClicked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SafeArea(
        child: _buildPage(context)
      )
    );
  }

  Widget _buildPage(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      pageSnapping: true,
      itemCount: _widgetContent.length,
      itemBuilder: (context, index) {
        final data = _widgetContent[index];
        return Container(
          decoration: BoxDecoration(
            color: data["color"] as Color,
            image: (data["background"] != null)
                ? DecorationImage(
              image: data["background"] as ImageProvider,
              fit: BoxFit.cover,
            )
                : null,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 20,
                child: Text(
                  data["title"] as String,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              Positioned(
                bottom: 30,
                right: 30,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        textAlign: TextAlign.end,
                        data["content"] as String,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 20,),
                    MyButton(onPressed: (){}, text: "text")
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  final _widgetContent = [
    {
      "title": "Lamp",
      "content": "Lorem ipsum dolor ip siwcth",
      "color": Colors.white.withOpacity(0.1),
      "background": AssetImage("assets/lamp.jpg"),
      "buttonColor": Colors.amber,
      "goTo": () => Lamp(),
    },
    {
      "title": "AC",
      "content": "Lorem ipsum dolor ip siwcth",
      "color": Colors.blue.withOpacity(0.8),
      "background": AssetImage("assets/ac.jpg"),
      "buttonColor": Colors.amber,
      "goTo": () => AirConditioner(),
    },
    {
      "title": "Window",
      "content": "Lorem ipsum dolor ip siwcth",
      "color": Colors.blue,
      "background": null,
      "buttonColor": Colors.amber,
      "goTo": () => Window(),
    },
  ];
}
