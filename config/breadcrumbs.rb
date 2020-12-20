crumb :root do
  link "Home", root_path
end
crumb :rooms do
  link "メッセージ一覧", rooms_path
  parent :root
end
crumb :room_show do |room|
  link "メッセージ詳細", room_path
  parent :rooms
end
crumb :message_edit do |message|
  link "メッセージの編集", edit_message_path
  parent :room_show
end
crumb :pet_show do
  link "ペット詳細", pet_path
  parent :root
end
crumb :new_pet do
  link "ペット登録", new_pet_path
  parent :root
end
crumb :edit_pet do
  link "ペット編集", edit_pet_path
  parent :new_pet
end
crumb :user_show do
  link "ユーザー詳細", user_path
  parent :root
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
