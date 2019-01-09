coaches = Coach.create!([{name: 'Jonas', email: 'jonas.preisler@gmail.com', password: 'testtest', password_confirmation: 'testtest'}, {name: 'Roy', email: 'roy@gmail.com', password: 'testtest', password_confirmation: 'testtest'}])
course_categories = CourseCategory.create!([{name: 'BABY 0-1 år'}, {name: 'SMÅBARN 1-5 år'}, {name: 'BARN 5+ år'}, {name: 'VOKSEN CRAWL'}])
course_niveaus = CourseNiveau.create!([{name: 'Nybegynner'}, {name: 'Øvet'}, {name: 'Videregående'}])
cities = City.create!([{name: 'Asker'}, {name: 'Oslo'}, {name: 'Hokksund'}, {name: 'Andre aktiviteter'}])
course_places = CoursePlace.create!([{name: 'Asker Vettre Thon Hotell', city_id: 1}, {name: 'Hokksund Kurbad', city_id: 1}, {name: 'Landøya Barnehage', city_id: 2}, {name: 'Oslo-Sofienbergsenteret', city_id: 2}, {name: 'Risenga Storbassenget(25m)', city_id: 3}, {name: 'Risenga Terapibassenget', city_id: 3}])
courses = Course.create!([{coach_id: 1, price: '1500', course_niveau_id: 1, course_category_id: 1, course_place_id: 6, time_from: '15:30:00', time_to: '16:00:00', day: '2018-12-20'},
																			{coach_id: 1, price: '1500', course_niveau_id: 2, course_category_id: 1, course_place_id: 6, time_from: '16:00:00', time_to: '16:30:00', day: '2019-12-20'},
																			{coach_id: 1, price: '1500', course_niveau_id: 3, course_category_id: 2, course_place_id: 6, time_from: '16:00:00', time_to: '16:30:00', day: '2019-12-22'},
																			{coach_id: 1, price: '1500', course_niveau_id: 1, course_category_id: 3, course_place_id: 6, time_from: '15:30:00', time_to: '16:00:00', day: '2019-12-21'},
																			{coach_id: 2, price: '1500', course_niveau_id: 2, course_category_id: 4, course_place_id: 6, time_from: '16:00:00', time_to: '16:30:00', day: '2019-12-24'},
																			{coach_id: 2, price: '1500', course_niveau_id: 3, course_category_id: 1, course_place_id: 6, time_from: '16:30:00', time_to: '17:00:00', day: '2019-12-20'},
																			{coach_id: 2, price: '1500', course_category_id: 2, course_place_id: 6, time_from: '17:00:00', time_to: '17:30:00', day: '2019-12-24'},
																			{coach_id: 2, price: '1500', course_category_id: 2, course_place_id: 6, time_from: '16:30:00', time_to: '17:00:00', day: '2019-12-20'},
																			{coach_id: 2, price: '1500', course_category_id: 2, course_place_id: 6, time_from: '17:00:00', time_to: '17:30:00', day: '2019-12-20'}
																			])
