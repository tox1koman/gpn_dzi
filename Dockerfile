FROM ghcr.io/valhalla/valhalla:latest

RUN /bin/bash valhalla_build_config \
--mjolnir-tile-dir /data/tiles \
--mjolnir-tile-extract /data/tiles.tar \
--mjolnir-tile-url file:///data/tiles.tar \
--additional-data /data \
--config /data/valhalla.json

RUN /bin/bash valhalla_build_tiles \
-c /data/valhalla.json \
/data/russia.osm.pbf

RUN /bin/bash valhalla_service \
/data/valhalla.json 1

ENTRYPOINT [ "valhalla_service" ]
CMD [ "/data/valhalla.json", "1"]