import DS from 'ember-data';
import config from '../config/environment';
import $ from 'jquery';

DS.ActiveModelAdapter.reopen({
  coalesceFindRequests: true
});

export default DS.ActiveModelAdapter.extend({
  host: config.host,
  namespace: 'api',
  headers: {
    "X-CSRF-Token": $('meta[name="csrf-token"]').attr('content')
  }
});

