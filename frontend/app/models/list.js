import DS from 'ember-data';

export default DS.Model.extend({
  boardId: DS.attr(),
  title: DS.attr('string'),
  slug: DS.attr('string'),
  description: DS.attr('string'),
  open: DS.attr('boolean'),
  position: DS.attr(),
  cardTemplate: DS.attr('string'),
  createdAt: DS.attr('date'),
  updatedAt: DS.attr('date'),
  board: DS.belongsTo('board'),
  cards: DS.hasMany('cards')
});
