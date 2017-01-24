{ createClass, PropTypes } = React

@GalleryPage = createClass
	getInitialState: ->
		{
			listGalleries: @props.listGalleries
			galleryForm: { title: '', description: '' }
		}

	onHandleSubmit: (gallery) ->
		that = @
		$.ajax
			method: 'post'
			url: Routes.galleries_path(format: 'json')
			data: { gallery: gallery }
			success: (data) ->
				galleries = that.state.listGalleries.concat(data)
				that.setState({ listGalleries: galleries })
				# console.log galleries

	onEdit: (gallery) ->
		# console.log gallery
		# console.log @state
		{ galleryForm  } = @state
		galleryForm.title = gallery.title
		galleryForm.description = gallery.description

		@setState
			title: gallery.title
			description: gallery.description

	render: ->
		<div>
			<GalleryForm galleryForm={@state.galleryForm} listGalleries={@state.listGalleries} onHandleSubmit={@onHandleSubmit} bindGallery={@state.galleryForm} />
			<Gallery listGalleries={@state.listGalleries} onEdit={@onEdit}/>
		</div>
