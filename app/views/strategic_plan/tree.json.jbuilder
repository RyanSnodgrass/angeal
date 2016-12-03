json.chart { json.container '#tree-simple' }
json.nodeStructure do
  json.text { json.name @vision.blurb }
  json.children @vision.goals do |long_goal|
    if long_goal.range == 'Medium'
      json.pseudo true
      json.children [
        { 'text' => { 'name' => long_goal.title },
          'children' => long_goal.children.map do |i|
            { 'text' => { 'name' => i.title } }
          end
        }
      ]
    elsif long_goal.range == 'Short'
      json.pseudo true
      json.children [
        { 'psuedo' => true,
          'children' => [ { 'text' => { 'name' => long_goal.title } } ]
        }
      ]
    else
      json.text { json.name long_goal.title }
      # json.childrenDropLevel
      json.children long_goal.children do |med_goal|
        json.text { json.name med_goal.title }
      end
    end
  end
end
