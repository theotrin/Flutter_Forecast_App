import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_forecast/models/weather.dart';
import 'package:http/http.dart' as http;

class WellcomeScreen extends StatefulWidget {
  const WellcomeScreen({super.key});

  @override
  State<WellcomeScreen> createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
  final List<String> states = [
    'Acre (AC)',
    'Alagoas (AL)',
    'Amapá (AP)',
    'Amazonas (AM)',
    'Bahia (BA)',
    'Ceará (CE)',
    'Distrito Federal (DF)',
    'Espírito Santo (ES)',
    'Goiás (GO)',
    'Maranhão (MA)',
    'Mato Grosso (MT)',
    'Mato Grosso do Sul (MS)',
    'Minas Gerais (MG)',
    'Pará (PA)',
    'Paraíba (PB)',
    'Paraná (PR)',
    'Pernambuco (PE)',
    'Piauí (PI)',
    'Rio de Janeiro (RJ)',
    'Rio Grande do Norte (RN)',
    'Rio Grande do Sul (RS)',
    'Rondônia (RO)',
    'Roraima (RR)',
    'Santa Catarina (SC)',
    'São Paulo (SP)',
    'Sergipe (SE)',
    'Tocantins (TO)',
  ];

  String? selectedState;
  String? selectedStateAbbreviation;
  String? city_name;
  bool result = false;
  Weather? weatherResponse = Weather.defaultValues();

  Future<Weather> fetchWeather() async {
    final response = await http.get(Uri.parse(
        'https://api.hgbrasil.com/weather?key=8799492e&city_name=$city_name,$selectedStateAbbreviation'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final jsonData = json.decode(response.body);
      return Weather.fromJson(jsonData);
    } else {
      throw Exception('Failed to load weather data');
      weatherResponse = Weather.defaultValues();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'City name',
                  hintText: 'Curitiba / São Paulo',
                ),
                onChanged: (value) => city_name = value,
              ),
              SizedBox(height: 20), // Spacing between fields
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Select your state',
                ),
                value: selectedState,
                items: states.map((String state) {
                  return DropdownMenuItem<String>(
                    value: state,
                    child: Text(state),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedState = newValue;
                    // Extract the state abbreviation
                    selectedStateAbbreviation =
                        newValue?.split('(').last.replaceAll(')', '');
                  });
                },
              ),
              SizedBox(height: 20),
              if (result != false)
                Column(
                  children: [
                    Text(
                      'City Name: ${this.weatherResponse?.cityName}\nDescription: ${this.weatherResponse?.description}\nHumidity: ${this.weatherResponse?.humidity}%\nWind speed: ${this.weatherResponse?.windSpeedy}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Text(
                          'Max: ${this.weatherResponse?.forecast[0].max}°',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Min: ${this.weatherResponse?.forecast[0].min}°',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),

              TextButton(
                  onPressed: () async {
                    //Album albumResponse = await fetchAlbum();
                    weatherResponse = await fetchWeather();
                    setState(() {
                      result = true;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.blue),
                    foregroundColor:
                        WidgetStateProperty.all<Color>(Colors.white),
                    padding: WidgetStateProperty.all<EdgeInsets>(
                        EdgeInsets.only(left: 30, right: 30)),
                  ),
                  child: Text('View forecast!'))
            ],
          ),
        ),
      ),
    );
  }
}
