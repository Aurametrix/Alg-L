-- objects can be made out of tables
-- table.element is the same as tabe["element"]
-- accessing a key in a table looks like accessing an attribute of an object

object = {}
object["init"] = function(x,y)
    object["x"] = x
    object.y = y
end

object.init(300, 400)
