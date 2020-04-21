require 'rubygems'
require 'rmagick'

img = Magick::Image::read("world_map.jpg")[0]

#Variables
image_dimmensions = [ 4375, 2773 ]
encounters = 300
squares_on_x = 48
squares_on_y = 30
x_interval = image_dimmensions[0] / squares_on_x
y_interval = image_dimmensions[1] / squares_on_y

purple = "#ff55ff"

(1..encounters).each do
  pixel_x = Random.rand(image_dimmensions[0])
  pixel_y = Random.rand(image_dimmensions[0])
  perimeter_x = pixel_x + 10
  perimeter_y = pixel_y + 10

  encounter = Magick::Draw.new
  encounter.fill(purple)
  encounter.stroke('black').stroke_width(1)
  encounter.circle(pixel_x, pixel_y, perimeter_x, perimeter_y)
  encounter.draw(img)
end

#x_interval = 91.1458 
#y_interval = 92.4333

line = Magick::Draw.new

0.step(image_dimmensions[0], x_interval) do |n|
  line.line(n, 0, n, image_dimmensions[0]) # vert line
  line.draw(img)
end

0.step(image_dimmensions[0], y_interval) do |n|
  line.line(0, n, image_dimmensions[0], n) # horiz line
  line.draw(img)
end

img.write("sc_map_encounter_table.jpg")
