# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DeviceHistory.destroy_all
Device.destroy_all
DeviceModel.destroy_all
DeviceType.destroy_all
DeviceManufacturer.destroy_all
Room.destroy_all
Office.destroy_all
User.destroy_all

# USERS
user_demo = User.create(full_name: 'Demo', email: 'demo@demo.lt', password: 'demo', is_active: true)
user = User.create(full_name: 'User 1', email: 'a@a.lt', password: 'a', is_active: true)

# OFFICES
office_viln = Office.create(name: 'Vilnius office', address: 'Vilnius g. 1, Vilnius', is_active: true)
office_kaun = Office.create(name: 'Kaunas office', address: 'Kauno g. 1, Kaunas', is_active: true)
office_klai = Office.create(name: 'Klaipeda office', address: 'Klaipedos g. 1, Klaipeda', is_active: false)

# ROOMS
room_viln_100 = Room.create(office: office_viln, name: 100, is_active: true)
room_viln_101 = Room.create(office: office_viln, name: 101, is_active: true)
room_viln_102 = Room.create(office: office_viln, name: 102, is_active: true)
room_viln_103 = Room.create(office: office_viln, name: 103, is_active: true)
room_viln_104 = Room.create(office: office_viln, name: 104, is_active: true)
room_viln_105 = Room.create(office: office_viln, name: 105, is_active: true)
room_viln_106 = Room.create(office: office_viln, name: 106, is_active: true)
room_viln_107 = Room.create(office: office_viln, name: 107, is_active: true)
room_viln_108 = Room.create(office: office_viln, name: 108, is_active: true)
room_viln_109 = Room.create(office: office_viln, name: 109, is_active: true)

room_kaun_200 = Room.create(office: office_kaun, name: 200, is_active: true)
room_kaun_201 = Room.create(office: office_kaun, name: 201, is_active: true)
room_kaun_202 = Room.create(office: office_kaun, name: 202, is_active: true)
room_kaun_203 = Room.create(office: office_kaun, name: 203, is_active: false)
room_kaun_204 = Room.create(office: office_kaun, name: 204, is_active: true)
room_kaun_205 = Room.create(office: office_kaun, name: 205, is_active: false)
room_kaun_206 = Room.create(office: office_kaun, name: 206, is_active: true)
room_kaun_207 = Room.create(office: office_kaun, name: 207, is_active: false)
room_kaun_208 = Room.create(office: office_kaun, name: 208, is_active: false)
room_kaun_209 = Room.create(office: office_kaun, name: 209, is_active: false)

room_klai_100 = Room.create(office: office_klai, name: 100, is_active: false)
room_klai_101 = Room.create(office: office_klai, name: 101, is_active: false)
room_klai_102 = Room.create(office: office_klai, name: 102, is_active: false)
room_klai_103 = Room.create(office: office_klai, name: 103, is_active: false)
room_klai_104 = Room.create(office: office_klai, name: 104, is_active: false)
room_klai_300 = Room.create(office: office_klai, name: 300, is_active: false)
room_klai_301 = Room.create(office: office_klai, name: 301, is_active: false)
room_klai_302 = Room.create(office: office_klai, name: 302, is_active: false)
room_klai_303 = Room.create(office: office_klai, name: 303, is_active: false)
room_klai_304 = Room.create(office: office_klai, name: 304, is_active: false)
room_klai_305 = Room.create(office: office_klai, name: 305, is_active: false)
room_klai_306 = Room.create(office: office_klai, name: 306, is_active: false)
room_klai_307 = Room.create(office: office_klai, name: 307, is_active: false)
room_klai_308 = Room.create(office: office_klai, name: 308, is_active: false)
room_klai_309 = Room.create(office: office_klai, name: 309, is_active: false)

# DEVICE MANUFACTURERS
devma_hp = Device.create(name: 'HP')
devma_lenovo = Device.create(name: 'Lenovo')
devma_philips = Device.create(name: 'Philips')
devma_lexmark = Device.create(name: 'Lexmark')
devma_xerox = Device.create(name: 'Xerox')
