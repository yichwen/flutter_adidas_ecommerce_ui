import 'package:adidas_ecommerce_app_ui/data.dart';
import 'package:adidas_ecommerce_app_ui/util.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF696D77), Color(0xFF292C36)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: screenAwareSize(20, context),
              ),
              onPressed: () {},
            ),
            title: Text(
              'Energy Cloud',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenAwareSize(18, context),
                fontFamily: 'Montserrat-Bold',
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  size: screenAwareSize(20, context),
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TopPart(),
              BottomPart(),
            ],
          ),
        ),
      ),
    );
  }
}

class TopPart extends StatefulWidget {
  @override
  _TopPartState createState() => _TopPartState();
}

class _TopPartState extends State<TopPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenAwareSize(300.0, context),
      child: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/adidas.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 70.0,
                  right: 60.0,
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: screenAwareSize(50.0, context),
                    height: screenAwareSize(50.0, context),
                    child: Image.asset("assets/360.png"),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: screenAwareSize(18.0, context),
            bottom: screenAwareSize(15.0, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Rating',
                  style: TextStyle(
                    color: Color(0xFF949598),
                    fontSize: screenAwareSize(10.0, context),
                    fontFamily: 'Montserrat-SemiBold',
                  ),
                ),
                SizedBox(
                  height: screenAwareSize(8.0, context),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: screenAwareSize(8.0, context),
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xFFFFE600),
                    ),
                    SizedBox(
                      width: screenAwareSize(5.0, context),
                    ),
                    Text(
                      '4.5',
                      style: TextStyle(
                        color: Color(0xFFFFE600),
                        fontSize: screenAwareSize(14, context),
                      ),
                    ),
                    SizedBox(
                      width: screenAwareSize(5.0, context),
                    ),
                    Text(
                      '(378 People)',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenAwareSize(12, context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomPart extends StatefulWidget {
  @override
  _BottomPartState createState() => _BottomPartState();
}

class _BottomPartState extends State<BottomPart> {
  bool isExpanded = false;
  int currentSizeIndex = 0;
  int currentColorIndex = 0;
  int _counter = 0;

  void _increase() {
    setState(() {
      _counter++;
    });
  }

  void _decrease() {
    setState(() {
      _counter--;
    });
  }

  void _expand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  List<Widget> colorSelector() {
    List<Widget> colorItemList = new List();
    for (var i = 0; i < colors.length; i++) {
      colorItemList
          .add(colorItem(colors[i], i == currentColorIndex, context, () {
        setState(() {
          currentColorIndex = i;
        });
      }));
    }
    return colorItemList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(18.0, context)),
            child: Text(
              'Product Description',
              style: TextStyle(
                  color: Color(0xFF949598),
                  fontSize: screenAwareSize(10.0, context),
                  fontFamily: "Montserrat-SemiBold"),
            ),
          ),
          SizedBox(
            height: screenAwareSize(8.0, context),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(26.0, context),
                right: screenAwareSize(18.0, context)),
            child: AnimatedCrossFade(
              firstChild: Text(
                desc,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenAwareSize(10.0, context),
                  fontFamily: "Montserrat-Medium",
                ),
              ),
              secondChild: Text(
                desc,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenAwareSize(10.0, context),
                  fontFamily: "Montserrat-Medium",
                ),
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: kThemeAnimationDuration,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(26.0, context),
                right: screenAwareSize(18.0, context)),
            child: GestureDetector(
              onTap: _expand,
              child: Text(
                isExpanded ? 'less' : 'more..',
                style: TextStyle(
                  color: Color(0xFFFB382F),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenAwareSize(12.0, context),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(18.0, context),
                right: screenAwareSize(75.0, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Size",
                  style: TextStyle(
                    color: Color(0xFF949598),
                    fontSize: screenAwareSize(10.0, context),
                    fontFamily: "Montserrat-SemiBold",
                  ),
                ),
                Text(
                  "Quantity",
                  style: TextStyle(
                    color: Color(0xFF949598),
                    fontSize: screenAwareSize(10.0, context),
                    fontFamily: "Montserrat-SemiBold",
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(20.0, context),
                right: screenAwareSize(10.0, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: screenAwareSize(38.0, context),
                  child: Row(
                    children: sizeNumlist.map((item) {
                      var index = sizeNumlist.indexOf(item);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentSizeIndex = index;
                          });
                        },
                        child:
                            sizeItem(item, index == currentSizeIndex, context),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: screenAwareSize(100.0, context),
                    height: screenAwareSize(30.0, context),
                    decoration: BoxDecoration(
                      color: Color(0xFF525663),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: GestureDetector(
                            onTap: _decrease,
                            child: Container(
                              child: Center(
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Montserrat-Bold',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        divider(),
                        Flexible(
                          flex: 3,
                          child: Container(
                            child: Center(
                              child: Text(
                                _counter.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Montserrat-Bold',
                                ),
                              ),
                            ),
                          ),
                        ),
                        divider(),
                        Flexible(
                          flex: 3,
                          child: GestureDetector(
                            onTap: _increase,
                            child: Container(
                              child: Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Montserrat-Bold',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenAwareSize(8.0, context),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(18.0, context)),
            child: Text(
              'Select Color',
              style: TextStyle(
                color: Color(0xFF949598),
                fontSize: screenAwareSize(10.0, context),
                fontFamily: 'Montserrat-SemiBold',
              ),
            ),
          ),
          SizedBox(
            height: screenAwareSize(8.0, context),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(20.0, context),
                right: screenAwareSize(10.0, context)),
            child: Container(
              // margin: EdgeInsets.only(left: screenAwareSize(20.0, context)),
              height: screenAwareSize(34.0, context),
              // width: screenAwareSize(240.0, context),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: colorSelector(),
              ),
            ),
          ),
          SizedBox(
            height: screenAwareSize(8.0, context),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(18.0, context)),
            child: Text(
              'Price',
              style: TextStyle(
                color: Color(0xFF949598),
                fontSize: screenAwareSize(10.0, context),
                fontFamily: 'Montserrat-SemiBold',
              ),
            ),
          ),
          Container(
            height: screenAwareSize(120.0, context),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: screenAwareSize(14.0, context)),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenAwareSize(14.0, context)),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '\$',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenAwareSize(26.0, context),
                                fontFamily: "Montserrat-Medium",
                              ),
                            ),
                            SizedBox(
                              width: screenAwareSize(2.0, context),
                            ),
                            Text(
                              '80',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenAwareSize(35.0, context),
                                fontFamily: "Montserrat-Medium",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenAwareSize(10.0, context),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: MaterialButton(
                          color: Color(0xFFFB382F),
                          padding: EdgeInsets.symmetric(
                            vertical: screenAwareSize(14.0, context),
                          ),
                          onPressed: () {},
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: screenAwareSize(35.0, context),
                                right: screenAwareSize(35.0, context),
                              ),
                              child: Text(
                                'Add To Card',
                                // textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenAwareSize(15.0, context),
                                  fontFamily: 'Montserrat-SemiBold',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: -30.0,
                  bottom: -36.0,
                  child: Image.asset("assets/cart.png",
                      width: screenAwareSize(190.0, context),
                      height: screenAwareSize(155.0, context),
                      fit: BoxFit.cover),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget sizeItem(String size, bool isSelected, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 12.0),
    child: Container(
      width: screenAwareSize(30, context),
      height: screenAwareSize(30, context),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFFFC3930) : Color(0xFF525663),
      ),
      child: Center(
        child: Text(
          size,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat-Bold',
          ),
        ),
      ),
    ),
  );
}

Widget colorItem(
    Color color, bool isSelected, BuildContext context, VoidCallback _ontab) {
  return Padding(
    padding: const EdgeInsets.only(left: 12.0),
    child: GestureDetector(
      onTap: _ontab,
      child: Container(
        width: screenAwareSize(30.0, context),
        height: screenAwareSize(30.0, context),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                        color: Colors.black.withOpacity(.6),
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0))
                  ]
                : []),
        child: ClipPath(
          clipper: MClipper(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: color,
          ),
        ),
      ),
    ),
  );
}

class MClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

Widget divider() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Container(
      width: 0.8,
      color: Colors.black,
    ),
  );
}
