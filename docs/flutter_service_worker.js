'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "0532b74e15cef0a58b6822d522bc3e13",
"index.html": "90b1b475c69a08b12b491e150422e8dd",
"/": "90b1b475c69a08b12b491e150422e8dd",
"main.dart.js": "32119792c12f4abf52073b4617b65500",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"icons/favicon-16x16.png": "65f2b3467dba509d6912cbe81fa711f1",
"icons/favicon.ico": "20e890876969b4cb659bef6d41138cca",
"icons/apple-icon.png": "0e96983e0d80b4857678d2deab7519e5",
"icons/apple-icon-144x144.png": "8758af4d849869e6753a094b62104f7b",
"icons/android-icon-192x192.png": "6a9e2dd0db981d739bce89f9f451512d",
"icons/apple-icon-precomposed.png": "0e96983e0d80b4857678d2deab7519e5",
"icons/apple-icon-114x114.png": "28c67815b209b6642b8f59c91e4bc08c",
"icons/apple-icon-57x57.png": "815afb3afd6003b374d76bb8a65b1729",
"icons/apple-icon-152x152.png": "ffb5af356b1f6c631a6035521b16e4f9",
"icons/android-icon-72x72.png": "430c660f7fd4bbd7e35f8a92205ae46e",
"icons/android-icon-96x96.png": "f247c74645a59325f2a742d74e70fdcc",
"icons/android-icon-36x36.png": "cf3b3a1414069a1082178988aec24c60",
"icons/apple-icon-180x180.png": "24258d558075ddf5de18e8b099098d45",
"icons/favicon-96x96.png": "1dca29f36bc22b30e155824a4f2560da",
"icons/android-icon-48x48.png": "709e9b1f6309d1916a5e7f0c9560cdf8",
"icons/apple-icon-76x76.png": "90f6c48c39be66a897fab9414049a756",
"icons/apple-icon-60x60.png": "8b70187e79c667dc564e0d547a6493d1",
"icons/android-icon-144x144.png": "8758af4d849869e6753a094b62104f7b",
"icons/apple-icon-72x72.png": "430c660f7fd4bbd7e35f8a92205ae46e",
"icons/apple-icon-120x120.png": "61ae37a66d3264e688ecd1bd1805a5f6",
"icons/favicon-32x32.png": "49f42069bd42d0ba5da8df2598a88f46",
"manifest.json": "47182491a5c71d5f821d3e3b131998ae",
"assets/AssetManifest.json": "b37bb21e81bb78b1f71ac8f71f36b47d",
"assets/NOTICES": "c9d1408c399831e351cbf3d837c087f1",
"assets/FontManifest.json": "3ddd9b2ab1c2ae162d46e3cc7b78ba88",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "efc6c90b58d765987f922c95c2031dd2",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "01bb14ae3f14c73ee03eed84f480ded9",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "0db203e8632f03baae0184700f3bda48",
"assets/packages/animated_flight_paths/assets/robinson/world_outline.svg": "ba9637098fdf14b96de282e1ee63acae",
"assets/packages/animated_flight_paths/assets/robinson/world_fill.svg": "c26db9cf7c913d13891a5ec99f86c1a7",
"assets/packages/animated_flight_paths/assets/mercator/world_outline.svg": "346c2fd8df66f6c20e440e66140446e2",
"assets/packages/animated_flight_paths/assets/mercator/world_fill.svg": "51fcf2ea03a1b4cf7f6bbc64db64234a",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "1230412abdac86b8309776b84d3bf264",
"assets/fonts/MaterialIcons-Regular.otf": "62ec8220af1fb03e1c20cfa38781e17e",
"assets/assets/images/brands/manao.png": "0fafdc661eefe801db52b22f791bac2d",
"assets/assets/images/brands/ascend.png": "968e739beb74a0fdd13edadc909f9700",
"assets/assets/images/brands/rabbit_rewards.png": "26289df45a137b8e2f3473e493f75bb2",
"assets/assets/images/brands/roojai.png": "8fefb851bba05314a606b9b4c15964b8",
"assets/assets/images/brands/georgie_lou.png": "c0309cc191245a864a398a28c3a8291a",
"assets/assets/images/brands/the_cabin.png": "f466eb56dfa2fc9f766faa91bb7ed1c2",
"assets/assets/images/brands/lotuss.png": "13c9c068f110bc4c0800e6eeafb38830",
"assets/assets/images/brands/braincloud.png": "1848e017196fe48de20c09d5960d971d",
"assets/assets/images/brands/egg_digital.png": "8a79d984ada9fa63069858d709271ddc",
"assets/assets/images/brands/aware.png": "b303495067f119ce9afa68c14e6e588c",
"assets/assets/images/projects/multi_border.png": "084120fd690e36fcd57b2f17937df491",
"assets/assets/images/projects/animated_flight_paths.png": "3f50fe820c72f3aa7a4a67d619a3f7e8",
"assets/assets/images/projects/portfolio_site.png": "7fbcbd30fa8840ef2e58ace0e88e376e",
"assets/assets/images/projects/thai_word_of_the_day.png": "2adb5a4446c2294404552496b3b3e5ae",
"assets/assets/images/projects/coming_soon.png": "f502620c2cc6593867687a75eba40be9",
"assets/assets/images/logos/flutter.png": "8941e69dd4953e3d56c055b46ae6e44d",
"assets/assets/images/logos/firebase.png": "35e6f1be2ebef931ced66a5dc88a0c8b",
"assets/assets/images/logos/leetcode.png": "7fd79250d46f5012a6002c0523960912",
"assets/assets/images/logos/bloc.png": "79a1a4f52431ad0a2ea37cab37ef58ba",
"assets/assets/images/logos/pub_dev.png": "9d1adb54f046e449ca30ca670d9c6306",
"assets/assets/images/logos/flutter_hooks.png": "de130887d2f3485b325702257dc11f56",
"assets/assets/images/logos/google_play.png": "a7ca9cd8a62d7b12af9f3ea8c18e4a8f",
"assets/assets/images/logos/riverpod.png": "ba9417ee781bfe4bfa9e787ad926f369",
"assets/assets/images/logos/dart.png": "eb02fc5a9ff5e793c560e5b9ae91c383",
"assets/assets/images/me/main.png": "6f210fcc2504a8aa53e3bfd580df1867",
"assets/assets/images/me/peek_brow_raised.png": "52d82400fcd48f62a87a78aa8714d48d",
"assets/assets/images/me/peek_bug_eyed.png": "f9642c896f7c9c01a7b0eaa370d7c960",
"assets/assets/images/me/peek_sus.png": "cef636f77f03c511703b784a62082ee5",
"assets/assets/images/me/peek_smirk.png": "24ce52ec987a61bce328d9fb1122d5c1",
"assets/assets/images/me/peek_eye_roll.png": "c47c1889b44f619954fc9cd26ab87388",
"assets/assets/images/me/peek_bird.png": "edc002ebcc520e9d6817ce18dabf0042",
"assets/assets/images/me/peek_smile.png": "2772a534b4c5e32c7b86b4f5a563b3ed",
"assets/assets/images/me/peek_serious.png": "40de7869487f5c10402ee61c0c0df9a0",
"assets/assets/lotties/message_sent.json": "da2c222d7b066f1f6b052ad989f25d90",
"assets/assets/fonts/RobotoSlab-SemiBold.ttf": "d3e598592076a39309207b47be7818fa",
"assets/assets/fonts/Nunito-Regular.ttf": "0c890be2af0d241a2387ad2c4c16af2c",
"assets/assets/fonts/Mulish-Bold.ttf": "987e18dffd501e760afdbea36a4dbeed",
"assets/assets/fonts/Mulish-SemiBold.ttf": "922e5ae520dbced208a37bbfd3184b82",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
