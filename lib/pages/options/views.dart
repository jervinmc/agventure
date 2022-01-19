import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:audioplayers/audioplayers.dart';

class Starting extends StatefulWidget {
  const Starting({ Key? key }) : super(key: key);

  @override
  _StartingState createState() => _StartingState();
}

class _StartingState extends State<Starting> {
AudioPlayer audioPlayer = new AudioPlayer();
  void getData()async{
    await audioPlayer.pause();
  }
  void quit(){
     AwesomeDialog(
                context: context,
                dialogType:DialogType.QUESTION,
                animType: AnimType.BOTTOMSLIDE,
                title: 'Are you sure you want to quit?',
                desc: '',
                btnOkOnPress: () {
                    SystemNavigator.pop();
                },
                btnCancelOnPress: (){
                  
                }
                )..show();
  }

  @override
  void initState(){
    
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Choose Actions'),backgroundColor:Color(0xff06611F)),
      body:Container(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardMenu(
              icon: Icon(Icons.checklist_outlined,color: Colors.white,size: 25.0,),
              title: 'Start',
              subtitle:'',
              color:Color(0xff06611F),
              func: (){
                Get.toNamed('/menu');
              },),
          // CardMenu(
          //     icon: Icon(Icons.format_list_numbered,color: Colors.white,size: 25.0,),
          //     title: 'Rules and Regulations',
          //     subtitle:'',
          //     color:Color(0xff06611F),
          //     func: (){
          //       Get.toNamed('/rules');
          //     },),
          CardMenu(
              icon: Icon(Icons.manage_accounts,color: Colors.white,size: 25.0,),
              title: 'Profile',
              subtitle:'',
              color:Color(0xff06611F),
              func: (){
                Get.toNamed('/profile');
              },),
          CardMenu(
              icon: Icon(Icons.close,color: Colors.white,size: 25.0,),
              title: 'Quit',
              subtitle:'',
              color:Color(0xff06611F),
              func: (){
                quit();
                // Get.toNamed('/managesurvey');
              },),
          ],
        )
      )
    );

  }
}
class CardMenu extends StatelessWidget {
  const CardMenu({Key? key, required this.icon, required this.title,required this.color,required this.subtitle,required this.func})
      : super(key: key);
  final Icon icon;
  final String title;
  final Color color;
  final String subtitle;
  final Callback func;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(20.0),
      child: InkWell(
        onTap: func,
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Row(
            children: [
              icon,
              Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top:13),
                      child: Text(
                        title,
                        style: TextStyle(color: Colors.white,fontSize: 20.0,overflow: TextOverflow.ellipsis),
                      ),
                    ),
                      Text(
                        subtitle,
                        style: TextStyle(color: Colors.white),
                      ),
                  ],
                )
              ),
            ],
          )),
      )
    );
  }
}