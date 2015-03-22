import Ember from 'ember';

export default Ember.Route.extend({
  beforeModel: function(transition) {
    if (this.routeName === transition.targetName) {
      return this.transitionTo("board.show", {board_id: param})
    }
  },
  model: function() {
    return this.store.find('board');
  }
});
