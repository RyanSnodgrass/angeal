json.chart { json.container '#tree-simple' }
json.nodeStructure do
  json.text { json.name @vision.blurb }
  json.children @vision.goals do |long_goal|
    json.text { json.name long_goal.title }
    json.children long_goal.children do |med_goal|
      json.text { json.name med_goal.title }
    end
  end
end

#
#
# var simple_chart_config = {
# 	chart: {
# 		container: "#OrganiseChart-simple"
# 	},
#
# 	nodeStructure: {
# 		text: { name: "Parent node" },
# 		children: [
# 			{
# 				text: { name: "First child" }
# 			},
# 			{
# 				text: { name: "Second child" }
# 			}
# 		]
# 	}
# };
