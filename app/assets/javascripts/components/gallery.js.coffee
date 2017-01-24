{ createClass, PropTypes } = React

@Gallery = createClass
	getInitialState: ->
		{
			listGalleries: @props.listGalleries
			galleries: []
			isEditable: false
			title: ''
			description: ''
			thank_to: ''
		}

	handleEdit: (index)->
		# console.log !@state.isEditable
		gallery = @state.listGalleries[index]
		@props.onEdit(gallery)
		@setState
			index: index
			title: gallery.title
			description: gallery.description

	render: ->
		listGalleries = []
		for gallery, index in @props.listGalleries
			listGalleries.push(
				<TableRow key={gallery.id} gallery={gallery} handleEdit={@handleEdit.bind(@, index)} />
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
		{ gallery, handleEdit } = @props
		{ title, description, thank_to } = gallery
		
		<tr>
			<td>{title}</td>
			<td>{description}</td>
			<td>{thank_to}</td>
			<td><a href='javascript:void(0)' onClick={handleEdit}>Edit</a></td>
		</tr>