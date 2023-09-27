<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Weather App</title>
  <script src="https://kit.fontawesome.com/a9d42fc68f.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="Weather.css">
</head>
<body>
  <div class="card">
    <div class="search">
      <input type="text" placeholder="enter city name" spellcheck="false">
      <button><img src="images/search.png.jpg"></button>
    </div>
    <div class="error">
      <p>invalid city name</p>
    </div>
    <div class="weather">
      <img src="images/rain.png.jpg" class="rain-icon">
      <h1 class="temp">22&deg;c</h1>
      <h2 class="city">Uyo</h2>
      <div class="details">
        <div class="col">
          <img src="images/humidity.png.jpg">
          <div>
            <p class="humidity">50%</p>
            <p>Humidity</p>
          </div>
        </div>
        <div class="col">
          <img src="images/wind.png.jpg">
          <div>
            <p class="wind">15 km/h</p>
            <p>Wind Speed</p>
          </div>
        </div>
      </div>
    </div>
  </div>

<script>
  const apiKey = "https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}" 
  const apiUrl = "https://api.openweathermap.org/data/2.5/weather?units=uyo";

  const searchBox = document.querySelector(".search input");
  const searchButton = document.querySelector(".search button");
  const weathericon = document.querySelector(".weatherIcon");
  
  
  async function checkWeather(city){
    const response = await fetch(apiUrl + city + '&appid-${apiKey}');
    var data = await response.json();

    if(response.status == 404){
      document.querySelector(".error").style.display = "block";
      document.querySelector(".weather").style.display = "none"
    }else{
      document.querySelector(".city").innerHTML = data.name;
     document.querySelector(".temp").innerHTML = Math.round(data.main.temp) + "22&deg;c";
     document.querySelector(".humidity").innerHTML = data.main.humidity + "%";
     document.querySelector(".wind").innerHTML = data.wind.speed + "km/h";

    if(data.weather[0].main == "clouds"){
      weatherIcon.src = "images/clouds.png";
    }

    else if(data.weather[0].main == "clear"){
      weatherIcon.src = "images/clear.png"
    }

    else if(data.weather[0].main == "Rain"){
      weatherIcon.src = "images/rain.png"
    }

    else if(data.weather[0].main == "Drizzle"){
      weatherIcon.src = "images/drizzle.png"
    }

    else if(data.weather[0].main == "Mist"){
      weatherIcon.src = "images/mist.png"
    }
    }
     
    document.querySelector(".weather").style.display = "block"
    document.querySelector(".error").style.display = "none"
  }

  searchButton.addEventListener("click", ()=>{
    checkWeather(searchBox.value);
  })
  checkWeather();


</script>
</body>
</html>
