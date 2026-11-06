# martin-tiles-demo

Lokal vektortile-tjänst: [Martin](https://maplibre.org/martin/) + PMTiles, deployad på Render.

- `goteborg.pmtiles` — utsnitt (11.75,57.60,12.15,57.80), z0–13, Protomaps Basemap (OpenStreetMap).
- `Dockerfile` — Martin från `ghcr.io/maplibre/martin`, läser filen i `/data`.

## Endpoints

- `/` — inbyggd web UI (karta + katalog)
- `/catalog` — alla källor som JSON
- `/goteborg` — TileJSON
- `/goteborg/{z}/{x}/{y}` — MVT-brickor

## Byta data

```bash
pmtiles extract https://build.protomaps.com/YYYYMMDD.pmtiles mitt-omrade.pmtiles \
  --bbox=minlon,minlat,maxlon,maxlat --maxzoom=14
```

Lägg filen i repot, ändra namnet i `COPY`-raden, pusha. För Lantmäteriets
Topografi 10: bygg MBTiles med `ogr2ogr -f MVT`, konvertera med
`pmtiles convert`, och lägg in den i stället.

## Attribution

Kartdata © OpenStreetMap-bidragsgivare. Vid användning av Lantmäteriets data: © Lantmäteriet.
