import Ember from 'ember';
import layout from '../templates/components/card-component';

export default Ember.Component.extend({
  layout: layout,
  classNames: ["card ui-droppable"],
  isEditing: false,

  urlHOST: Ember.computed('url', function() {
    var parser = document.createElement('a');
    parser.href =  this.card.get('url');
    return parser.hostname;
  }),

  actions: {
    edit: function() {
      this.set('isEditing', true);
    },

    save: function(){
      this.set('isEditing', false);
    }
  }
});
