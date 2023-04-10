import 'package:flutter/material.dart';

class CounterScren extends StatefulWidget {
  const CounterScren({super.key});

  @override
  State<CounterScren> createState() => _CounterScrenState();
}

class _CounterScrenState extends State<CounterScren> {
  int counter = 15;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void restart() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterScren'),
        elevation: 8.2,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Clicks Counter',
              style: fontSize30,
            ),
            Text(
              '$counter',
              style: fontSize30,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActionButton(
        increaseFn: increase,
        decreaseFn: decrease, 
        restartFn: restart,
      ),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function restartFn;

  const CustomFloatingActionButton({
    super.key,
    required this.increaseFn,
    required this.decreaseFn, required this.restartFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.exposure_plus_1),
          onPressed: () => increaseFn(),
        ),

        // const SizedBox(width: 20),

        FloatingActionButton(
          child: const Icon(Icons.restart_alt),
          onPressed: () => restartFn(),
        ),

        FloatingActionButton(
          child: const Icon(Icons.exposure_minus_1),
          onPressed: () => decreaseFn(),
        )
      ],
    );
  }
}
