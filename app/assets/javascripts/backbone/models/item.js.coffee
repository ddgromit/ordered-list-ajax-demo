class Backbonelists.Models.Item extends Backbone.Model
	paramRoot: 'item'

	defaults:
		title: null
		order: null

	initialize: ->
		@on 'change:order', => @save()


class Backbonelists.Collections.ItemsCollection extends Backbone.Collection
	model: Backbonelists.Models.Item
	url: '/items'
