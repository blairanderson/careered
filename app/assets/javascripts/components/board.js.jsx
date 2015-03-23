var Board = React.createClass({
  propTypes: {
    lists: React.PropTypes.node,
    cards: React.PropTypes.node,
    name: React.PropTypes.string,
    slug: React.PropTypes.string,
    description: React.PropTypes.string,
    open: React.PropTypes.bool
  },

  render: function() {
    debugger
    var board = this.props.board;
    return (
      <div>
        <div>Name: {board.name}</div>
        <div>Slug: {board.slug}</div>
        <div>Description: {board.description}</div>
        <div>Open: {board.open}</div>
      </div>
    );
  }
});
