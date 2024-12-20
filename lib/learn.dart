import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Learn extends StatefulWidget {
  const Learn({super.key});

  @override
  State<Learn> createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  final String name = 'Anya Geraldine';
  String valueDropdown = 'indonesia';
  int _selectedIndex = 0;

  final List<DropdownMenuItem<String>> dataDropdown = [
    const DropdownMenuItem(
      value: 'indonesia',
      child: Text('Indonesia'),
    ),
    const DropdownMenuItem(
      value: 'english',
      child: Text('English'),
    ),
        const DropdownMenuItem(
      value: 'kalbu',
      child: Text('Kalbu'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tugas $name"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "INTRODUCE MY SELF",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/images/fat2.jpg",
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    _rowBiodata("Nama", "Anya Geraldine"),
                    const SizedBox(height: 10),
                    _rowBiodata("Alamat", "Malang"),
                    const SizedBox(height: 10),
                    _rowBiodata("Umur", "22"),
                    const SizedBox(height: 10),
                    _rowBiodata("Divisi", "Capability Center"),
                    const SizedBox(height: 10),
                    _rowBiodata("Harapan", "Banyak Duit"),
                  ],
                ),
                const SizedBox(height: 28),
                const Center(
                  child: Text(
                    "Hobbies",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _hobbyButton(
                      context,
                      "assets/images/kuliner.jpg",
                      "Sapo Tahu Solaria The Best Sih",
                      "Makan",
                    ),
                    _hobbyButton(
                      context,
                      "assets/images/nonton.jpg",
                      "Menjadi Wibu adalah KUNCI",
                      "Nonton",
                    ),
                    _hobbyButton(
                      context,
                      "assets/images/jalan.jpg",
                      "Menghabiskan uang adalah PASSION",
                      "Jalan Jalan",
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  "Social Media",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        _launchUrl("https://www.linkedin.com/in/fatimah-azhr16/");
                      },
                      icon: const Icon(
                        // Icons.facebook_rounded,
                        FontAwesomeIcons.linkedin,
                        color: Colors.blue,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _launchUrl("https://www.instagram.com/fatimah.azhr_/");
                      },
                      icon: const Icon(
                        FontAwesomeIcons.instagram,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                DropdownButton<String>(
                  value: valueDropdown,
                  items: dataDropdown,
                  onChanged: (value) {
                    setState(() {
                      valueDropdown = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                const RadioExample(), 
               RichText(
                  text: const TextSpan(text: 'Hello'),
                  selectionRegistrar: SelectionContainer.maybeOf(context),
                  selectionColor: const Color(0xAF6694e8),
                ),
               

              ],
              
            ),
          ),
        ),
         bottomNavigationBar: BottomNavigationBar(items:[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.badge), label: 'Product'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Profile'),
         ],
         currentIndex: _selectedIndex,
         selectedItemColor: Colors.red,
         unselectedItemColor: Colors.grey,
         onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
         },
         ),
      ),
    );
  }

  Widget _rowBiodata(String title, String value) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 10),
        const Text(":"),
        const SizedBox(width: 10),
        Expanded(
          child: Text(value),
        ),
      ],
    );
  }

  Widget _hobbyButton(BuildContext context, String imagePath, String text, String buttonText) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Tutup"),
                ),
              ],
            );
          },
        );
      },
      child: Text(buttonText),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}

enum SingingCharacter { lafayette, jefferson }

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Kucing'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Anjing'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
