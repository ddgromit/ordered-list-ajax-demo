class Backbonelists.Views.ListView extends Backbone.View
	template: JST["backbone/templates/list"]

	render: =>
		$(@el).html(@template())

		$list = $(@el).find(".list")
		$list.empty()
		@collection.each (item) ->
			view = new Backbonelists.Views.ItemView
				model:item
			view.render()
			$list.append(view.el)

		$(".list").sortable();