import Ember from 'ember';

export default Ember.Route.extend({
  model: function(slug) {
    return this.store.find('board', {slug: slug});
  }
});
