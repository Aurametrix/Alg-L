function repeats(s, n) return n > 0 and s .. repeat(s, n-1) or "" end

  ---[[
  using native string library function
  string.rep(s,n)
--]]

