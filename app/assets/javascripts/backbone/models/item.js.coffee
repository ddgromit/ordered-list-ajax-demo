class Backbonelists.Models.Item extends Backbone.Model
	paramRoot: 'item'

	defaults:
		title: null
		order: null

	initialize: ->
		@on 'change:order', => @save()

	toJSON: ->
		_(super()).pick('id','title','order')


class Backbonelists.Collections.ItemsCollection extends Backbone.Collection
	model: Backbonelists.Models.Item
	url: '/items'
