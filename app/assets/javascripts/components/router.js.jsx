var Route = ReactRouter.Route;
var DefaultRoute = ReactRouter.DefaultRoute;

var routes = (
  <Route name="app" path="/" handler={ReactApp}>
    <Route name="boards" path="/" handler={Boards} />
    <Route name="board" path="board/:slug" handler={Board}/>
  </Route>
);

var main = document.getElementById('main');

ReactRouter.run(routes, function(Handler) {
  React.render(<Handler/>, main);
});
