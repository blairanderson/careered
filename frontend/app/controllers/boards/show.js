import Ember from 'ember';

export default Ember.Controller.extend({
  isExpanded: false,

  actions: {
    expand: function() {
      this.set('isExpanded', true);
    },

    contract: function(){
      this.set('isExpanded', false);
    }
  }
});
