# RTL433 to MQTT Home Assistant add-on
An add-on for a software defined radio tuned to listen for 433MHz (or similar) RF transmissions and republish the data via MQTT

## Usage

1) Install the addon.

2) Use addon configuration to configure:
- mqtt_host
- mqtt_user
- mqtt_password
- mqtt_topic
- protocol (see https://github.com/merbanan/rtl_433 for more details inc protocol IDs)
- retain


3) Start the addon


## Sample MQTT Data from Acurite 5n1 Weather Station
```
Client mosq-xRs3nBy7zc9kYCkWDP received PUBLISH (d0, q0, r0, m0, 'rtl_433/Acurite-5n1/1776/time', ... (19 bytes))
2020-10-04 17:44:39
Client mosq-xRs3nBy7zc9kYCkWDP received PUBLISH (d0, q0, r0, m0, 'rtl_433/Acurite-5n1/1776/id', ... (4 bytes))
1776
Client mosq-xRs3nBy7zc9kYCkWDP received PUBLISH (d0, q0, r0, m0, 'rtl_433/Acurite-5n1/1776/channel', ... (1 bytes))
C
Client mosq-xRs3nBy7zc9kYCkWDP received PUBLISH (d0, q0, r0, m0, 'rtl_433/Acurite-5n1/1776/sequence_num', ... (1 bytes))
2
Client mosq-xRs3nBy7zc9kYCkWDP received PUBLISH (d0, q0, r0, m0, 'rtl_433/Acurite-5n1/1776/battery_ok', ... (1 bytes))
0
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
Client mosq-xRs3nBy7zc9kYCkWDP received PUBLISH (d0, q0, r0, m0, 'rtl_433/Acurite-5n1/1776/mic', ... (8 bytes))
CHECKSUM
```

## Hardware
- Acurite 5-in-1 https://www.acurite.com/shop-all/weather-instruments/weather-sensors-and-parts/sensors/5-in-1-pro-weather-sensor-temperature-humidity-rainfall-wind-speed-wind-direction-06014rm.html
- $25-30 (costlier than cheap USB dongles but better quality) https://www.rtl-sdr.com/buy-rtl-sdr-dvb-t-dongles/