class Backbonelists.Routers.ItemsRouter extends Backbone.Router
  initialize: (options) ->
    @items = new Backbonelists.Collections.ItemsCollection()
    @items.reset options.items

  routes:
    "new"      : "newItem"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newItem: ->
    @view = new Backbonelists.Views.Items.NewView(collection: @items)
    $("#items").html(@view.render().el)

  index: ->
    @view = new Backbonelists.Views.Items.IndexView(items: @items)
    $("#items").html(@view.render().el)

  show: (id) ->
    item = @items.get(id)

    @view = new Backbonelists.Views.Items.ShowView(model: item)
    $("#items").html(@view.render().el)

  edit: (id) ->
    item = @items.get(id)

    @view = new Backbonelists.Views.Items.EditView(model: item)
    $("#items").html(@view.render().el)
