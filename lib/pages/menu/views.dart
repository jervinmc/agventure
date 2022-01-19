import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class VegetableList extends StatefulWidget {
  const VegetableList({Key? key}) : super(key: key);

  @override
  _VegetableListState createState() => _VegetableListState();
}

class _VegetableListState extends State<VegetableList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Vegetables List'),
          backgroundColor: Color(0xff06611F),
        ),
        body: ListView(
          children: [
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardMenu(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  title: 'Chili Red Pepper',
                  image: "assets/images/chili_pepper.jpg",
                  subtitle: 'Nemo enim ipsam voluptatem quia',
                  color: Color(0xff06611F),
                  func: () {
                    Get.toNamed('/tutorial',arguments: ['Chili Red Pepper']);
                  },
                ),
                CardMenu(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  title: 'Bittergourd',
                  image: "assets/images/ampalaya.jpeg",
                  subtitle: 'Nemo enim ipsam voluptatem quia',
                  color: Color(0xff06611F),
                  func: () {
                    Get.toNamed('/tutorial',arguments: ['Bittergourd']);
                  },
                ),
                CardMenu(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  title: 'String Beans',
                  image: "assets/images/sitaw.jpeg",
                  subtitle: 'Nemo enim ipsam voluptatem quia',
                  color: Color(0xff06611F),
                  func: () {
                    Get.toNamed('/tutorial',arguments: ['String Beans']);
                  },
                ),
                CardMenu(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  image: "assets/images/okra.jpeg",
                  title: 'Ladies Finger',
                  subtitle: 'Nemo enim ipsam voluptatem quia',
                  color: Color(0xff06611F),
                  func: () {
                    Get.toNamed('/tutorial',arguments: ['Ladies Finger']);
                  },
                ),
                CardMenu(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  title: 'Pumpkin',
                  subtitle: 'Nemo enim ipsam voluptatem quia',
                  image: "assets/images/pumnkin.jpeg",
                  color: Color(0xff06611F),
                  func: () {
                   Get.toNamed('/tutorial',arguments: ['Pumpkin']);
                  },
                ),
              ],
            )),
          ],
        ));
  }
}

class CardMenu extends StatelessWidget {
  const CardMenu(
      {Key? key,
      required this.icon,
      required this.title,
      required this.image,
      required this.color,
      required this.subtitle,
      required this.func})
      : super(key: key);
  final Icon icon;
  final String image;
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
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Image.asset(
                    image,
                    height: 60,
                  ),
                  Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Text(
                            subtitle,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                ],
              )),
        ));
  }
}
