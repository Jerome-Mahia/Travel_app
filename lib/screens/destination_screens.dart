import 'package:flutter/material.dart';
import 'package:travel_app/models/destination.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;
  DestinationScreen({Key? key, required this.destination}) : super(key: key);

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
      TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.destination.mainImageUrl,
                child: Image(
                  image: AssetImage(widget.destination.detailsImageUrl),
                  height: 430.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 30.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      iconSize: 30.0,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite),
                      color: Theme.of(context).primaryColor,
                      iconSize: 35.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Material(
            elevation: 10,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(50),
              topRight: const Radius.circular(50),
            ),
            child: Container(
              height: 436,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(50),
                  topRight: const Radius.circular(50),
                ),
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                      top: 10,
                      ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.destination.title,
                              style: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$${widget.destination.price}',
                              style: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 254, 229, 0),
                                    size: 20,
                                  ),
                                  Text('${widget.destination.rating} (2.7K)'),
                                ],
                              ),
                              Text(
                                '*Estimated Cost',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
            Container(
            child: Align(
              alignment: Alignment.center,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                controller: _tabController,
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Colors.grey,
                indicator: CircleTabIndicator(
                    color: Theme.of(context).primaryColor, radius: 4),
                tabs: const [
                  Tab(text: "Overview"),
                  Tab(text: "Details"),
                  Tab(text: "Reviews"),
                  Tab(text: "Costs"),
                ],
              ),
            ),
          ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, bottom: 5),
                    child: Text(
                      widget.destination.description,
                      style: TextStyle(
                        color: Color.fromRGBO(165, 167, 172, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Wrap(
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              color: Colors.blue,
                              size: 20,
                            ),
                            Text(
                              widget.destination.duration,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Wrap(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Theme.of(context).primaryColor,
                              size: 20,
                            ),
                            Text(
                              widget.destination.distance,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Wrap(
                          children: [
                            Icon(
                              Icons.sunny,
                              color: Colors.orangeAccent,
                              size: 20,
                            ),
                            Text(
                              widget.destination.temperature,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 76),
                    child: Row(
                      children: [
                        Text(
                          'Duration',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 0.8,
                            color: Color.fromRGBO(165, 167, 172, 1),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Text(
                          'Distance',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 0.8,
                            color: Color.fromRGBO(165, 167, 172, 1),
                          ),
                        ),
                        SizedBox(
                          width: 63,
                        ),
                        Text(
                          'Sunny',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 0.8,
                            color: Color.fromRGBO(165, 167, 172, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FlatButton(
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2.5),
                          ),
                          onPressed: () {},
                          child: Text(
                            '\$${widget.destination.price}',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        FlatButton(
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 70.0),
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Book Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// implementing a class that gives the dots color or painty
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter

    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    // putting the circle middle and on bottom
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    // TODO: implement paint
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}