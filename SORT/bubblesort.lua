-- bubble sort
function bubbleSort(A)
  local itemCount=#A
  local hasChanged
  repeat
    hasChanged = false
    itemCount=itemCount - 1
    for i = 1, itemCount do
      if A[i] > A[i + 1] then
        A[i], A[i + 1] = A[i + 1], A[i]
        hasChanged = true
      end
    end
  until hasChanged == false
end
 
--example
 
list = { 5, 2, 7, 3, 4, 7, 1}
bubbleSort(list)
for i, j in pairs(list) do
    print(j)
end
