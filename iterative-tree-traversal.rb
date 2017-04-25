# Source: https://leetcode.com/problems/binary-tree-inorder-traversal 

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}
def inorder_traversal(root)
    stack, output = [], []
    current = root
    
    while current || stack.any? do
        if current
            # keep going left
            while current do 
                stack.push current
                current = current.left
            end
        else
            # we're done with the left subtree
            current = stack.pop
            output << current.val
            
            # traverse right
            current = current.right
        end
    end
    
    output
end

