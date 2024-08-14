# viteR 

This is an experimental web-application techstack. 

The `frontend` is written using the `Vite`/`React` framework, `Redux` for client-side state management, `React Router` for routing within a single-page application and `TailWind CSS` for styling. 

The `backend` is written using the `plumber` API/HTTP framework in `R`, with a custom `{yyjsonr}` JSON serialiser, and load balanced across workers in `Rust` using `facuet` for fast asynchronuous request handling. 

# Running the backend server

## Development (single thread):

To benefit from autoreloading on changes to the API code, within the `./backend` directory you can run: 

```
npm run server
``` 

which will use `nodemon` to automatically reload the server on any changes. Note, this will be a development server on a single worker/thread. 

## Development (loadbalanced / multithread):

To run a load-balanced server i.e. multiple plumber API backends managed by the Rust `{faucet}` package, within the `./backend` directory you can run: 

```
faucet --dir ./ --workers <number of works> --host 0.0.0.0:<port number>
```

# Running the frontend 

## Development 

Simply run within the `./frontend` directory:

```
npm start
```

## Building the frontend static files 

The frontend static files are built and transpiled by `Vite` and are then copied over to the `/dist` directory in the `/backend`. These are then picked up by the plumber API and served at the root endpoint `"/"`. 

The actual API endpoints that are used by the client/frontend will exist within `/api/<endpoint>` - this means we can deploy our frontend from within our server deployment. 

We can mimic this within development by using the `Vite` HTTP proxy in `vite.config.ts`: 
```
import { defineConfig } from "vitest/config"
import react from "@vitejs/plugin-react"

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    open: true,
    proxy: {
      "/api": {
        target: 'http://127.0.0.1:8080',
        changeOrigin: true,
      }
    }
  },
  test: {
    globals: true,
    environment: "jsdom",
    setupFiles: "src/setupTests",
    mockReset: true,
  },
})
```

