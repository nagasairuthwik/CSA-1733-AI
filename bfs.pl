% Define the graph using facts
connected(a, b).
connected(a, c).
connected(b, d).
connected(b, e).
connected(c, f).
connected(c, g).
connected(d, h).
connected(e, i).
% BFS implementation
bfs(Start, Goal, Path) :-
    bfs_queue([node(Start, [])], Goal, PathRev),
    reverse(PathRev, Path).
% Base case: Goal node is reached
bfs_queue([node(Goal, Path)|_], Goal, [Goal|Path]).
% Recursive case: Explore neighboring nodes
bfs_queue([node(Node, Path)|Nodes], Goal, FinalPath) :-
    findall(node(Neighbor, [Node|Path]),
            (connected(Node, Neighbor), \+ member(Neighbor, [Node|Path])),
            NewNodes),
    append(Nodes, NewNodes, UpdatedNodes),
    bfs_queue(UpdatedNodes, Goal, FinalPath).
% Entry point for querying the BFS
find_bfs_path(Start, Goal, Path) :-
    bfs(Start, Goal, Path).