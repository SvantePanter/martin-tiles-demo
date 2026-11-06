FROM ghcr.io/maplibre/martin:latest

# Demo extract: Gothenburg, OSM via Protomaps basemap, z0-13
COPY goteborg.pmtiles /data/goteborg.pmtiles

# Martin-imagen har ENTRYPOINT; nollställ den så att CMD blir vårt skal
ENTRYPOINT []
EXPOSE 3000

# Render routes traffic to $PORT
CMD ["/bin/sh", "-c", "exec /usr/local/bin/martin --listen-addresses 0.0.0.0:${PORT:-3000} --webui enable-for-all /data"]
