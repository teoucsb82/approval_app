String::titleize = ->
  words = @split(' ')
  array = []
  i = 0
  while i < words.length
    array.push words[i].charAt(0).toUpperCase() + words[i].toLowerCase().slice(1)
    ++i
  array.join ' '

String::capitalize = ->
  return @charAt(0).toUpperCase() + @slice(1);