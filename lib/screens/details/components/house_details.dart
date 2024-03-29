import 'package:dumper/constants/constants.dart';
import 'package:dumper/model/property_model.dart';
import 'package:flutter/material.dart';

class HouseDetails extends StatefulWidget {
  const HouseDetails({Key key, this.houses}) : super(key: key);

  final Content houses;

  @override
  _HouseDetailsState createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<Content>(
        builder: (context, snapshot) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: appPadding,
                  left: appPadding,
                  right: appPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\₹${widget.houses.price.toString()}',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.houses.address,
                          style: TextStyle(
                            fontSize: 15,
                            color: black.withOpacity(0.4),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      '20 hours ago',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: appPadding,
                  bottom: appPadding,
                ),
                child: Text(
                  'House information',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: appPadding,
                        bottom: appPadding,
                      ),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: black.withOpacity(0.4),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.houses.sqFeet.toString(),
                              style: const TextStyle(
                                color: black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Square foot',
                              style: TextStyle(
                                color: black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: appPadding,
                        bottom: appPadding,
                      ),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: black.withOpacity(0.4),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.houses.bedrooms.toString(),
                              style: const TextStyle(
                                color: black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Bedrooms',
                              style: TextStyle(
                                color: black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: appPadding,
                        bottom: appPadding,
                      ),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: black.withOpacity(0.4),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.houses.bathrooms.toString(),
                              style: const TextStyle(
                                color: black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Bathrooms',
                              style: TextStyle(
                                color: black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: appPadding,
                        bottom: appPadding,
                      ),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: black.withOpacity(0.4),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.houses.garages.toString(),
                              style: const TextStyle(
                                color: black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Garages',
                              style: TextStyle(
                                color: black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: appPadding,
                  right: appPadding,
                  bottom: appPadding * 4,
                ),
                child: Text(
                  widget.houses.description,
                  style: TextStyle(
                    color: black.withOpacity(0.4),
                    height: 1.5,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
