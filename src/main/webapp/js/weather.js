var data = {
    "coord": {
        "lon": 126.5219,
        "lat": 33.5097
    },
    "weather": [{
        "id": 502,
        "main": "Rain",
        "description": "heavy intensity rain",
        "icon": "10d"
    }],
    "base": "stations",
    "main": {
        "temp": 18.96,
        "feels_like": 19.05,
        "temp_min": 18.96,
        "temp_max": 18.96,
        "pressure": 1009,
        "humidity": 82
    },
    "visibility": 6000,
    "wind": {
        "speed": 9.26,
        "deg": 90,
        "gust": 15.43
    },
    "rain": {
        "1h": 5.19
    },
    "clouds": {
        "all": 100
    },
    "dt": 1683181856,
    "sys": {
        "type": 1,
        "id": 8087,
        "country": "KR",
        "sunrise": 1683146601,
        "sunset": 1683195483
    },
    "timezone": 32400,
    "id": 1846266,
    "name": "Jeju City",
    "cod": 200
};

console.log(data); // JSON 객체 출력