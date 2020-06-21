json.array! @projects do |project|
  json.call(project, :id, :title)

  json.todos project.todos do |todo|
    json.call(todo, :id, :text, :complited)
  end
end
