json.chart do
  json.container "#tree-simple"
end
json.nodeStructure do
  json.text { json.name @vision.blurb }
  json.children @vision.goals do |goal|
    json.text { json.name goal.title }
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
