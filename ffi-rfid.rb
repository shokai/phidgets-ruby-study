#!/usr/bin/env ruby
require 'rubygems'
require 'phidgets-ffi'

rfid = Phidgets::RFID.new

puts 'waiting RFID Reader'

rfid.on_attach do |device, obj|
  puts "#{device.device_class} attached"
  device.antenna = true
  device.led = true
  sleep 1
end

rfid.on_tag do |device, tag, obj|
  puts "tag : #{tag}"
end

rfid.on_tag_lost do |device, tag, obj|
  puts "tag lost : #{tag}"
end

sleep 5
if rfid.attached?
  loop do
  end
else
  puts 'device not found'
end
