import 'package:flutter/material.dart';

import 'package:provider_overview_03/models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider 03',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dog = Dog(name: 'dog03', bread: 'bread03');

  @override
  void initState() {
    super.initState();
    dog.addListener(dogListener);
  }

  void dogListener() {
    print('age lister: ${dog.age}');
  }

  @override
  void dispose() {
    dog.removeListener(dogListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider 03'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '- name: ${dog.name}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            BreedAndAge(
              dog: dog,
            )
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  final Dog dog;
  const BreedAndAge({
    Key? key,
    required this.dog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- breed : ${dog.bread}',
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Age(
          dog: dog,
        )
      ],
    );
  }
}

class Age extends StatelessWidget {
  final Dog dog;
  const Age({
    Key? key,
    required this.dog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- age: ${dog.age}',
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
            onPressed: () => dog.grow(),
            child: const Text(
              'Grow',
              style: TextStyle(fontSize: 20.0),
            ))
      ],
    );
  }
}
