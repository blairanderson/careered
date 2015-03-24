import Ember from 'ember';
import layout from '../templates/components/card-component';

export default Ember.Component.extend({
  layout: layout,
  classNames: ["card ui-droppable"],
  isEditing: false,
  actions: {
    edit: function() {
      this.set('isEditing', true);
    },

    save: function(){
      this.set('isEditing', false)
    }
  }
});
