import 'package:dumper/Screens/Details/details_screen.dart';
import 'package:dumper/constants/constants.dart';
import 'package:dumper/main.dart';
import 'package:dumper/model/property_model.dart';
import 'package:dumper/services/firebase_database.dart';
import 'package:dumper/services/helper_functions.dart';
import 'package:dumper/services/home_page_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Houses extends StatefulWidget {
  Houses({Key key, this.propertyList}) : super(key: key);
  List<Content> propertyList;
  @override
  _HousesState createState() => _HousesState();
}

class _HousesState extends State<Houses> {
  int currentPage = 1;

  List<Content> _property = [];

  Future<bool> getData() async {
    final email = await HelperFunctions.getUserEmailSharedPreference();

    final Uri url = Uri.parse("$SERVER_IP/api/auth/property/all?email=$email&tag=");

    final response =
        await http.get(url, headers: {"ContentType": "application/json"});

    if (response.statusCode == 200) {
      final result = propertyModelFromJson(response.body);

      _property = result.content;

      currentPage++;

      setState(() {});

      return true;
    } else {
      return false;
    }
  }

  showImage(String image) {
    return Image.network(image);
  }

  @override
  void initState() {
    super.initState();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // if (widget.propertyList.isNotEmpty) {
      return Expanded(
        child: FutureBuilder<Content>(
          builder: (context, snapshot) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: widget.propertyList.length,
              itemBuilder: (context, index) {
                final data = widget.propertyList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsScreen(
                          house: widget.propertyList[index],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: appPadding, vertical: appPadding / 2),
                    child: SizedBox(
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  child: showImage(data.propertyImages[0].path),
                                  height: 200,
                                  width: size.width,
                                ),
                              ),
                              Positioned(
                                right: appPadding / 2,
                                top: appPadding / 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: IconButton(
                                    icon: data.isFav
                                        ? const Icon(
                                            Icons.favorite_rounded,
                                            color: kPrimaryColor,
                                          )
                                        : const Icon(
                                            Icons.favorite_border_rounded,
                                            color: kPrimaryColor,
                                          ),
                                    onPressed: () {
                                      HomePageService.likeAndDislike(data.id);
                                      setState(() {
                                        data.isFav = !data.isFav;
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '\₹${data.price}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  data.description,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: black.withOpacity(0.4)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '${data.bedrooms} bedrooms / ',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                ' ${data.bathrooms} bathrooms / ',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                ' ${data.sqFeet} sqft  ',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      );
    // } else {
    //   return const CircularProgressIndicator();
    // }
  }
}
