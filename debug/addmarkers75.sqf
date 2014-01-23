// Minor Marker System fixed by Fuchs
while{MissionGoMinor == 1} do { //fix for refresh marker script by *hs-s.com | waTTe - www.banditparty.de
    _MainMarkers75 = createMarker["_MainMarker75", MCoords];
    "_MainMarker75" setMarkerColor "ColorRed";    // Set color of marker
    "_MainMarker75" setMarkerShape "ELLIPSE";        // Set shape of marker
    "_MainMarker75" setMarkerBrush "Grid";        // Set style of marker
    "_MainMarker75" setMarkerAlpha 0.75;        // Set transparency of marker
    "_MainMarker75" setMarkerSize [150,150];        // Set size of marker
sleep 25;
    deleteMarker "_MainMarker75";
};
