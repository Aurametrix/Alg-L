describe("exec()", function()
    local spy_stub = {
      nop = function() end
    }

    local function mock_ngx(method, request_uri, headers)
      local _ngx
      _ngx = {
        re = ngx.re,
        var = setmetatable({
          request_uri = request_uri,
          http_kong_debug = headers.kong_debug
        }, {
          __index = function(_, key)
            if key == "http_host" then
              spy_stub.nop()
              return headers.host
            end
          end
        }),
        req = {
          set_uri = function(request_uri)
            _ngx.var.request_uri = request_uri
          end,
          get_method = function()
            return method
          end,
          get_headers = function()
            return headers
          end
        }
      }

      return _ngx
    end
    describe("finds an API", function()
      local checks = {
        -- name     upstream url    uris       hosts
        {  "app",   "http://apps",  "/app",   "",                 },
        {  "app",   "http://apps",  "",       "app.example.com"   },
        {  "app",   "http://app",   "/app",   ""                  },
        {  "apps",  "http://app",   "/app",   ""                  },
        {  "apps",  "http://app",   "/apps",  ""                  },
        {  "app",   "http://app",   "",       "app.example.com"   },
        {  "apps",  "http://app",   "",       "app.example.com"   },
        {  "apps",  "http://app",   "",       "apps.example.com"  },
      }

      for i, args in ipairs(checks) do

        it("[" .. i .. "]", function()

          local use_case_apis = {
            {
              name         = args[1],
              upstream_url = args[2],
            }
          }

          if args[3] ~= "" then
            use_case_apis[1]["uris"] = { args[3] }
          end

          local headers = {}

          if args[4] ~= "" then
            use_case_apis[1]["headers"] = {
              ["host"] = { args[4] }
            }

            headers["host"] = args[4]
          end

          local router = assert(Router.new(use_case_apis) )
          local uri    = args[3] ~= "" and args[3] or "/"

          local _ngx = mock_ngx("GET", uri, headers)
          local api, upstream, host_header = router.exec(_ngx)

          assert.same(use_case_apis[1], api)

        end)
      end
    end)
