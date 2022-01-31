import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';
class StartingPage extends StatefulWidget {
 
  @override
  _StartingPageState createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  AudioPlayer audioPlayer = new AudioPlayer();
  void pageValidation()async {
     await audioPlayer.pause();
      final prefs = await SharedPreferences.getInstance();
     print(prefs.getBool("isStarted"));
    
     bool isStarted=false;
     if(prefs.getBool("isStarted")==null){
      isStarted=false;
     }
     else{
       isStarted=prefs.getBool("isStarted")!;
     }
     if(isStarted) {
       Navigator.pop(context);
       Get.toNamed('/starting');
     }
  }

  @override
  void initState() {
    super.initState();
    pageValidation();
  }
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.network(
            'https://www.iisd.org/sites/default/files/styles/og_image/public/2020-06/RS2085_food-agriculture-topic.jpg?itok=cM6jCv9Q'),
        titleWidget: Text(
          "",
          style: TextStyle(
              color: Colors.purple,
              fontSize: 20.5,
              fontWeight: FontWeight.bold),
        ),
        body:
            "I believe in the future of agriculture, with a faith born not of words but of deeds -anonymous",
        footer: Text('Proceed'),
        decoration: const PageDecoration(
          pageColor: Colors.white,
        ),
      ),
      PageViewModel(
        image: Image.network(
            'https://assets.thehansindia.com/h-upload/2020/05/26/972142-agriculture-policy.jpg?width=500&height=300'),
        titleWidget: Text(
          "",
          style: TextStyle(
              color: Colors.purple,
              fontSize: 20.5,
              fontWeight: FontWeight.bold),
        ),
        body:
            "Agriculture is a fundamental source of national prosperity.",
        footer: Text('Start'),
        decoration: const PageDecoration(
          pageColor: Colors.white,
        ),
      ),
      PageViewModel(
        image: Image.network(
            'https://bsmedia.business-standard.com/_media/bs/img/article/2020-09/01/full/1598901801-2753.jpg'),
        body:
            'Always do your best what you plant now, you will harvest later!',
        footer: Text('Finish'),
        titleWidget: Text(
          "",
          style: TextStyle(
              color: Colors.purple,
              fontSize: 20.5,
              fontWeight: FontWeight.bold),
        ),
        decoration: const PageDecoration(
          pageColor: Colors.white,
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primaryColor: Colors.red),
      home: new Scaffold(
        body: IntroductionScreen(
          done: Text(
            'Done',
            style: TextStyle(color: Colors.black),
          ),
          onDone: () async {
            // final prefs = await SharedPreferences.getInstance();
            // print(prefs.getBool("isStarted"));
            // prefs.setBool("isStarted", true);
            // Navigator.pop(context);
            Get.toNamed('/starting');
          },
          pages: getPages(),
        ),
      ),
    );
  }
}
