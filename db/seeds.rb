# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
q = User.create(first_name: "Quy", last_name: "Tran", email: "quy@dbc.com", password: "123456", password_confirmation: "123456")
User.create(first_name: "G", last_name: "Eazy", email: "youngG@gmail.com", password: "simonsays")
User.create(first_name: "Donald", last_name: "Trump", email: "iamdonald@gmail.com", password: "quysays")
User.create(first_name: "Andrew", last_name: "Wiggins", email: "wig1@gmail.com", password: "jermsays")

p1 = q.posts.create
p2 = q.posts.create
p3 = q.posts.create

p1.updates.create(text: "When people ask me if I'm working hard or hardly working, I wanna punch them in the face and ask if they're hurting hard or hardly hurting.")
p2.updates.create(text: "I just looked directly at my phone and thought \"where's my phone?\" So I probably qualify for Mensa")
p3.updates.create(text: "A lot of you lose your shit and have some pretty epic, public meltdowns. I just wanted to say thanks.")
