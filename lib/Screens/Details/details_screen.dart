import 'package:dumper/Screens/Details/components/bottom_buttons.dart';
import 'package:dumper/Screens/Details/components/carousel_images.dart';
import 'package:dumper/Screens/Details/components/custom_app_bar.dart';
import 'package:dumper/Screens/Details/components/house_details.dart';
import 'package:dumper/model/house.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final House house;

  const DetailsScreen({Key key, this.house}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  List<String> imgs = [
    "https://www.commercialproperty.review/wp-content/uploads/2020/08/ATS-Greens-Village-Aparments-Sector-93-Noida.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  CarouselImages(imgs),
                  const CustomAppBar(),
                ],
              ),
              const HouseDetails(),
            ],
          ),
          const BottomButtons(),
        ],
      ),
    );
  }
}
