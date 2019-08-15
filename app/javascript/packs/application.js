import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';    // must uncomment the stylesheet_pack_tag in the layout (provided by minimal template)

import { loadDynamicBannerText } from '../components/banner';
loadDynamicBannerText();

import { loadDynamicBannerText2 } from '../components/banner';
loadDynamicBannerText2();

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
