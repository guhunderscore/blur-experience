{ createClass, PropTypes } = React

@GalleryForm = createClass
  propTypes:
    listGalleries: PropTypes.array.isRequired
    galleryForm: PropTypes.object.isRequired

  getInitialState: ->
    {
      galleryForm: @props.galleryForm
    }

  componentWillReceiveProps: (nextProps) ->
    @setState
      galleryForm: nextProps.galleryForm

  handleChangeTitle: (event) ->
    { galleryForm } = @state

    galleryForm.title = event.target.value
    @setState(galleryForm: galleryForm)

  handleChangeDescription: (event) ->
    { galleryForm } = @state

    galleryForm.description = event.target.value
    @setState(galleryForm: galleryForm)

  handleSubmit: (e) ->
    e.preventDefault()
    @props.onHandleSubmit(@state.galleryForm)

  handleEdit: (e) ->
    e.preventDefault()
    @props.onUpdate(@state.galleryForm)

  render: ->
    { galleryForm } = @state
    isEdited = galleryForm.isEdited
    
    <div>
      <form className="simple_form new_gallery" onSubmit={if !isEdited then @handleSubmit else @handleEdit}>
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
#   create: (e) ->
#     e.preventDefault()

#   render: ->
#     <form className="simple_form new_gallery">
#       <div className="form-group">
#         <label>Title</label>
#         <input type="text" name="title"/>
#       </div>
#       <div className="form-group">
#         <input type="submit" name="commit" value="Save" className="btn btn-primary btn-md" onClick={@.create}/>
#       </div>
#     </form>
