import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:video_player/video_player.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
class Tutorial extends StatefulWidget {
  dynamic args = Get.arguments;
  @override
  _TutorialState createState() => _TutorialState(args);
}

class _TutorialState extends State<Tutorial> {
  final args;
  _TutorialState(this.args);
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    if(args[0]=='Bittergourd'){
        _controller = VideoPlayerController.network(
        'https://agadventure.s3.us-east-2.amazonaws.com/Ampalaya+Farming_+How+to+Grow+Ampalaya+or+Bittergourd+-+High+Yield%2C+High+Income.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    }
    else if(args[0]=='String Beans'){
        _controller = VideoPlayerController.network(
        'https://agadventure.s3.us-east-2.amazonaws.com/Sitaw+Planting_+How+to+Plant+String+Beans+from+Seeds+to+Harvest.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    }
    else if(args[0]=='Chili Red Pepper'){
        _controller = VideoPlayerController.network(
        'https://agadventure.s3.us-east-2.amazonaws.com/Siling+Labuyo_+How+to+Plant+Siling+Labuyo%2C+Siling+Taiwan+or+Siling+Tingala.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    }
    else if(args[0]=='Pumpkin'){
         _controller = VideoPlayerController.network(
        'https://agadventure.s3.us-east-2.amazonaws.com/Squash+Planting+Tips_+How+to+Plant+Squash+in+the+Philippines.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    }
    else if(args[0]=='Ladies Finger'){
        _controller = VideoPlayerController.network(
        'https://agadventure.s3.us-east-2.amazonaws.com/Okra+Farming+in+the+Philippines_+Have+Daily+Income+in+Okra+Farming.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    }
    
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff06611F),
        title: Text(args[0]),
      ),
      body: Column(
        children: [
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Center(
                  child: CircularProgressIndicator()
                ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            width: 250,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xff06611F)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
              child: Text('Take a quiz'),
              onPressed: () {
                _controller.pause();
                AwesomeDialog(
                context: context,
                dialogType:DialogType.QUESTION,
                animType: AnimType.BOTTOMSLIDE,
                title: 'Are you sure you want to a quiz?',
                desc: '',
                btnOkOnPress: () {
                     Get.toNamed('/questionaire',arguments:[args[0]]);
                },
                btnCancelOnPress: (){
                   _controller.play();
                }
                )..show();
               
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
