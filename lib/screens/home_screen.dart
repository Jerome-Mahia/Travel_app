import 'package:flutter/material.dart';
import 'package:travel_app/data/data.dart';
import 'package:travel_app/screens/destination_screens.dart';
import 'package:travel_app/models/destination.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;

  bool isAnimating = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 5, vsync: this);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: ()=> changeIcon(),
              child: AnimatedIcon(
                size: 40,
              icon: AnimatedIcons.menu_close,
              color: Colors.black,
              progress: _animationController,
               ),
             ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                color: Colors.black,
                onPressed: () {},
                iconSize: 40,
                icon: Icon(
                  Icons.account_box_rounded,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Discover',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Explore the best places in the world!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                    color: Color.fromRGBO(165, 167, 172, 1),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20),
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        borderSide: const BorderSide(width: 0.8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        borderSide: BorderSide(
                          width: 0.8,
                          color: Color.fromRGBO(255, 238, 238, 1),
                        ),
                      ),
                      hintText: 'Search your trip',
                      suffixIcon: Container(
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 13,
                            top: 12,
                          ),
                          child: GestureDetector(
                            onTap: ()=> changeIcon(),
                            child: AnimatedIcon(
                            icon: AnimatedIcons.search_ellipsis,
                            color: Colors.white,
                            progress: _animationController,
                          ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left:8.0),
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
                    Tab(text: "All"),
                    Tab(text: "America"),
                    Tab(text: "Europe"),
                    Tab(text: "Asia"),
                    Tab(text: "Oceania"),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: SizedBox(
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: all_destinations.length,
                itemBuilder: (BuildContext context, index) {
                  Destination destination = all_destinations[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DestinationScreen(
                                      destination: destination,
                                    )),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Hero(
                              tag: destination.mainImageUrl,
                              child: Image(
                                image: AssetImage(destination.mainImageUrl),
                                height: 270.0,
                                width: 210.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  '${destination.title} \nStarting at \$${destination.price}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 35,
                              margin: EdgeInsets.only(top: 210),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite,
                                  size: 25,
                                ),
                                color: Theme.of(context).primaryColor,
                                iconSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Popular Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/icons/icons8-airplane-take-off-100.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/icons/icons8-building-100.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/icons/icons8-car-50.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/icons/icons8-confetti-100.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Row(
              children: [
                Text(
                  'Trips',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    letterSpacing: 0.8,
                    color: Color.fromRGBO(165, 167, 172, 1),
                  ),
                ),
                SizedBox(
                  width: 49,
                ),
                Text(
                  'Hotel',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    letterSpacing: 0.8,
                    color: Color.fromRGBO(165, 167, 172, 1),
                  ),
                ),
                SizedBox(
                  width: 23,
                ),
                Text(
                  'Transport',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    letterSpacing: 0.8,
                    color: Color.fromRGBO(165, 167, 172, 1),
                  ),
                ),
                SizedBox(
                  width: 29,
                ),
                Text(
                  'Events',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    letterSpacing: 0.8,
                    color: Color.fromRGBO(165, 167, 172, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void changeIcon() {
//rebuilds UI with changing icon.
    setState(() {
      isAnimating = !isAnimating;
      isAnimating
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }
//disposes AnimationController.
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
