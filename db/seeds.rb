# frozen_string_literal: true

(1..100).each do |number|
  User.create(name: 'name' + number.to_s, email: 'test' + number.to_s + '@example.com', password: number.to_s)
end
