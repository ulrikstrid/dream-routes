(*
 * Copyright 2021 ulrik. All rights reserved.
 * Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
 *)

val routes : Dream.handler Routes.route list -> Dream.middleware
(**
Middleware that takes a list of route definitions and checks for a match.
If there is no match the next handler will be called.

You can read more about how to define routes {{:https://anuragsoni.github.io/routes/} [here]}

Example usage based on the {{:https://github.com/aantron/dream/tree/master/example/3-router#files} [router example]}:
{[
  let () =
  Dream.run
  @@ Dream.logger
  @@ Dream_routes.routes Routes.[
    empty @--> (fun _request ->
      Dream.html "Good morning, world!");

    s "echo" / int /? nil @--> (fun integer _request ->
        Dream.html @@ Printf.sprintf "integer: %i" integer);

    s "echo" / str /? nil @--> (fun word _request ->
      Dream.html word);
  ]
  @@ Dream.not_found
  ]}
*)
