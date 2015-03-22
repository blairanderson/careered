import DS from 'ember-data';

export default DS.Model.extend({
  listId: DS.attr(),
  title: DS.attr('string'),
  description: DS.attr('string'),
  dueDate: DS.attr('date'),
  open: DS.attr('boolean'),
  commentCount: DS.attr(),
  url: DS.attr('string'),
  assigneeId: DS.attr(),
  position: DS.attr(),
  companyId: DS.attr(),
  salary: DS.attr(),
  createdAt: DS.attr("date"),
  updatedAt: DS.attr("date"),
  list: DS.belongsTo('list')
});
