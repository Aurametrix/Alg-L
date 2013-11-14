a = {n=10}
    print(table.getn(a))               --> 10
    
-- creates an array with indices from -5 to 5
    a = {}
    for i=-5, 5 do
      a[i] = 0
      print(a[i])            --> print each value
    end

squares = {1, 4, 9, 16, 25, 36, 49, 64, 81}

-- matrix - array of arrays, e.g. N by M of zeroes 
    mt = {}          -- create the matrix
    for i=1,N do
      mt[i] = {}     -- create a new row
      for j=1,M do
        mt[i][j] = 0
      end
    end

-- matrix from two indices composed into a single one, e.g. N by M of zeroes  
    mt = {}          -- create the matrix
    for i=1,N do
      for j=1,M do
        mt[i*M + j] = 0
      end
    end
