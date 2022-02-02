# A repro repository

This repository is meant to be used with nextjs, typescript and supabase.

Reproduction:

1. Download the [0.17.0](https://github.com/supabase/cli/releases/tag/v0.17.0) CLI from supabase
2. Launch the docker containers with:
   - `supabase init`
   - `supabase start`
3. Run the transaction against the database in order to deactivate the security on Bucket and Object tables
   - You will find the script at the root of this repo (`transaction.sql`)
4. Then, run the project, with:
   - `yarn dev`
5. Go to `http://localhost:3000`
6. Upload a file (an image for instance), then submit.
7. Result:
   - Open the dev tools under the network tab
   - You should see an error on the request: `http://localhost:54321/storage/v1/object/test/avatar` that gives a 400 bad request.

Everyrhing happen at the file: `pages/index.tsx`

The response:

```
{"statusCode":"42501","error":"","message":"new row violates row-level security policy (USING expression) for table \"objects\""}
```

The request:

```
fetch("http://localhost:54321/storage/v1/bucket/test", {
  "headers": {
    "accept": "*/*",
    "accept-language": "en-GB,en;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-XA;q=0.6,en-US;q=0.5",
    "apikey": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiJ9.ZopqoUt20nEV9cklpv9e3yw3PVyZLmKs5qLD6nGL1SI",
    "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiJ9.ZopqoUt20nEV9cklpv9e3yw3PVyZLmKs5qLD6nGL1SI",
    "cache-control": "no-cache",
    "pragma": "no-cache",
    "sec-ch-ua": "\" Not;A Brand\";v=\"99\", \"Google Chrome\";v=\"97\", \"Chromium\";v=\"97\"",
    "sec-ch-ua-mobile": "?0",
    "sec-ch-ua-platform": "\"Linux\"",
    "sec-fetch-dest": "empty",
    "sec-fetch-mode": "cors",
    "sec-fetch-site": "same-site",
    "x-client-info": "supabase-js/1.29.4"
  },
  "referrer": "http://localhost:3000/",
  "referrerPolicy": "strict-origin-when-cross-origin",
  "body": null,
  "method": "GET",
  "mode": "cors",
  "credentials": "include"
}); ;
fetch("http://localhost:54321/storage/v1/bucket/test", {
  "headers": {
    "accept": "*/*",
    "accept-language": "en-GB,en;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-XA;q=0.6,en-US;q=0.5",
    "cache-control": "no-cache",
    "pragma": "no-cache",
    "sec-fetch-dest": "empty",
    "sec-fetch-mode": "cors",
    "sec-fetch-site": "same-site"
  },
  "referrer": "http://localhost:3000/",
  "referrerPolicy": "strict-origin-when-cross-origin",
  "body": null,
  "method": "OPTIONS",
  "mode": "cors",
  "credentials": "omit"
}); ;
fetch("http://localhost:54321/storage/v1/object/test/avatar", {
  "headers": {
    "accept": "*/*",
    "accept-language": "en-GB,en;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-XA;q=0.6,en-US;q=0.5",
    "apikey": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiJ9.ZopqoUt20nEV9cklpv9e3yw3PVyZLmKs5qLD6nGL1SI",
    "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiJ9.ZopqoUt20nEV9cklpv9e3yw3PVyZLmKs5qLD6nGL1SI",
    "cache-control": "no-cache",
    "content-type": "multipart/form-data; boundary=----WebKitFormBoundarycxswSVkYFH4bAJr6",
    "pragma": "no-cache",
    "sec-ch-ua": "\" Not;A Brand\";v=\"99\", \"Google Chrome\";v=\"97\", \"Chromium\";v=\"97\"",
    "sec-ch-ua-mobile": "?0",
    "sec-ch-ua-platform": "\"Linux\"",
    "sec-fetch-dest": "empty",
    "sec-fetch-mode": "cors",
    "sec-fetch-site": "same-site",
    "x-client-info": "supabase-js/1.29.4",
    "x-upsert": "true"
  },
  "referrer": "http://localhost:3000/",
  "referrerPolicy": "strict-origin-when-cross-origin",
  "body": "------WebKitFormBoundarycxswSVkYFH4bAJr6\r\nContent-Disposition: form-data; name=\"cacheControl\"\r\n\r\n3600\r\n------WebKitFormBoundarycxswSVkYFH4bAJr6\r\nContent-Disposition: form-data; name=\"\"; filename=\"unnamed.png\"\r\nContent-Type: image/png\r\n\r\n\r\n------WebKitFormBoundarycxswSVkYFH4bAJr6--\r\n",
  "method": "POST",
  "mode": "cors",
  "credentials": "include"
}); ;
fetch("http://localhost:54321/storage/v1/object/test/avatar", {
  "headers": {
    "accept": "*/*",
    "accept-language": "en-GB,en;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-XA;q=0.6,en-US;q=0.5",
    "cache-control": "no-cache",
    "pragma": "no-cache",
    "sec-fetch-dest": "empty",
    "sec-fetch-mode": "cors",
    "sec-fetch-site": "same-site"
  },
  "referrer": "http://localhost:3000/",
  "referrerPolicy": "strict-origin-when-cross-origin",
  "body": null,
  "method": "OPTIONS",
  "mode": "cors",
  "credentials": "omit"
}); ;
fetch("http://localhost:3000/_next/static/webpack/7afb362661cf9e1f.webpack.hot-update.json", {
  "headers": {
    "accept": "*/*",
    "accept-language": "en-GB,en;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-XA;q=0.6,en-US;q=0.5",
    "cache-control": "no-cache",
    "pragma": "no-cache",
    "sec-ch-ua": "\" Not;A Brand\";v=\"99\", \"Google Chrome\";v=\"97\", \"Chromium\";v=\"97\"",
    "sec-ch-ua-mobile": "?0",
    "sec-ch-ua-platform": "\"Linux\"",
    "sec-fetch-dest": "empty",
    "sec-fetch-mode": "cors",
    "sec-fetch-site": "same-origin"
  },
  "referrer": "http://localhost:3000/?",
  "referrerPolicy": "strict-origin-when-cross-origin",
  "body": null,
  "method": "GET",
  "mode": "cors",
  "credentials": "include"
}); ;
fetch("http://localhost:3000/_next/static/webpack/pages/index.7afb362661cf9e1f.hot-update.js", {
  "headers": {
    "accept": "*/*",
    "accept-language": "en-GB,en;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-XA;q=0.6,en-US;q=0.5",
    "cache-control": "no-cache",
    "pragma": "no-cache",
    "sec-ch-ua": "\" Not;A Brand\";v=\"99\", \"Google Chrome\";v=\"97\", \"Chromium\";v=\"97\"",
    "sec-ch-ua-mobile": "?0",
    "sec-ch-ua-platform": "\"Linux\"",
    "sec-fetch-dest": "script",
    "sec-fetch-mode": "no-cors",
    "sec-fetch-site": "same-origin"
  },
  "referrer": "http://localhost:3000/?",
  "referrerPolicy": "strict-origin-when-cross-origin",
  "body": null,
  "method": "GET",
  "mode": "cors",
  "credentials": "include"
}); ;
fetch("http://localhost:3000/_next/static/webpack/webpack.7afb362661cf9e1f.hot-update.js", {
  "headers": {
    "accept": "*/*",
    "accept-language": "en-GB,en;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-XA;q=0.6,en-US;q=0.5",
    "cache-control": "no-cache",
    "pragma": "no-cache",
    "sec-ch-ua": "\" Not;A Brand\";v=\"99\", \"Google Chrome\";v=\"97\", \"Chromium\";v=\"97\"",
    "sec-ch-ua-mobile": "?0",
    "sec-ch-ua-platform": "\"Linux\"",
    "sec-fetch-dest": "script",
    "sec-fetch-mode": "no-cors",
    "sec-fetch-site": "same-origin"
  },
  "referrer": "http://localhost:3000/?",
  "referrerPolicy": "strict-origin-when-cross-origin",
  "body": null,
  "method": "GET",
  "mode": "cors",
  "credentials": "include"
});
```
