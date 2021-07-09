(**
 * Copyright 2021 ulrik. All rights reserved.
 * Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
 *)

let routes routes =
  let router = Routes.one_of routes in
  fun next_handler (request : Dream.request) ->
    let target = Dream.target request in
    match Routes.match' router ~target with
    | Some handler -> handler request
    | None -> next_handler request
