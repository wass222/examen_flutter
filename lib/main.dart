import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ANALYSE VOYELLE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: VowelAnalysisScreen(),
    );
  }
}

class VowelAnalysisScreen extends StatefulWidget {
  @override
  _VowelAnalysisScreenState createState() => _VowelAnalysisScreenState();
}

class _VowelAnalysisScreenState extends State<VowelAnalysisScreen>
    with SingleTickerProviderStateMixin {
  String word = '';
  int aCount = 0;
  int eCount = 0;
  int iCount = 0;
  int oCount = 0;
  int uCount = 0;
  int yCount = 0;
  int consonantCount = 0;

  late AnimationController _animationController;
  late Animation<double> _buttonScaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    _buttonScaleAnimation =
        Tween<double>(begin: 1.0, end: 0.9).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ANALYSE VOYELLE'),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16.0),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
      
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'ANALYSE VOYELLE',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter a word',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 54, 133, 244),
                        width: 2.0, // Make the border width bold
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      word = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _buttonScaleAnimation.value,
                      child: ElevatedButton(
                        onPressed: () {
                          _animationController.forward(from: 0.0);
                          analyzeWord(word);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ), // Add border color
                            ),
                          ),
                        ),
                        child: Text('Analyze'),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(8.0), // Border radius
                  ),
                  child: ColoredBox(
                    color: Colors.redAccent, // Change background color
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'A: $aCount occurrences',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(8.0), // Border radius
                  ),
                  child: ColoredBox(
                    color: Colors.greenAccent, // Change background color
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'ε: $eCount occurrences',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(8.0), // Border radius
                  ),
                  child: ColoredBox(
                    color: Colors.blueAccent, // Change background color
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'I: $iCount occurrences',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(8.0), // Border radius
                  ),
                  child: ColoredBox(
                    color: Colors.orangeAccent, // Change background color
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'O: $oCount occurrences',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(8.0), // Border radius
                  ),
                  child: ColoredBox(
                    color: Colors.purpleAccent, // Change background color
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'U: $uCount occurrences',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(8.0), // Border radius
                  ),
                  child: ColoredBox(
                    color: Colors.yellowAccent, // Change background color
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Y: $yCount occurrences',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2.0, // Border
                  ),
                  borderRadius: BorderRadius.circular(8.0), // Border radius
                ),
                child: ColoredBox(
                  color: Colors.tealAccent, // Change background color
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Consonants: $consonantCount occurrences',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

void analyzeWord(String word) {
  setState(() {
    this.word = word;
    aCount = word.replaceAll(RegExp(r'[^aA]'), '').length;
    eCount = word.replaceAll(RegExp(r'[^eE]'), '').length;
    iCount = word.replaceAll(RegExp(r'[^iI]'), '').length;
    oCount = word.replaceAll(RegExp(r'[^oO]'), '').length;
    uCount = word.replaceAll(RegExp(r'[^uU]'), '').length;
    yCount = word.replaceAll(RegExp(r'[^yY]'), '').length;
    consonantCount = word.replaceAll(RegExp(r'[aeiouyAEIOUY]'), '').length;
  });
}

@override
void dispose() {
  _animationController.dispose();
  super.dispose();
}
}
