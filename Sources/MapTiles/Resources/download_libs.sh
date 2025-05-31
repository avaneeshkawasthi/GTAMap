#!/bin/bash

# Download Leaflet CSS
curl -o leaflet.css https://unpkg.com/leaflet@1.9.4/dist/leaflet.css

# Download Leaflet JS
curl -o leaflet.js https://unpkg.com/leaflet@1.9.4/dist/leaflet.js

# Download jQuery (Note: You had 1.0.4 but that's very old, using latest 3.x version)
curl -o jquery-3.7.1.min.js https://code.jquery.com/jquery-3.7.1.min.js
