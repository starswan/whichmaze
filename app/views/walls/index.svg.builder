# xml.svg(:xmlns => "http://www.w3.org/2000/svg", :viewBox => "-100 -100 200 200") {
#   @walls.each { |w|
#     xml.circle(:r => 3, :cx => w.xposition, :cy => w.yposition)
#   }
# }
scale = 10
style = 'stroke:rgb(0,0,0);stroke-width:1'
xml.svg(:xmlns => "http://www.w3.org/2000/svg", :height => @maze.height * scale, :width => @maze.width * scale) {
  xml.line(:x1 => 0, :y1 => 0, :x2 => 0, :y2 => @maze.height * scale, :style=> style)
  xml.line(:x1 => 0, :y1 => 0, :x2 => @maze.width * scale, :y2 => 0, :style=> style)
  @walls.each { |w|
    # Down line
    xml.line(:x1 => (w.xposition - 1) * scale, :y1 => w.yposition * scale,
             :x2 => w.xposition * scale, :y2 => w.yposition * scale,
             :style=> style) if w.down
    # Right line
    xml.line(:x1 => w.xposition * scale, :y1 => (w.yposition - 1) * scale,
             :x2 => w.xposition * scale, :y2 => w.yposition * scale,
             :style=> style) if w.right
  }
}

# b = Nokogiri::XML::Builder.new do |doc|
#   doc.svg xmlns:"http://www.w3.org/2000/svg", viewBox:"-100 -100 200 200" do
#     @walls.each do |w|
#       doc.circle(:r => 3, :cx => w.xposition, :cy => w.yposition)
#     end
#   end
# end
# b.to_xml
# b = Nokogiri::XML::Builder.new do |doc|
#   doc.svg xmlns:"http://www.w3.org/2000/svg", viewBox:"-100 -100 200 200" do
#     points.each do |x,y|
#       doc.circle r:3, cx:x, cy:y
#     end
#   end
# end
