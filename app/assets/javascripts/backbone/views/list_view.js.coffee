class Backbonelists.Views.ListView extends Backbone.View
	template: JST["backbone/templates/list"]

	initialize: ->
		@$list = null

	render: =>
		$(@el).html(@template())

		@$list = $(@el).find(".list")
		@$list.empty()
		@collection.each (item) =>
			view = new Backbonelists.Views.ItemView
				model:item
			view.render()
			@$list.append $(view.el).attr("id", "list-item-" + item.cid).data("cid", item.cid)

		@$list.sortable({
			change: (e, ui) => 

			update: (e, ui) => 
				@_orderFromAttrs()
				@updateOrdersFromDom()
				@_orderFromAttrs()
				@_whichChanged()


		}).disableSelection();

	orderedModelsFromDom: ->
		elIds = @$list.sortable("toArray")
		cids = _(elIds).map (id) => @$list.find("##{id}").data('cid')
		models = _(cids).map (cid) => @collection.getByCid(cid)
		return models

	updateOrdersFromDom: ->
		models = @orderedModelsFromDom()
		_(models).each (model,i) ->
			model.set("order",i)

	_orderFromAttrs: ->
		console.log @collection.chain()
			.sortBy((model) -> model.get('order'))
			.map((model) -> model.get('title'))
			.value()

	_whichChanged: ->
		console.log @collection.chain()
			.filter((model) -> model.hasChanged("order"))
			.map((model) -> model.get('title'))
			.value()


