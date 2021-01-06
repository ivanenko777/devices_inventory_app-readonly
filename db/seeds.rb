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
user = User.create(full_name: 'User 1', email: 'a@a.lt', password: 'a', is_active: true)
user_demo = User.create(full_name: 'Demo', email: 'demo@demo.lt', password: 'demo', is_active: true)
User.curr_user = user

# OFFICES
office_viln = Office.create(name: 'Vilnius office', address: 'Vilnius g. 1, Vilnius', is_active: true)
office_kaun = Office.create(name: 'Kaunas office', address: 'Kauno g. 1, Kaunas', is_active: false)

# ROOMS
room_viln_100 = Room.create(office: office_viln, name: 100, is_active: true)
room_viln_101 = Room.create(office: office_viln, name: 101, is_active: true)
room_viln_102 = Room.create(office: office_viln, name: 102, is_active: true)
room_viln_103 = Room.create(office: office_viln, name: 103, is_active: true)
room_viln_104 = Room.create(office: office_viln, name: 104, is_active: false)

room_kaun_200 = Room.create(office: office_kaun, name: 200, is_active: true)
room_kaun_201 = Room.create(office: office_kaun, name: 201, is_active: true)
room_kaun_202 = Room.create(office: office_kaun, name: 202, is_active: true)
room_kaun_203 = Room.create(office: office_kaun, name: 203, is_active: false)
room_kaun_204 = Room.create(office: office_kaun, name: 204, is_active: false)

# DEVICE MANUFACTURERS
devma_hp = DeviceManufacturer.create(name: 'HP')
devma_lenovo = DeviceManufacturer.create(name: 'Lenovo')
devma_xerox = DeviceManufacturer.create(name: 'Xerox')

# DEVICE TYPES
devty_desktop = DeviceType.create(sys_name: 'desktop', name: 'Desktop')
devty_display = DeviceType.create(sys_name: 'display', name: 'Display')
devty_laptop = DeviceType.create(sys_name: 'laptop', name: 'Laptop')
devty_mfp = DeviceType.create(sys_name: 'mfp', name: 'Multifunction Printers')

# DEVICE MODELS
devmo_desktop_hp_290 = DeviceModel.create(device_type: devty_desktop, device_manufacturer: devma_hp, name: '290 G2 SFF', is_active: true)
devmo_desktop_hp_490 = DeviceModel.create(device_type: devty_desktop, device_manufacturer: devma_hp, name: 'ProDesc 405 G4', is_active: true)
devmo_display_hp_n223 = DeviceModel.create(device_type: devty_display, device_manufacturer: devma_hp, name: 'N223 21.5"', is_active: true)
devmo_display_hp_n246v = DeviceModel.create(device_type: devty_display, device_manufacturer: devma_hp, name: 'N246v 23.8"', is_active: true)
devmo_laptop_lenovo_P15v = DeviceModel.create(device_type: devty_laptop, device_manufacturer: devma_lenovo, name: 'ThinkPad P15v', is_active: true)
devmo_laptop_lenovo_T15 = DeviceModel.create(device_type: devty_laptop, device_manufacturer: devma_lenovo, name: 'ThinkPad T15', is_active: true)
devmo_mfp_xerox_3335 = DeviceModel.create(device_type: devty_mfp, device_manufacturer: devma_xerox, name: 'WorkCentre 3335', is_active: true)

# DEVICES
dev01 = Device.create(device_model: devmo_desktop_hp_290, room: room_viln_100, asset_no: '00001', serial_no: 'SN00001', status: 1)
dev02 = Device.create(device_model: devmo_display_hp_n223, room: room_viln_100, asset_no: '00002', serial_no: 'SN00002', status: 1)
dev03 = Device.create(device_model: devmo_desktop_hp_290, room: room_viln_100, asset_no: '00003', serial_no: 'SN00003', status: 1)
dev04 = Device.create(device_model: devmo_display_hp_n223, room: room_viln_100, asset_no: '00004', serial_no: 'SN00004', status: 1)
dev09 = Device.create(device_model: devmo_mfp_xerox_3335, room: room_viln_100, asset_no: '00009', serial_no: 'SN00009', status: 1)

dev05 = Device.create(device_model: devmo_desktop_hp_490, room: room_viln_101, asset_no: '00005', serial_no: 'SN00005', status: 1)
dev06 = Device.create(device_model: devmo_display_hp_n246v, room: room_viln_101, asset_no: '00006', serial_no: 'SN00006', status: 1)
dev07 = Device.create(device_model: devmo_desktop_hp_490, room: room_viln_101, asset_no: '00007', serial_no: 'SN00007', status: 1)
dev08 = Device.create(device_model: devmo_display_hp_n246v, room: room_viln_101, asset_no: '00008', serial_no: 'SN00008', status: 1)
dev10 = Device.create(device_model: devmo_mfp_xerox_3335, room: room_viln_101, asset_no: '00010', serial_no: 'SN00010', status: 1)

dev11 = Device.create(device_model: devmo_laptop_lenovo_P15v, room: room_viln_102, asset_no: '00011', serial_no: 'SN00011', status: 1)
dev12 = Device.create(device_model: devmo_display_hp_n246v, room: room_viln_102, asset_no: '00012', serial_no: 'SN00012', status: 1)
dev13 = Device.create(device_model: devmo_laptop_lenovo_P15v, room: room_viln_102, asset_no: '00013', serial_no: 'SN00013', status: 1)
dev14 = Device.create(device_model: devmo_display_hp_n246v, room: room_viln_102, asset_no: '00014', serial_no: 'SN00014', status: 1)
dev15 = Device.create(device_model: devmo_mfp_xerox_3335, room: room_viln_102, asset_no: '00015', serial_no: 'SN00015', status: 1)

dev16 = Device.create(device_model: devmo_laptop_lenovo_T15, room: room_viln_103, asset_no: '00016', serial_no: 'SN00016', status: 1)
dev17 = Device.create(device_model: devmo_display_hp_n246v, room: room_viln_103, asset_no: '00017', serial_no: 'SN00017', status: 1)
dev18 = Device.create(device_model: devmo_laptop_lenovo_T15, room: room_viln_103, asset_no: '00018', serial_no: 'SN00018', status: 1)
dev19 = Device.create(device_model: devmo_display_hp_n246v, room: room_viln_103, asset_no: '00019', serial_no: 'SN00019', status: 1)
dev20 = Device.create(device_model: devmo_mfp_xerox_3335, room: room_viln_103, asset_no: '00020', serial_no: 'SN00020', status: 1)

dev21 = Device.create(device_model: devmo_laptop_lenovo_P15v, room: room_viln_103, asset_no: '00021', serial_no: 'SN00021', status: 1)
dev22 = Device.create(device_model: devmo_display_hp_n246v, room: room_viln_103, asset_no: '00022', serial_no: 'SN00022', status: 1)
dev23 = Device.create(device_model: devmo_laptop_lenovo_P15v, room: room_viln_103, asset_no: '00023', serial_no: 'SN00023', status: 1)
dev24 = Device.create(device_model: devmo_display_hp_n246v, room: room_viln_103, asset_no: '00024', serial_no: 'SN00024', status: 1)
dev25 = Device.create(device_model: devmo_mfp_xerox_3335, room: room_viln_103, asset_no: '00025', serial_no: 'SN00025', status: 1)

# DEVICEHISTORY
dev01.update(room: room_viln_104)
dev02.update(room: room_viln_104)
dev03.update(room: room_viln_104)
dev04.update(room: room_viln_104)
dev09.update(room: room_viln_104)

dev05.update(room: room_viln_100)
dev06.update(room: room_viln_100)
dev07.update(room: room_viln_100)
dev08.update(room: room_viln_100)
dev10.update(room: room_viln_100)

dev11.update(room: room_viln_101)
dev12.update(room: room_viln_101)
dev13.update(room: room_viln_101)
dev14.update(room: room_viln_101)
dev15.update(room: room_viln_101)

dev16.update(room: room_viln_102)
dev17.update(room: room_viln_102)
dev18.update(room: room_viln_102)
dev19.update(room: room_viln_102)
dev20.update(room: room_viln_102)

dev21.update(room: room_viln_103)
dev22.update(room: room_viln_103)
dev23.update(room: room_viln_103)
dev24.update(room: room_viln_103)
dev25.update(room: room_viln_103)

dev21.update(status: 2)
dev22.update(status: 2)
dev23.update(status: 2)
dev24.update(status: 2)
dev25.update(status: 2)