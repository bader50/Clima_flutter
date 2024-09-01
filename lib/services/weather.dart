import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const API_key = '65984056a16e0a4251e3e110e72a5841';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
      uri: Uri.https(
        'api.openweathermap.org',
        'data/2.5/weather',
        {'q': cityName, 'units': 'metric', 'appid': API_key},
      ),
    );

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
      uri: Uri.https(
        'api.openweathermap.org',
        'data/2.5/weather',
        {
          'lat': '${location.latitude}',
          'lon': '${location.longitude}',
          'units': 'metric',
          'appid': API_key
        },
      ),
    );

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
