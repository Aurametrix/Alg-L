local graph_1 = adjacency_list {
  a = {'b'},
  b = {'a', 'c'},
  c = {'a'},
}

local graph_2 = list_of_edges {
  {'a', 'b'},
  {'b', 'a'},
  {'b', 'c'},
  {'c', 'a'},
}

local graph_2 = adjacency_matrix {
  {0, 1, 0},
  {1, 0, 1},
  {1, 0, 0},
}
