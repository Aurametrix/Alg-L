-- mergesort algorithm main function
function mergeSort(A, p, r)
        -- return if only 1 element
	if p < r then
		local q = math.floor((p + r)/2)
		mergeSort(A, p, q)
		mergeSort(A, q+1, r)
		merge(A, p, q, r)
	end
end
 
-- merging an array split from p-q, q-r
function merge(A, p, q, r)
	local n1 = q-p+1
	local n2 = r-q
	local left = {}
	local right = {}
	
	for i=1, n1 do
		left[i] = A[p+i-1]
	end
	for i=1, n2 do
		right[i] = A[q+i]
	end
	
	left[n1+1] = math.huge
	right[n2+1] = math.huge
	
	local i=1
	local j=1
	
	for k=p, r do
		if left[i]<=right[j] then
			A[k] = left[i]
			i=i+1
		else
			A[k] = right[j]
			j=j+1
		end
	end
end
 
-- fill A with random numbers between 1 and 100
function randArray(A)
	for i=1, 100 do
		A[i] = math.random(100)
	end
end
 
-- print all the elements in the array A
function printArray(A)
	for i=1,#A do
		io.write(A[i] .. ", ")
	end
	io.write("\n")
end
 
 
A = {}
 
-- generate random numbers
randArray(A)
io.write("Original numbers: \n")
printArray(A)
io.write("\n")
 
-- sort the numbers
mergeSort(A, 1, #A)
io.write("Sorted: \n")
printArray(A)
