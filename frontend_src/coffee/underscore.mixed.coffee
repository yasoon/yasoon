define(
  'underscore',
  [
    'vendor/lodash.underscore'
  ]
  (
    _
  ) ->
    _.mixin({
      'getContent': (id) ->
        id = id - 1
        if Window.config.content[id]
          Window.config.content[id].text
        else
          "Контента с id: #{id} нет!"
    })

    Date.prototype.getMonthName = ->
      month = [
        'Января'
        'Февраля'
        'Марта'
        'Апреля'
        'Мая'
        'Июня'
        'Июля'
        'Августа'
        'Сентября'
        'Октября'
        'Ноября'
        'Декабря'
      ]
      month[this.getMonth()]

    _.mixin({
      getDateText: (date) ->
        dateArr = date.split('/')
        needDate = new Date(parseInt(dateArr[2]), parseInt((dateArr[1]-1)), parseInt(dateArr[0]))
        dateText = "#{dateArr[0]} #{needDate.getMonthName()} #{dateArr[2]}"
        dateText
    })

    _
)