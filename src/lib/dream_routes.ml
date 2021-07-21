(**
 * Copyright 2021 ulrik. All rights reserved.
 * Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
 *)

let to_router method_ routes =
  routes
  |> List.filter (fun (m, _) -> m = method_)
  |> List.map snd
  |> Routes.one_of

type route = Dream.method_ * Dream.handler Routes.route

let routes (routes : route list) =
  let get_router = to_router `GET routes in
  let post_router = to_router `POST routes in
  let put_router = to_router `PUT routes in
  let delete_router = to_router `DELETE routes in
  let patch_router = to_router `PATCH routes in

  fun next_handler (request : Dream.request) ->
    let target = Dream.target request in
    let handler =
      match Dream.method_ request with
      | `GET -> Routes.match' get_router ~target
      | `POST -> Routes.match' post_router ~target
      | `PUT -> Routes.match' put_router ~target
      | `DELETE -> Routes.match' delete_router ~target
      | `PATCH -> Routes.match' patch_router ~target
      | _ -> None in
    match handler with
    | Some handler -> handler request
    | None -> next_handler request

let get route = (`GET, route)

let post route = (`POST, route)

let put route = (`PUT, route)

let delete route = (`DELETE, route)

let patch route = (`PATCH, route)
