import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  final String jsonWeatherData = '''
    [
      {
        "city": "New York",
        "temperature": 20,
        "condition": "Clear",
        "humidity": 60,
        "windSpeed": 5.5
      },
      {
        "city": "Los Angeles",
        "temperature": 25,
        "condition": "Sunny",
        "humidity": 50,
        "windSpeed": 6.8
      },
      {
        "city": "London",
        "temperature": 15,
        "condition": "Partly Cloudy",
        "humidity": 70,
        "windSpeed": 4.2
      },
      {
        "city": "Tokyo",
        "temperature": 28,
        "condition": "Rainy",
        "humidity": 75,
        "windSpeed": 8.0
      },
      {
        "city": "Sydney",
        "temperature": 22,
        "condition": "Cloudy",
        "humidity": 55,
        "windSpeed": 7.3
      }
    ]
  ''';

  @override
  Widget build(BuildContext context) {
    List<WeatherData> weatherDataList = parseWeatherData(jsonWeatherData);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Weather Info App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: weatherDataList.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              title: Text('City: ${weatherDataList[index].city}',
                  style: const TextStyle(fontSize: 20)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Temperature: ${weatherDataList[index].temperature}°C',
                    style: const TextStyle(color: Colors.grey, fontSize: 16,),
                  ),
                  Text('Condition: ${weatherDataList[index].condition}',
                      style: const TextStyle(color: Colors.grey, fontSize: 16,)),
                  Text('Humidity: ${weatherDataList[index].humidity}%',
                      style: const TextStyle(color: Colors.grey, fontSize: 16,)),
                  Text('Wind Speed: ${weatherDataList[index].windSpeed} m/s',
                      style: const TextStyle(color: Colors.grey, fontSize: 16,)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<WeatherData> parseWeatherData(String jsonStr) {
    List<dynamic> parsedJson = json.decode(jsonStr);
    return parsedJson.map((json) => WeatherData.fromJson(json)).toList();
  }
}

class WeatherData {
  final String city;
  final int temperature;
  final String condition;
  final int humidity;
  final double windSpeed;

  WeatherData({
    required this.city,
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      city: json['city'],
      temperature: json['temperature'],
      condition: json['condition'],
      humidity: json['humidity'],
      windSpeed: json['windSpeed'].toDouble(),
    );
  }
}
