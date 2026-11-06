FROM ghcr.io/maplibre/martin:latest

# Demo extract: Gothenburg, OSM via Protomaps basemap, z0-13
COPY goteborg.pmtiles /data/goteborg.pmtiles

ENV PORT=3000

# Martin-imagen har ENTRYPOINT; nollställ den så att CMD blir vårt skal
ENTRYPOINT []
EXPOSE 3000

# Render routes traffic to $PORT
CMD ["/bin/sh", "-c", "exec /usr/local/bin/martin --listen 0.0.0.0:${PORT} --webui enable-for-all /data"]
