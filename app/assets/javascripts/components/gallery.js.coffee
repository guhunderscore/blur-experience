{ createClass, PropTypes } = React

@Gallery = createClass
  handleEdit: (index) ->
    gallery = @props.listGalleries[index]
    @props.onEdit(gallery, true, index)
    
  handleDelete: (id) ->
    @props.onDelete(id)

  render: ->
    listGalleries = []
    for gallery, index in @props.listGalleries
      listGalleries.push(
        <TableRow key={gallery.id} gallery={gallery} handleEdit={@handleEdit.bind(@, index)}
          handleDelete={@handleDelete.bind(@, gallery.id)}/>
      )

    <table>
      <thead>
        <tr>
          <th>Title</th>
          <th>Description</th>
          <th>thank_to</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>{listGalleries}</tbody>
    </table>

@TableRow = createClass
  render: ->
    { gallery, handleEdit, handleDelete } = @props
    { title, description, thank_to } = gallery
    
    <tr>
      <td>{title}</td>
      <td>{description}</td>
      <td>{thank_to}</td>
      <td>
        <a href='javascript:void(0)' onClick={handleEdit}>Edit</a>
        ||
        <a href='javascript:void(0)' onClick={handleDelete}>Delete</a>
      </td>
    </tr>