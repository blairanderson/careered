var { Route, DefaultRoute, RouteHandler, Link } = ReactRouter;
var data = window.data;

var Application = React.createClass({
  getInitialState: function () {
    return {
      user: data.user,
      boards: data.boards,
      lists: data.lists,
      cards: data.cards
    };
  },

  render: function() {
    var links = this.state.boards.map(function(board, i) {
      return (
              <li key={board.slug}>
                <Link
                    to="board"
                    params={{slug: board.slug}}
                    >{board.title}</Link>
              </li>
            );
    });
    return (
      <div>
        <div>Current User: {this.state.user.full_name}</div>
        <ul> {links} </ul>
        <div class="detail">
          <RouteHandler/>
        </div>
      </div>
    );
  }
});

var Index = React.createClass({
  render: function () {
    return <h1>Select a board!</h1>;
  }
});

function findBoard(slug){
  return window.data.boards.find(function(board){
    return board.slug === slug;
  });
}

var Board = React.createClass({
  contextTypes: {
    router: React.PropTypes.func.isRequired
  },

  render: function () {
    var slug = this.context.router.getCurrentParams().slug;
    var board = findBoard(slug);
    debugger
    return (
      <div className="board">
        <h1>{board.title}</h1>
      </div>
    );
  }
});

var routes = (
  <Route name="app" path={window.location.pathname} handler={Application}>
    <DefaultRoute handler={Index}/>
    <Route name="board" path="board/:slug" handler={Board}/>
  </Route>
);

ReactRouter.run(routes, function (Handler) {
  React.render(<Handler/>, document.getElementById('main'));
});
