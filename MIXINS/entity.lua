Entity = class('Entity')

-- Constructor
function Entity:init(x,y)
    self.x = x
    self.y = y
end

object = Entity(300, 400)
