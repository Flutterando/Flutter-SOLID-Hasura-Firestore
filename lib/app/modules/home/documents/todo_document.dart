const String todosQuery = ''' 
subscription MyQuery {
  todos(order_by: {id: asc}) {
    check
    id
    title
  }
}

''';

const String todosInsertQuery = ''' 
mutation InsertTodo(\$title: String) {
  insert_todos(objects: {title: \$title}) {
    returning {
      id
    }
  }
}
''';

const String todosUpdateQuery = ''' 
mutation UpdateTodo(\$id: Int, \$title: String, \$check: Boolean) {
  update_todos(where: {id: {_eq: \$id}}, _set: {check: \$check, title: \$title}) {
    affected_rows
  }
}
''';

const String todosDeleteQuery = ''' 
mutation DeleteTodo(\$id: Int) {
  delete_todos(where: {id: {_eq: \$id}}) {
    affected_rows
  }
}
''';
