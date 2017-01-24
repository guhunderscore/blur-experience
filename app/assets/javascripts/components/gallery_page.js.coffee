{ createClass, PropTypes } = React

@GalleryPage = createClass
  getInitialState: ->
    {
      listGalleries: @props.listGalleries
      galleryForm: { title: '', description: '', isEdited: false, index: null }
    }

  onHandleSubmit: (gallery) ->
    that = @
    
    $.ajax
      method: 'post'
      url: Routes.galleries_path(format: 'json')
      data: { gallery: gallery }
      success: (data) ->
        galleries = that.state.listGalleries.concat(data)

        that.setState
          listGalleries: galleries
          galleryForm: 
            title: ''
            description: ''
            isEdited: false

  onUpdate: (gallery) ->
    that = @
    
    $.ajax
      method: 'put'
      url: Routes.gallery_path(gallery.id, { format: 'json' })
      data: { gallery: gallery }
      success: (data) ->
        galleries = that.state.listGalleries
        galleries[gallery.index] = data

        that.setState
          listGalleries: galleries
          galleryForm:
            title: ''
            description: ''
            isEdited: 'false'
            index: null

  onEdit: (gallery, edited, index) ->
    { galleryForm, isEdited } = @state
    galleryForm.id = gallery.id
    galleryForm.title = gallery.title
    galleryForm.description = gallery.description
    galleryForm.isEdited = edited
    galleryForm.index = index

    @setState
      galleryForm: galleryForm
  
  onDelete: (id) ->
    that = @
    
    $.ajax
      method: 'delete'
      url: Routes.gallery_path(id, { format: 'json' })
      success: (data) ->
        galleries = that.state.listGalleries.filter (obj) ->
          obj.id != id

        that.setState listGalleries: galleries

  render: ->
    <div>
      <GalleryForm galleryForm={@state.galleryForm} listGalleries={@state.listGalleries} onHandleSubmit={@onHandleSubmit}  isEdited={@state.isEdited} onUpdate={@onUpdate} />
      <Gallery listGalleries={@state.listGalleries} onEdit={@onEdit} onDelete={@onDelete}/>
    </div>
