// MapComponent.js
import { YMaps, Map, Placemark } from '@pbe/react-yandex-maps';
import {useOrgsStore} from "@/stores/orgs-store.ts";

export const YandexMap = () => {
  // Sample points data
  const { orgs } = useOrgsStore();

  const mapState = {
    center: [55.751574, 37.573856],
    zoom: 4,
  };

  return (
    <div style={{ height: '100vh', width: '100%' }}>
      <YMaps query={{ apikey: '6eff2772-bb79-45df-b43d-2735c0e4aab9' }}>
        <Map state={mapState} width="100%" height="100%">
          {orgs.map((org) => (
            <Placemark
              key={org.name}
              geometry={[org.coordinates?.latitude, org.coordinates?.longitude]}
              properties={{
                balloonContent: `
                  <strong>${org.name}</strong>
                  <p>${org.description}</p>
                `,
              }}
              options={{
                preset: 'islands#blueIcon', // Different icon colors
              }}
              modules={['geoObject.addon.balloon']}
            />
          ))}
        </Map>
      </YMaps>
    </div>
  );
};