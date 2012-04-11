#!/usr/bin/env ruby
require 'rubygems'
require 'phidgets-ffi'

ik = Phidgets::InterfaceKit.new

ik.on_attach do |device, obj|
  puts "#{device.device_class} attached"
end

ik.on_sensor_change do |device, input, value, obj|
  puts "sensor[#{input.index}] => #{value}"
end

sleep 5
if ik.attached?
  loop do
  end
else
  puts 'device not found'
end
