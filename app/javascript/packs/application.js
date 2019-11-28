import "bootstrap";

import { showMoreIfActor } from '../components/signup';
showMoreIfActor();

import { initAutocomplete } from '../plugins/init_autocomplete';
initAutocomplete();

import { newService } from '../plugins/new_service';
newService();

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { insertMapHTML } from '../plugins/init_mapbox';
insertMapHTML();
