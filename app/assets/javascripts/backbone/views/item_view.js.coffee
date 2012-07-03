class Backbonelists.Views.ItemView extends Backbone.View
	template: JST["backbone/templates/item"]

	render: =>
		$(@el).html(@template(item: @model.toJSON() ))