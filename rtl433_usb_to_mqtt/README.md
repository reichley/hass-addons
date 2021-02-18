# rtl_433 USB to MQTT Home Assistant add-on
An add-on for a RTL-SDR USB stick tuned to listen for 433MHz (or similar) RF transmissions and republish the data via MQTT

## Usage

1) Install the addon.

2) Use addon configuration to configure:
- mqtt_host
- mqtt_user
- mqtt_password
- mqtt_topic (or leave rtl_433)
- protocol (see https://github.com/merbanan/rtl_433 for more details inc protocol IDs)
- retain (set to 1)


3) Start the addon

**To discover mqtt messages try: ```mosquitto_sub -t "$mqtt_topic/#" -h $mqtt_host -u $mqtt_user -P $mqtt_password -d```**


### Sample MQTT Data from Acurite 5n1 Weather Station
```
Client mosq-xRs3nBy7zc9kYCkWDP received PUBLISH (d0, q0, r0, m0, 'rtl_433/Acurite-5n1/1776/wind_avg_km_h', ... (1 bytes))
0
Client mosq-xRs3nBy7zc9kYCkWDP received PUBLISH (d0, q0, r0, m0, 'rtl_433/Acurite-5n1/1776/wind_dir_deg', ... (4 bytes))
22.5
Client mosq-Vy7IW8bKNOuh844X7v received PUBLISH (d0, q0, r0, m0, 'rtl_433/Acurite-5n1/1776/temperature_F', ... (4 bytes))
53.1
Client mosq-Vy7IW8bKNOuh844X7v received PUBLISH (d0, q0, r0, m0, 'rtl_433/Acurite-5n1/1776/humidity', ... (2 bytes))
99
Client mosq-xRs3nBy7zc9kYCkWDP received PUBLISH (d0, q0, r0, m0, 'rtl_433/Acurite-5n1/1776/rain_in', ... (5 bytes))
15.54
```

## Hardware
- Acurite 5-in-1 https://www.acurite.com/shop-all/weather-instruments/weather-sensors-and-parts/sensors/5-in-1-pro-weather-sensor-temperature-humidity-rainfall-wind-speed-wind-direction-06014rm.html
- $25-30 (costlier than cheap USB dongles but better quality) https://www.rtl-sdr.com/buy-rtl-sdr-dvb-t-dongles/

## Credit
This add-on is based on James Fry's rtl4332mqtt Hass.IO Add-on, which is in turn based on Chris Kacerguis' project here: https://github.com/chriskacerguis/honeywell2mqtt, which is in turn based on Marco Verleun's rtl2mqtt image here: https://github.com/roflmao/rtl2mqtt.