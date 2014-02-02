--[[ 
wxLua  - wrapper around the wxWidgets cross-platform C++ GUI library
file renamer
--]]

require("wx")

local frmMain = require("frmMain")
local pretty  = require("pl.pretty")

cfg = {
  menu = {
    mniFlags_i  =  true,  -- PCRE_CASELESS
    mniFlags_x  =  false, -- PCRE_EXTENDED
    mniFlags_U  =  false, -- PCRE_UNGREEDY
    mniHidden   =  true,  -- include hidden files
    mniPreserve =  true,  -- preserve file extensions
    mniRecurse  =  false, -- recurse into subdirs
  },
  filter   =  nil,        -- current filter
  exclude  =  false,      -- exclude filtered files
  f_hist   =  {},         -- filter history
  m_hist   =  {},         -- match history
  r_hist   =  {}          -- replace history
}

function load_cfg()
  local f = io.open("renamer.cfg", "r")
  if not f then return end
  local g = f:read("*all")
  f:close()
  local c = pretty.read(g)
  if not c then return end
  for k, v in pairs(c) do
    if cfg[k] then cfg[k] = v end
  end
end

function save_cfg()
  pretty.dump(cfg, "renamer.cfg")
end

function update_history(hist, ctrl)
  if ctrl:GetValue() then table.insert(hist, ctrl:GetValue()) end
  ctrl:Clear()
  for k,v in pairs(hist) do ctrl:Insert(v, k) end
end

frmMain:Show(true)

wx.wxGetApp():MainLoop()
