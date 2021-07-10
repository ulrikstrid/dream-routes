# Dream Routes

Define your [Dream](https://aantron.github.io/dream/) router with [Routes](https://anuragsoni.github.io/routes/).

Example based on Dream's [3-router](https://github.com/aantron/dream/tree/master/example/3-router#files):

```ocaml
let () =
  Dream.run
  @@ Dream.logger
  @@ Dream_routes.routes Routes.[
    Dream_routes.get @@ empty @--> (fun _request ->
      Dream.html "Good morning, world!");

    Dream_routes.get @@ s "echo" / int /? nil @--> (fun integer _request ->
      Dream.html @@ Printf.sprintf "integer: %i" integer);

    Dream_routes.get @@ s "echo" / str /? nil @--> (fun word _request ->
      Dream.html word);
  ]
  @@ Dream.not_found
```
