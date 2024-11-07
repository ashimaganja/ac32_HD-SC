import 'package:flutter/material.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});

  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  bool showLeftColumn = true;
  bool showRightColumn = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left Column with Drawer Button

        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: showLeftColumn ? 300.0 : 50.0,  // 200 when expanded, 50 when collapsed
          color: Colors.blueGrey,
          child: Column(

            children: <Widget>[
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.black54,
                child: IconButton(
                  icon: Icon(showLeftColumn ? Icons.keyboard_double_arrow_left :Icons.keyboard_double_arrow_right),
                    color: Colors.white,
                    onPressed: () {
                    setState(() {
                    showLeftColumn = !showLeftColumn;
                      });
                    },
                ),
              ),
              if (showLeftColumn)
                Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.black,
                  padding: const EdgeInsets.all(8.0),
                  child:
                  const  FittedBox(
                    fit:BoxFit.scaleDown,
                    child: const Text(
                        "Settings Panel",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    )

                )
              else
                RotatedBox(quarterTurns: 3,
                  child: Container(
                    color: Colors.blueGrey,
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: const Text(
                      "Settings Panel",
                      style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      textAlign: TextAlign.center,
                      ),
                    ),
                ),
              if (showLeftColumn)
                 Expanded(
                    //child: Center(
                    // child: Text(
                    //   "Left Column Content",
                    //   style: TextStyle(color: Colors.white),
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                      child: ListView(
                        children: <Widget>[
                          Padding(padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black26, // Use MaterialStateProperty.all
                                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                                ),
                                child: const Text("Connect",
                                  style: TextStyle(color: Colors.white, fontSize: 30),
                                  textAlign: TextAlign.justify,)),
                          )
                            ,)

                        ],
                    ),
                  ),
               // ),
            ],
          ),
        ),





        // Middle Column (Expands relative to other columns)
        Expanded(

            child: Column(

              children: [
                Container(
                  color: Colors.blueGrey[800],
                  child:
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 80),
                      child: Container(
                      height: 300,
                      width: double.infinity,
                      padding: EdgeInsets.all(16.0),
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.blue[900]!),
                      ),
                      child: const Text(
                        "No Channel Selected",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),),),
                  ),

          ],
        )

        ),





        // Right Column with Drawer Button
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: showRightColumn ? 300.0 : 50.0,  // 200 when expanded, 50 when collapsed
          color: Colors.blueGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.black54,
                child: IconButton(
                  icon: Icon(showRightColumn ? Icons.keyboard_double_arrow_right :Icons.keyboard_double_arrow_left),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      showRightColumn = !showRightColumn;
                    });
                  },
                ),),
              if (showRightColumn)
                Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.black,
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    "Control Panel",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                )else
                RotatedBox(quarterTurns: 3,
                  child: Container(
                    color: Colors.blueGrey,
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: const Text(
                      "Control Panel",
                      style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              if (showRightColumn)
                 Expanded(
                  child: Center(
                    child: ListView(
                      children: <Widget>[
                        Padding(padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green, // Use MaterialStateProperty.all
                                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                                ),
                                child: const Text("Start",
                                  style: TextStyle(color: Colors.white, fontSize: 30),
                                  textAlign: TextAlign.justify,)),
                          )
                          ,),
                        Padding(padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent, // Use MaterialStateProperty.all
                                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                                ),
                                child: const Text("Load",
                                  style: TextStyle(color: Colors.white, fontSize: 30),
                                  textAlign: TextAlign.justify,)),
                          )
                          ,)


                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

