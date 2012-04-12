#!/usr/bin/env ruby
require 'rubygems'
require 'phidgets-ffi'

servo = Phidgets::Servo.new

servo.on_attach do |device, obj|
  puts "#{device.device_class} attached"
  device.servos[0].engaged = true
  device.servos[0].type = Phidgets::FFI::ServoType[:default]
end

servo.on_position_change do |device, motor, position|
  puts "servo[#{motor.index}] => #{position}"
end

sleep 5
if servo.attached?
  loop do
    servo.servos[0].position = rand(servo.servos[0].position_max)
    sleep 1.5
  end
else
  puts 'device not found'
end

