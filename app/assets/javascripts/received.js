function append_message(json) {
  jhtml = '<p><span class="nickname">' + json.user.nickname + '</span><span class="content">' + json.content + '</span></p>';
  $('#messages').prepend(jhtml);
}

function append_marker(json) {
  var marker = createMarker(json.id, '', json.lat, json.lng);
  var infoWindow = createInfoWindow('Wao!', json.user.nickname);
  attachInfoWindow(marker, infoWindow);
  markers.push(marker);
}
