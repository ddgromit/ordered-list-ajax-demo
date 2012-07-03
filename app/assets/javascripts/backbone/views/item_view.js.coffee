class Backbonelists.Views.ItemView extends Backbone.View
	template: JST["backbone/templates/item"]

	render: =>
		vars = _(@model.toJSON()).extend
			cid:@model.cid
		@el = @template(item: vars )