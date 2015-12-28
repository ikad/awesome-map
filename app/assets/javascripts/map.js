var map = null;         // マップインスタンス
var markers = [];       // マーカーのインスタンスを格納する配列

document.addEventListener("DOMContentLoaded", function() {

  function setDefaultPosition(position) {
    map.panTo(new google.maps.LatLng(position.coords.latitude, position.coords.longitude));
  }

  // 地図のオプション
  mapOptions = {
    zoom: 15 ,        // ズーム値
    center: new google.maps.LatLng(35.658582, 139.745430) ,       // 初期値中心座標（東京）
    streetViewControl: false ,
  };

  var canvas = document.getElementById('map-canvas');             // キャンパス
  map = new google.maps.Map(canvas , mapOptions);                 // マップ作成

  navigator.geolocation.getCurrentPosition(setDefaultPosition);   // 現在地を中心にする

  // 中心座標変更時イベント
  // google.maps.event.addListener( map , 'center_changed' , function(event) {
  //   clat = map.getCenter().lat();
  //   clng = map.getCenter().lng();
  //   console.log(clat, clng);
  // });
});

function createMarker(id, title, lat, lng) {
  var m = new google.maps.Marker({
    id: id,
    title: title,
    map: map,
    position: new google.maps.LatLng(lat, lng),
  });
  return m;
}

function createInfoWindow(content, owner) {
  var iw = new google.maps.InfoWindow({
    content: content + '<br>posted by : ' + owner
  });
  return iw;
}

function attachInfoWindow(marker, infoWindow) {
  google.maps.event.addListener(marker, 'click', function(){
    infoWindow.open(map, marker);
  });

  google.maps.event.addListener(marker, 'dblclick', function(){
    App.talk.delete(marker.id);
    marker.setMap(null);
  });
}
