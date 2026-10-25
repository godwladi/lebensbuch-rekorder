'use strict';
// ---------------------------------------------------------------------------
// Service Worker: Cache-First fuer den Offline-Betrieb als iPhone-App.
// "Online stellen.bat" setzt CACHE automatisch hoch, damit das iPhone Updates erkennt.
// ---------------------------------------------------------------------------
const CACHE = 'lebensbuch-rekorder-20261025-1228';
const FILES = ['./', 'index.html', 'manifest.webmanifest', 'icons/icon-180.png', 'icons/icon-192.png', 'icons/icon-512.png', 'icons/icon-maskable-512.png'];
const CDN = ['https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js'];

self.addEventListener('install', e => {
  e.waitUntil(caches.open(CACHE)
    .then(c => c.addAll(FILES.map(f => new Request(f, { cache: 'reload' })))
      .then(() => Promise.allSettled(CDN.map(u => c.add(u)))))
    .then(() => self.skipWaiting()));
});

self.addEventListener('activate', e => {
  e.waitUntil(caches.keys()
    .then(keys => Promise.all(keys.filter(k => k !== CACHE).map(k => caches.delete(k))))
    .then(() => self.clients.claim()));
});

self.addEventListener('fetch', e => {
  const req = e.request; if (req.method !== 'GET') return;
  const url = new URL(req.url);
  const own = url.origin === location.origin;
  if (!own && !CDN.includes(req.url)) return; // Schriften usw. normal laden
  e.respondWith(caches.open(CACHE).then(async cache => {
    const hit = await cache.match(req, { ignoreSearch: own });
    const net = fetch(own ? req.url : req, own ? { cache: 'no-cache' } : undefined)
      .then(res => { if (res.ok) cache.put(req, res.clone()); return res; });
    if (hit) { net.catch(() => {}); return hit; }
    return net.catch(() => cache.match('index.html'));
  }));
});
