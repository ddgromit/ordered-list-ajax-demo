$ ->
	# itemModels = $.map [0..20], (i,v) ->
	# 	item = new Backbonelists.Models.Item
	# 		title: "Item #{i}"
	# 		order: v
	# 		id: "#{i}"
	# 	console.log item.isNew()
	# 	item

	items = new Backbonelists.Collections.ItemsCollection()
	items.fetch()

	items.on 'reset', ->
		view = new Backbonelists.Views.ListView
			collection: items
			el: $("#list-container")

		view.render()
