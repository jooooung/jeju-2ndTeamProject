// 서버에서 받아온 JSON 데이터입니다.
const weatherData = {"coord":{"lon":126.5219,"lat":33.5097},"weather":[{"id":502,"main":"Rain","description":"heavy intensity rain","icon":"10d"}],"base":"stations","main":{"temp":18.96,"feels_like":19.05,"temp_min":18.96,"temp_max":18.96,"pressure":1009,"humidity":82},"visibility":6000,"wind":{"speed":9.26,"deg":90,"gust":15.43},"rain":{"1h":5.19},"clouds":{"all":100},"dt":1683181856,"sys":{"type":1,"id":8087,"country":"KR","sunrise":1683146601,"sunset":1683195483},"timezone":32400,"id":1846266,"name":"Jeju City","cod":200};

// 뷰단에서 사용할 DOM 요소들입니다.
const weatherInfoDiv = document.querySelector("#weather-info");

// 날씨 정보를 화면에 표시하는 함수입니다.
function renderWeatherInfo(weatherData) {
  // 날씨 정보를 뷰단에 표시하기 위한 HTML 문자열을 생성합니다.
  const html = `
    <p>현재 기온: ${weatherData.main.temp}도</p>
    <p>현재 습도: ${weatherData.main.humidity}%</p>
    <p>날씨: ${weatherData.weather[0].description}</p>
  `;

  // 날씨 정보를 뷰단에 삽입합니다.
  weatherInfoDiv.innerHTML = html;
}

// 날씨 정보를 렌더링합니다.
renderWeatherInfo(weatherData);
