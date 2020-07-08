'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "d88a965c8e740c356afb80a8b4f52200",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "69ce96a935e7a28b91682fa5f5337823",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/packages/malta/flare/spinning.flr": "2ed440af93816cec71ef324f77bd7ea3",
"assets/packages/malta/flare/check.flr": "b92d77aa4edeb96986a35400651003c1",
"assets/AssetManifest.json": "20b111a772b9bc093d36257813b54fbf",
"assets/LICENSE": "6c613d974e25d43b7faa62728a76a7fb",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"index.html": "023483da4f03dd02c01c0b863786be20",
"/": "023483da4f03dd02c01c0b863786be20"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
