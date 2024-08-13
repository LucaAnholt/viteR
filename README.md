# viteR 

This is an experimental web-application techstack. 

The `frontend` is written using `Vite`/`React`, `Redux` for client-side state management, `React Router` for routing within a single-page application and `TailWind CSS` for styling. 

The `backend` is written using the `plumber` API/HTTP framework in `R` and load balanced across workers in `Rust` using `facuet` for fast asynchronuous request handling. 

# Running backend server

## development (single thread):

To benefit from autoreloading on changes to the API code, within the `./backend` directory you can run `npm run server` which will use `nodemon` to automatically reload the server on any changes. Note, this will be a development server on a single worker/thread. 

To run a load-balanced server, you can run within the `./backend` directory: 

```
faucet --dir ./ --workers <number of works> --host 0.0.0.0:<port number>
```

