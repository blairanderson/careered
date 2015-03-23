var { Route, DefaultRoute, RouteHandler, Link } = ReactRouter;
var data = window.data;

var ReactApp = React.createClass({
  getInitialState: function() {
    return {
      user: data.user,
      boards: data.boards,
      lists: data.lists,
      cards: data.cards
    };
  },

  getNavLinks: function() {
    return this.state.boards.map(function(board) {
      return (
        <li key={board.slug}>
          <Link
            to="board"
            params={{slug: board.slug}}>
            <div>{board.name}
              <span>{board.description}</span>
            </div>
          </Link>
        </li>
      );
    });
  },

  render: function() {
    var links = this.getNavLinks();
    return (
      <div>
        <nav role='navigation' className="main-nav" id="main-nav">
          <ul id="main-nav-list">
            <li>
              <a>
                <div>Boards <span>Get Busy.</span></div>
              </a>
            </li>
          {{links}}
          </ul>
        </nav>
        <div>
          <RouteHandler/>
        </div>
      </div>
    )
  }
});


var Index = React.createClass({
  render: function() {
    return <h1>Select a board!</h1>;
  }
});

function findBoard(slug) {
  return window.data.boards.find(function(board) {
    return board.slug === slug;
  });
}

var Board = React.createClass({
  contextTypes: {
    router: React.PropTypes.func.isRequired
  },

  render: function() {
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
