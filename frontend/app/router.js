import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType,
  rootURL: "/ember"
});

Router.map(function() {
  this.resource('boards',{path: '/boards'}, function() {
    this.route('show', {path: '/:board_id'})
  });
});

export default Router;
