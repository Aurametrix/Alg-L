local gviz = require "gVizLib"
 
local motionChartOption1 = {
   height = 400,
   width = 800,
 
   luaViewInBrowser = true
  }
 
local schema1 = {
       { name="Fruit",         type="string",    id="Fruit"},
       { name="Date",          type="date",      id="Date"},
       { name="Sales",         type="number",    id="Sales"},
       { name="Expenses",      type="number",    id="Expenses"},
       { name="Location",      type="string",    id="Location"}
  }
 
local dataTable1 = {
   --   Fruit      Date        Sales Expenses, Location
   {'Apples',  "2014-2-1",  1000,    300,   'East'},
   {'Oranges', "2014-2-1",  1150,    200,   'West'},
   {'Bananas', "2014-2-1",   300,    250,   'West'},
   {'Apples',  "2013-5-1",   590,    450,   'East'},
   {'Oranges', "2013-5-1",   890,    950,   'West'},
   {'Bananas', "2013-5-1",  1024,    501,   'West'},
   {'Apples',  "2013-8-1",  1200,    400,   'East'},
   {'Oranges', "2013-8-1",   750,    150,   'West'},
   {'Bananas', "2013-8-1",   788,    617,   'West'},
   {'Apples',  "2013-10-1",  782,    724,   'East'},
   {'Oranges', "2013-10-1",  940,    620,   'West'},
   {'Bananas', "2013-10-1",  540,    370,   'West'}
  }

-- Example: Simple Motion chart from these Lua Tables

local myViz1 = gviz:new(schema1, dataTable1)
myViz1:setHtmlOutputFile([[C:\MotionChart1.html]] ) -- Define an html output filename
myViz1:renderMotionChartToPage(motionChartOption1) 
myViz1:writePageToFile()    -- Write rendered page to the output file
