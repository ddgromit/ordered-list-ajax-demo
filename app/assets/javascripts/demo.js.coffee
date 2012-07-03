$ ->
	items = new Backbonelists.Collections.ItemsCollection()

	$.each [0..20], (i,v) ->
		item = new Backbonelists.Models.Item
			title: "Item #{i}"
			order: v

		items.add item

	view = new Backbonelists.Views.ListView
		collection: items
		el: $("#list-container")

	view.render()
