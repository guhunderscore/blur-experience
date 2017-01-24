{ createClass, PropTypes } = React

@GalleryForm = createClass
	propTypes:
		listGalleries: PropTypes.array.isRequired
		galleryForm: PropTypes.object.isRequired

	getInitialState: ->
    {
    	listGalleries: @props.listGalleries
    	galleryForm: @props.galleryForm
    }

  handleChangeTitle: (event) ->
  	{ galleryForm } = @state
  	galleryForm.title = event.target.value
  	# console.log galleryForm
  	@setState(galleryForm: galleryForm)

  handleChangeDescription: (event) ->
  	{ galleryForm } = @state
  	galleryForm.description = event.target.value
  	@setState(galleryForm: galleryForm)
  	

  handleSubmit: (e) ->
  	e.preventDefault()
  	gallery = @state.galleryForm
  	# console.log @props
  	# @props.onHandleSubmit(gallery)

  render: ->
  	# galleryForm = @state
  	{ galleryForm } = @state
  	
  	<div>
	    <form className="simple_form new_gallery" onSubmit={@handleSubmit}>
	    	<div className="form-group">
	    		<label>Title</label>
	    		<input type="text" name="title" value={galleryForm.title} onChange={@handleChangeTitle}/>
	    	</div>
	    	<div className="form-group">
	    		<label>Description</label>
	    		<textarea value={galleryForm.description} onChange={@handleChangeDescription} />
	    	</div>
	    	<div className="form-group">
	    		<input type="submit" name="commit" value="Save" className="btn btn-primary btn-md"/>
	    	</div>
	    </form>
	  </div>

# class @GalleryForm extends React.Component
# 	create: (e) ->
# 		e.preventDefault()

#   render: ->
#     <form className="simple_form new_gallery">
#     	<div className="form-group">
#     		<label>Title</label>
#     		<input type="text" name="title"/>
#     	</div>
#     	<div className="form-group">
#     		<input type="submit" name="commit" value="Save" className="btn btn-primary btn-md" onClick={@.create}/>
#     	</div>
#     </form>
