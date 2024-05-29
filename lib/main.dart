import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  void increment5() {
    setState(() {
      count += 5;
      if (count > 20) {
        count = 20;
      }
    });
  }

  void decrement5() {
    setState(() {
      count -= 5;
      if (count < 0) {
        count = 0;
      }
    });
  }

  bool get isEmpty => count <= 0;
  bool get isFull => count >= 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/image.jpg'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'lotado' : "pode entrar",
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Text(
                count.toString(),
                style: const TextStyle(fontSize: 60, color: Colors.pink),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    //botão ----------------------------------------------------------------------
                    TextButton(
                      onPressed: isEmpty ? null : decrement,
                      style: TextButton.styleFrom(
                          backgroundColor: isEmpty
                              ? Colors.white.withOpacity(0.2)
                              : Colors.white,
                          fixedSize: const Size(100, 100),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      child: const Text(
                        'Saiu',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //botão -------------------------------------------------------------
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: isEmpty
                              ? Colors.white.withOpacity(0.2)
                              : Colors.white,
                          fixedSize: const Size(100, 100),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      onPressed: isEmpty ? null : decrement5,
                      child: const Text(
                        'saiu 5',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    //botão --------------------------------------------------------
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: isFull
                              ? Colors.white.withOpacity(0.2)
                              : Colors.white,
                          fixedSize: const Size(100, 100),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      onPressed: isFull ? null : increment,
                      child: const Text(
                        'entrou',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //botão -----------------------------------------------------------
                    TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: isFull
                                ? Colors.white.withOpacity(0.2)
                                : Colors.white,
                            fixedSize: const Size(100, 100),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                        onPressed: isFull ? null : increment5,
                        child: const Text(
                          'entrou 5',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
