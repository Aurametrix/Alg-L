local current_fiber = false

function spawn_fiber(fn)
   local fiber = coroutine.create(fn)
   schedule_task(function () resume_fiber(fiber) end)
end

function resume_fiber(fiber, ...)
   current_fiber = fiber
   local ok, err = coroutine.resume(fiber, ...)
   current_fiber = nil
   if not ok then
      print('Error while running fiber: '..tostring(err))
   end
end
