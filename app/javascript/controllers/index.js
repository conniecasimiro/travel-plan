// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AddMethodController from "./add_method_controller"
application.register("add-method", AddMethodController)

import AddressAutocompleteController from "./address_autocomplete_controller"
application.register("address-autocomplete", AddressAutocompleteController)

import CreateTripController from "./create_trip_controller"
application.register("create-trip", CreateTripController)

import FilterController from "./filter_controller"
application.register("filter", FilterController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import LikesController from "./likes_controller"
application.register("likes", LikesController)

import MapController from "./map_controller"
application.register("map", MapController)

import RevealFormController from "./reveal_form_controller"
application.register("reveal-form", RevealFormController)
