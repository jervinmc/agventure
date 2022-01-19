import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "dart:math";
import 'dart:ffi';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

class Questionaire extends StatefulWidget {
  dynamic args = Get.arguments;
  @override
  _QuestionaireState createState() => _QuestionaireState(this.args);
}

class _QuestionaireState extends State<Questionaire> {
  AudioPlayer audioPlayer = new AudioPlayer();
  Duration duration = new Duration();
  Duration position = new Duration();
  final args;
  _QuestionaireState(this.args);
  int _questionNo = 0;
  
  List _randomItem = [];
  int _score = 0;
  List items_red_chilli_pepper = [
    {
      "question": "How many days can the chili plant be moved ?",
      "answer": "10-24days",
      "choices": ['15-20days', '18-21 days', '10-24days']
    },
    {
      "question": "How many days before harvesting the chili plant ?",
      "answer": "75days",
      "choices": ['50days', '60days', '75days']
    },
    {
      "question": "Planting distance of chili ?",
      "answer": "50cm",
      "choices": ['20cm', '30cm', '50cm']
    },
    {
      "question": "How many days before planting chili seeds?",
      "answer": "3days",
      "choices": ['5 days', '3days', '8days']
    },
    {
      "question": "How deep can the chili seedling be planted?",
      "answer": "2-3cm",
      "choices": ['2-3cm', '4-5cm', '6-7cm']
    },
    {
      "question": "What fertilizer should be used on chili ?",
      "answer": "Synthetic fertilizer",
      "choices": ['Bio organic fertilizer', 'Synthetic fertilizer', 'Natural Agricultural fertilizer']
    },
    {
      "question": "When can the chili be watered?",
      "answer": "3days",
      "choices": ['5days', '2days', '3days']
    },
    {
      "question": "How many pieces of chili before it becomes 1 kilo?",
      "answer": "200pieces",
      "choices": ['100pieces', '300pieces', '200pieces']
    },
    {
      "question": "What size  can pruning chili ?",
      "answer": "6-8inches",
      "choices": ['6-8inches', '3-5inches', '4-7inches']
    },
    {
      "question": "Why is it necessary to pruning chili ?",
      "answer": "To prevents its growth",
      "choices": ['To bear much fruit', 'To increase the number of branches', 'To prevents its growth']
    }
  ];
  List items_ladies_finger = [
    {
      "question": "What kind of fertilizer is best for planting a okra?",
      "answer": "Organic fertilizer",
      "choices": ['Organic fertilizer', 'Pure organic', 'Swire']
    },
    {
      "question": "How long does it take okra to start fruiting?",
      "answer": "Okra reaches maturity in 50 to 65 days",
      "choices": [
        'Okra reaches maturity in 10 to 20 days',
        'Okra reaches maturity in 50 to 65 days',
        'Okra reaches maturity in 15 to 25 days'
      ]
    },
    {
      "question": "How long does it take for an okra tree to grow?",
      "answer": "3 to 4 months",
      "choices": ['4 to 5 months', '4 to 5 months', '3 to 4 months']
    },
    {
      "question": "What kind of medicinal plant do we need for an okra?",
      "answer": "Gold",
      "choices": ['Gold', 'Fungofree', 'Mainman']
    },
    {
      "question": "What okra needs to grow?",
      "answer": "Garlic",
      "choices": ['Full Sun', 'Sand', 'Rain']
    },
    {
      "question": "How do you water an okra plant?",
      "answer": "Watering every morning",
      "choices": [
        'During heavy rains',
        'During Rainy days',
        'atering every morning'
      ]
    },
    {
      "question": "What kind of fertilizer is best for planting a okra?",
      "answer": "Organic fertilizer",
      "choices": ['Organic fertilizer', 'Pure organic', 'Swire']
    },
    {
      "question": "What is the best inch to harvest an okra?",
      "answer": "2-3 inches",
      "choices": ['2-3 inches', '4-5 inches', '1-2 inches']
    },
    {
      "question": "How do you increase okra yield?",
      "answer": "Organic fertilizer",
      "choices": ['Organic fertilizer', 'Pure organic', 'Swire']
    },
    {
      "question": "What kind of fertilizer is best for planting a okra?",
      "answer": "Plant okra in extra wide rows",
      "choices": [
        'Plant okra in extra wide rows',
        'Plant okra in little spaces',
        'Plant okra near trashes'
      ]
    },
    {
      "question": "How many seeds do we need to plant an okra?",
      "answer": "Sow two seeds per peat pot and clip off the weaker seedling",
      "choices": [
        'Sow five seeds per peat pot and clip off the weaker seedling',
        'Sow four seeds per peat pot and clip off the weaker seedling',
        'Sow two seeds per peat pot and clip off the weaker seedling'
      ]
    },
    {
      "question": "How do you fertilize when planting?",
      "answer": "apply the fertilizer around the base of the plant",
      "choices": [
        'apply the fertilizer everywhere',
        'apple the fertilizer together with one tub of water',
        'apply the fertilizer around the base of the plant'
      ]
    },
    {
      "question": "What kind of fertilizer is 10/10/10?",
      "answer":
          "10 percent nitrogen, 10 percent  phosphate and 10 percent potash.",
      "choices": [
        '10 percent nitrogen, 10 percent  phosphate and 10 percent potash.',
        '100 percent nitrogen, 100 percent phosphate and 100 percent potash.',
        '1000 percent nitrogen, 1000 percent phosphate and 1000 percent potash.'
      ]
    },
    {
      "question": "Can okra be transplanted?",
      "answer":
          "You can transplant the seedlings without removing them from their pots",
      "choices": [
        'You cannot transplant the seedlings without removing them from their pots',
        'You can transplant the seedlings without removing them from their pots',
        'Definitely no.'
      ]
    },
    {
      "question": "How can you tell if an okra seeds are good?",
      "answer": "Do water test",
      "choices": ['Do sun test', 'Bite it', 'Do water test']
    },
    {
      "question": "How long does it take for okra to grow from a seed?",
      "answer": "50 to 65 days",
      "choices": ['50 to 65 days', '30-40 days', '10-20 days']
    },
  ];
  List items_string_beans = [
    {
      "question": "What do you need to do before planting?",
      "answer": "Soak it for about 30mins to 1hr",
      "choices": ['Soak it for about 30mins to 1hr', 'Bury in the ground', 'Dry under the sun']
    },
    {
      "question": "How far is the distance of every seedling ?",
      "answer": "30cm",
      "choices": [
        '10cm',
        '20cm',
        '30cm'
      ]
    },
    {
      "question": "How many seeds are needed every hole ?",
      "answer": "1",
      "choices": ['1', '3', '5']
    },
    {
      "question": "When do you need to water the seedling ?",
      "answer": "Every two days",
      "choices": ['Everyday', 'Every two days', 'Every three days']
    },
    {
      "question": "After how many weeks do you need to make or build a trellis for the string beans ?",
      "answer": "2weeks",
      "choices": ['1week', '2weeks', '3weeks']
    },
    {
      "question": "How long does the string beans last after planting?",
      "answer": "75 days",
      "choices": [
        '70days',
        '75 days',
        '80 days'
      ]
    },
    {
      "question": "How many times you can harvest the bean fruit ?",
      "answer": "20times",
      "choices": ['10times', '15 times', '20times']
    },
    {
      "question": "When can you harvest the bean fruit ?",
      "answer": "Every second day",
      "choices": ['Everyday', 'Every second day', 'Every third day']
    },
    {
      "question": "What is the best time to pick the fruit ?",
      "answer": "After opening of the flower until 12days",
      "choices": ['After opening of the flower until on its 10days', 'After opening of the flower until 12days', 'After opening of the flower until its 15days']
    },
    {
      "question": "What is the best time of the day to harvest the bean fruit ?",
      "answer": "6am - 9am",
      "choices": [
        '5am - 10am',
        '6am - 9am',
        '7am - 12pm'
      ]
    },
  ];
   List items_pumpkin = [
    {
      "question": "How many months before the pumpkin can be harvested?",
      "answer": "3 months/ 90 days",
      "choices": ['3 months/ 90 days', '2 months / 60days', '1 months / 30 days']
    },
    {
      "question": "How many pumpkin seeds can be placed per pit?",
      "answer": "1 seeds",
      "choices": [
        '3 seeds',
        '2 seeds',
        '1 seeds'
      ]
    },
    {
      "question": "What is the correct size of the pit for placing pumpkin seeds?",
      "answer": "2cm per pit",
      "choices": ['2cm per pit', '3cm per pit', '6cm per pit']
    },
    {
      "question": "How far is each pumpkin pit?",
      "answer": "50cm",
      "choices": ['30cm', '40cm', '50cm']
    },
    {
      "question": "3 days before the 15th day arrives",
      "answer": "Garlic",
      "choices": ['4 days before the 15th day arrives', '3 days before the 15th day arrives', '3 days before the 10th day arrives']
    },
    {
      "question": "How many days before giving complete fertilizer to the pumpkin plant?",
      "answer": "20 days",
      "choices": [
        '20 days',
        '10 days',
        '15days'
      ]
    },
    {
      "question": "How far is the fertilizer distance to the pumpkin plant?",
      "answer": "4inch",
      "choices": ['2inch', '3inch', '4inch']
    },
    {
      "question": "How many grams of fertilizer should be applied to the pumpkin plant per tree?",
      "answer": "20 grams",
      "choices": ['10g', '20 grams', '15g']
    },
    {
      "question": "How many days before repeating the application of fertilizer to the pumpkin plant?",
      "answer": "40 days",
      "choices": ['30 DAYS', '50 DAYS', '40 days']
    },
    {
      "question": "How many grams of fertilizer need to be applied per pumpkin tree when the second compost arrives?",
      "answer": "30grams",
      "choices": [
        '30grams',
        '10g',
        '25g'
      ]
    },
  ];
  List items_bittergourd = [
    {
      "question": "How many days before watering the bitter gourd in the field?",
      "answer": "3 days",
      "choices": ['3 days', '4 days', '5 days']
    },
    {
      "question": "How far is the distance of the fertilizer to the bitter gourd plant?",
      "answer": "3cm",
      "choices": [
        '3cm',
        '4cm',
        '5cm'
      ]
    },
    {
      "question": "What soil needs to be used for sowing bitter gourd?",
      "answer": "Class man ts3",
      "choices": ['Class man a', 'Class man ts3', 'Class b']
    },
    {
      "question": "How many seeds are placed in the bitter gourd seedling?",
      "answer": "1 only",
      "choices": ['2 only', '5 only', '1 only']
    },
    {
      "question": "What is the sign of ampalaya can harvested?",
      "answer": "harvested when green is glossy in color and the fruit is of sufficient size",
      "choices": ['harvested when green is glossy in color and the fruit is of sufficient size', 'Big size', 'The color of glossy']
    },
    {
      "question": "How many  grams or weight of an bitter gourd ?",
      "answer": "250 grams",
      "choices": [
        '250 grams',
        '300 grams',
        '400 grams'
      ]
    },
    {
      "question": "What quality of bitter gourd seed is good to use?",
      "answer": "Condor quality hybrid ampalaya seed",
      "choices": ['Galaxy F1 ampalaya', 'Condor quality hybrid ampalaya seed', 'Ramgo seed ampalaya']
    },
    {
      "question": "What is to use for transplanting bitter gourd in the tray?",
      "answer": "104 seedling holes",
      "choices": ['104 seedling holes', 'Can', 'Plastic bag']
    },
    {
      "question": "What is good fertilizer to use in bitter gourd?",
      "answer": "Peters professional",
      "choices": ['Peters professional', 'Pure organic', 'Eurea']
    },
    {
      "question": "How many days before the bitter gourd seedling sprouts?",
      "answer": "5 days",
      "choices": [
        '5 days',
        '10 days',
        '15 days'
      ]
    },
    {
      "question": "How many days bitter gourd  seedling can be transferred to the field ?",
      "answer": "14 days",
      "choices": [
        '14 days',  
        '15 days',
        '16 days'
      ]
    },
  ];
  late Timer _timer ;
int _start = 15;
  void startTimer() {
  const oneSec = const Duration(seconds: 1);
  _timer = new Timer.periodic(
    oneSec,
    (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        
          _questionNo++;
          _start=15;
          startTimer();
          if(_questionNo+1==10){
             Get.toNamed('/results',arguments: [_score]);
          }
        });
      } else {
        setState(() {
          _start--;
        });
      }
    },
  );
}
   bool playing = true;
  @override
  void initState() {
    startTimer();
    super.initState();
    getAudio();

    if (args[0] == 'Chili Red Pepper') {
      _randomItem = (items_red_chilli_pepper..shuffle());
    } else if (args[0] == 'Ladies Finger') {
      _randomItem = (items_ladies_finger..shuffle());
    }
    else if(args[0]=='String Beans'){
      _randomItem = (items_string_beans..shuffle());
    }
    else if(args[0]=='Pumpkin'){
      _randomItem = (items_pumpkin..shuffle());
    }
    else if(args[0]=='Bittergourd'){
      _randomItem = (items_bittergourd..shuffle());
    }
    
    // var element = items[_random.nextInt(items.length)];
    // print(element);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Question ${_questionNo + 1} - ${args[0]} '),
        backgroundColor: Color(0xff06611F),
      ),
      body: ListView(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Text(_randomItem[_questionNo]['question'],
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))),
          Choices(() async{
            setState(() {
            _start = 15;
            });
            if (_randomItem[_questionNo]['choices'][0] ==
                _randomItem[_questionNo]['answer']) {
              setState(() {
                _score++;
              });
            }
            if (_questionNo + 1 == 10) {
              await audioPlayer.pause();
              if(_score>5){
                final prefs = await SharedPreferences.getInstance();
                if(prefs.getInt(args[0])==null){
                    prefs.setInt(args[0],1);
                }
                 else{
                    prefs.setInt(args[0], (prefs.getInt(args[0])!+1));
                 } 
                 
              }
              Navigator.pop(context);
              Get.toNamed('/results',arguments: [_score]);
              return;
            }
            setState(() {
              _questionNo++;
            });
          }, _randomItem[_questionNo]['choices'][0]),
          Choices(()async{
            _start = 15;
            if (_randomItem[_questionNo]['choices'][1] ==
                _randomItem[_questionNo]['answer']) {
              setState(() {
                _score++;
              });
            }
            if (_questionNo + 1 == 10) {
              await audioPlayer.pause();
              if(_score>5){
                final prefs = await SharedPreferences.getInstance();
                if(prefs.getInt(args[0])==null){
                    prefs.setInt(args[0],1);
                }
                 else{
                    prefs.setInt(args[0], (prefs.getInt(args[0])!+1));
                 } 
                 
              }
              Navigator.pop(context);
              Get.toNamed('/results',arguments: [_score]);
              return;
            }
            setState(() {
              _questionNo++;
            });
          }, _randomItem[_questionNo]['choices'][1]),
          Choices(()async{
            _start = 15;
            if (_randomItem[_questionNo]['choices'][2] ==
                _randomItem[_questionNo]['answer']) {
              setState(() {
                _score++;
              });
            }
            if (_questionNo + 1 == 10) {
              await audioPlayer.pause();
              if(_score>5){
                final prefs = await SharedPreferences.getInstance();
                if(prefs.getInt(args[0])==null){
                    prefs.setInt(args[0],1);
                }
                 else{
                    prefs.setInt(args[0], (prefs.getInt(args[0])!+1));
                 } 
                 
              }
              Navigator.pop(context);
              Get.toNamed('/results',arguments: [_score]);
              return;
            }
            setState(() {
              _questionNo++;
            });
          }, _randomItem[_questionNo]['choices'][2]),
          // Choices((){
          //   if(_randomItem[_questionNo]['choices'][3]==_randomItem[3]['answer']){
          //     Get.toNamed('/results');
          //   }
          //   setState(() {
          //   _questionNo++;
          // });
          // },_randomItem[_questionNo]['choices'][3])
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         
        },
        child: Text('${_start}')
      ),
    );
  }
   void getAudio() async {
    print('play');
    // if (playing) {
    //   var res = await audioPlayer.pause();
    //   if (res == 1) {
    //     setState(() {
    //       playing = false;
    //     });
    //   }
    // }
    //  else {
       
      var url = "https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3";
      var res = await audioPlayer.play(url, isLocal: true);
      if (res == 1) {
        setState(() {
          playing = true;
        });
      }
      audioPlayer.onDurationChanged.listen((Duration dd){
          setState(() {
            duration = dd;
          });
      });
      audioPlayer.onAudioPositionChanged.listen((Duration dd) {
        setState(() {
          position = dd;
        });
       });
    }
  //}
}

class Choices extends StatelessWidget {
  Callback func;
  String answer;
  Choices(this.func, this.answer);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      width: 250,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xff06611F)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
          child: Text(answer),
          onPressed: func),
    );
  }
  
}

