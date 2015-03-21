var Application = React.createClass({
  //mixins: [FluxMixin, StoreWatchMixin("BoardStore")],
  propTypes: {
    currentUser: React.PropTypes.object
  },

  render: function() {
    var user = JSON.parse(this.props.current_user);
    this.props.user = {
      name: user.name,
      bio: user.bio,
      email: user.email,
      full_name: user.full_name
    };
    this.props.boards = user.boards;
    this.props.cards = user.cards;
    this.props.lists = user.lists;
    return (<div>
      <div>Current User: {this.props.user}</div>
      <ul>
        {this.props.boards.map(function(board, i) {
          var lists = this.props.lists.filter(function(list){
            return list.board_id === board.id;
          });
          return <li key={i}><Board board={board} lists={lists} /></li>;
        }.bind(this))}
      </ul>
      </div>
    );
  }
});
