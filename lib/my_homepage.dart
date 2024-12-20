import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
    
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
 
        title: Text(widget.title),
      ),
      body: Center(
   
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
            'Toyota image assets',
             style: TextStyle(
              fontSize: 15.0, // Mengatur ukuran font
              color: Colors.red, // Mengatur warna teks
            ),
            ),

            Image.asset(
            'assets/images/toyota.png',
            width: 100,
            height:100,
            ),

            const Text(
              'Toyota image network',
            ),

            Image.network(
            'https://newtpm.s3-ap-southeast-1.amazonaws.com/vehicles/colors/img_32_1301_platinum_white_pearl-attitude_black.png',
            width: 300,
            height:180,
            
            loadingBuilder: (context, child, loadingProgress){
              if(loadingProgress==null) return child;
              return CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes!= null
                ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
                :null,
              );
            },
            errorBuilder: (context, error, stackTrace){
              return const Icon(Icons.error);
            },
            fit: BoxFit.cover,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.mail),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}