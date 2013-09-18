module.exports = (match) ->

  match '', 'welcome#index'
  match 'todos', 'todos#index'

  match 'projects', 'projects#index'
  match 'projects/:id', 'projects#show'
