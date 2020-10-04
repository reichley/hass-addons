# RTL433 to MQTT Bridge hass.io addon
A hass.io addon for a software defined radio tuned to listen for 433MHz RF transmissions and republish the data via MQTT

This hass.io addon is based on Chris Kacerguis' project here: https://github.com/chriskacerguis/honeywell2mqtt,
which is in turn based on Marco Verleun's rtl2mqtt image here: https://github.com/roflmao/rtl2mqtt,
which is based on James Fry's project here: https://github.com/james-fry/hassio-addons/tree/master/rtl4332mqtt

## Usage

1) Install the addon.

2) Use addon configuration to configure:
- mqtt_host
- mqtt_user
- mqtt_password
- mqtt_topic
- protocol (see https://github.com/merbanan/rtl_433 for more details inc protocol IDs)

3) Copy rtl2mqtt.sh to your hass.io config dir in a subdir called rtl4332mqtt.
i.e.
.../config/rtl4332mqtt/rtl2mqtt.sh
This allows you to edit the start script if you need to make any changes

4) Start the addon


## MQTT Data
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

This has been tested and used with the following hardware (you can get it on Amazon)

Chris:
- Honeywell Ademco 5818MNL Recessed Door Transmitter
- 5800MINI Wireless Door/Window Contact by Honeywell
- NooElec NESDR Nano 2+ Tiny Black RTL-SDR USB

James:
- CurrentCost TX: http://www.ebay.co.uk/itm/Current-Cost-Envi-R-Energy-Monitor-Smart-Electric-Meter-/152084708754
- Super cheap RTL dongle: http://www.ebay.co.uk/itm/Mini-USB-DVB-T-RTL-SDR-Realtek-RTL2832U-R820T-Stick-Receiver-Dongle-MCX-Input-PK/222637370515

Me:
- Acurite 5-in-1 https://www.acurite.com/shop-all/weather-instruments/weather-sensors-and-parts/sensors/5-in-1-pro-weather-sensor-temperature-humidity-rainfall-wind-speed-wind-direction-06014rm.html
- $25-30 (costlier than cheap USB dongles but better quality) https://www.rtl-sdr.com/buy-rtl-sdr-dvb-t-dongles/

## Troubleshooting

If you see this error:

> Kernel driver is active, or device is claimed by second instance of librtlsdr.
> In the first case, please either detach or blacklist the kernel module
> (dvb_usb_rtl28xxu), or enable automatic detaching at compile time.

Then run the following command on the host

```bash
sudo rmmod dvb_usb_rtl28xxu rtl2832
```
