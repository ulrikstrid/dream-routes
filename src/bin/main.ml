(**
 * Copyright 2021 ulrik. All rights reserved.
 * Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
 *)

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
