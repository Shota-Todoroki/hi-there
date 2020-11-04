class Gender < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'Man' },
    { id: 2, name: 'Woman' },
  ]
end
