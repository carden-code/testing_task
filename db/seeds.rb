# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

project = Project.create([{ title: 'Семья' },
                          { title: 'Работа' },
                          { title: 'Прочее' }])

Todo.create([{ text: 'Купить молоко', project: project[0] },
             { text: 'Заменить масло в двигателе до 23 апреля', project: project[0] },
             { text: 'Отправить письмо бабушке', project: project[0] },
             { text: 'Заплатить за квартиру', project: project[0] },
             { text: 'Забрать обувь из ремонта', project: project[0] },
             { text: 'Позвонить заказчику', project: project[1] },
             { text: 'Отправить документы', project: project[1] },
             { text: 'Заполнить отчет', project: project[1] },
             { text: 'Позвонить другу', project: project[2] },
             { text: 'Подготовиться к поездке', project: project[2] }])
