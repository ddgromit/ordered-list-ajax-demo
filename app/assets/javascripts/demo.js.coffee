$ ->
	items = new Backbonelists.Collections.ItemsCollection()

	$.each [1,2,3], (i,v) ->
		item = new Backbonelists.Models.Item
			title: ["First", "Second", "Third"][i]
			order: v

		items.add item

	view = new Backbonelists.Views.ListView
		collection: items
		el: $("#list-container")

	view.render()
