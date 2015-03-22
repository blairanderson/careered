import Ember from 'ember';

export default Ember.Route.extend({
  model: function(params) {
    this.store.findById('board', params.board_id)
  }
});
