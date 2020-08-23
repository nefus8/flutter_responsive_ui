import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/flutter_responsive_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// You can init all the parameters you want here :
    ResponsiveSize.initValues(
      desktopScaleFactor: 4,
      smallTabletSmallerScaleFactor: 1.17,
    );
    return MaterialApp(
      home: MyHomePage(title: 'Responsive UI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /// You can use the other functions to test if you're on big or small tablet, or just tablet or on desktop
            ResponsiveSize.isMobile(context)
                ? Text("We're on mobile")
                : Text("We're not on mobile"),

            /// Here we use the function getResponsiveSize to change the size of the text depending on the device
            Text("This text has a responsive font size !",
                style: TextStyle(
                    fontSize: ResponsiveSize.getResponsiveSize(context, 15))),

            /// Here is the same as above, but the scale factor will be lower
            Text("This text has a smaller responsive font size !",
                style: TextStyle(
                    fontSize:
                        ResponsiveSize.getSmallerResponsiveSize(context, 15))),
            Container(
              height: ResponsiveSize.getResponsiveSize(context, 500),
              child: GridView.count(
                crossAxisSpacing: ResponsiveSize.getResponsiveSize(context, 10),
                mainAxisSpacing:
                    ResponsiveSize.getSmallerResponsiveSize(context, 10),

                /// Here we use the responsive package to get a responsive cross axis column numbers
                /// We can also specify the starter amount (2 by default on mobile) using the "startColCount" parameter
                /// to get more columns if needed.
                crossAxisCount:
                    ResponsiveSize.responsiveGridColumnCount(context),
                children: [
                  Container(
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                          "This grid view has a responsive crossAxisCount !"),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                          "This grid view has a responsive crossAxisCount !"),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                          "This grid view has a responsive crossAxisCount !"),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                          "This grid view has a responsive crossAxisCount !"),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                          "This grid view has a responsive crossAxisCount !"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
