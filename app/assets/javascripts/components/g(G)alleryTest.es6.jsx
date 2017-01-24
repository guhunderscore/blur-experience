// class GalleryItem extends React.Component {
// 	constructor (props) {
// 		super(props);
// 		this.onClickNewRecord = this.onClickNewRecord.bind(this);
// 		this.deleteGallery = this.deleteGallery.bind(this);
// 	}

// 	onClickNewRecord () {
// 		alert(this.props.gallery.id);
// 	}

// 	deleteGallery () {
// 		console.log(this.props);
// 		this.props.onDeleteGallery(this.props.gallery.id);
// 	}

// 	truncateString(text) {
// 		return text.substring(0, 5);
// 	}

// 	render () {
// 		var gallery = this.props.gallery;

// 		return (
// 			<tr>
// 				<td>
// 				</td>
// 				<td>{this.truncateString(gallery.title)}</td>
// 				<td><button type="button" onClick={this.onClickNewRecord}>New</button></td>
// 				<td><button type="button" onClick={this.deleteGallery}>Delete</button></td>
// 				<td><button type="button" onClick={this.truncateTitle}>Delete</button></td>
// 			</tr>
// 		);
// 	}	
// }

// class Gallery extends React.Component {
// 	constructor (props) {
// 		super(props);
// 		this.state = { galleries: [] };
// 		this.onDeleteGallery = this.onDeleteGallery.bind(this);
// 		this.onSaveUser = this.onSaveUser.bind(this);
// 	}

// 	componentDidMount () {
// 		var that = this;

// 		$.ajax({
// 			method: 'GET',
// 			url: Routes.galleries_path({ format: 'json' }),
// 			beforeSend: function() {
// 				that.setState({ isLoading: true });
// 			},
// 			success: function(data) {
// 				that.setState({ galleries: data, isLoading: false });
// 			}
// 		});
// 	}

// 	onSaveUser(e) {
// 		e.preventDefault();
// 		var title = $("#title").val();
// 		var newGalleries = this.state.galleries.concat({ title: title });
// 		this.setState({ galleries: newGalleries })
// 	}

// 	onDeleteGallery (id) {
// 		var that = this;

// 		$.ajax({
// 			method: 'DELETE',
// 			url: Routes.gallery_path(id, { format: 'json' }),
// 			success: function(data) {
// 				var galleries = that.state.galleries;

// 				galleries = galleries.filter(function(obj) {
// 					return obj.id !== id;
// 				});

// 				that.setState({ galleries: galleries });
// 			}
// 		});

// 	}

//   render () {
//   	if(this.state.isLoading) {
//   		return <p>Loading Gallery</p>;
//   	}

//   	var that = this;
//   	var rows = $.map(this.state.galleries, function(gallery, index) {
//   		return <GalleryItem key={index} gallery={gallery} onDeleteGallery={that.onDeleteGallery}/>
// 	  });

//   	return (
//   		<div>
// 	  		<form>
// 	  			<input id="title"/>
// 	  			<input type="submit" value="save" onClick={this.onSaveUser}/>
// 	  		</form>
// 		  	<table>
// 		  		<thead>
// 		  			<tr>
// 		  				<th>#</th>
// 		  				<th>Title</th>
// 		  				<th>Description</th>
// 		  				<th>Thanks To</th>
// 		  				<th></th>
// 		  			</tr>
// 		  		</thead>
// 		  		<tbody>
// 		  			{rows}
// 		  		</tbody>
// 		  	</table>
// 		  </div>
// 	  );
//   }
// }
