//
//  ViewController.swift
//  BinaryTreeTraversal
//
//  Created by Praveen on 9/7/19.
//  Copyright © 2019 Praveen. All rights reserved.
//

import UIKit

// Definition of Binary tree node.
public class TreeNode {
    public var value: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ value: Int) {
       self.value = value
       self.left = nil
       self.right = nil
     }
}

// Definition of stack data structure.
public struct Stack<T> {
    var elements = [T]()
    
    // Method to push element at the end of Stack.
    mutating func push(_ element:T) {
        self.elements.append(element)
    }
    
    // Method to pop (remove) last element from Stack.
    mutating func pop() -> T? {
        return self.elements.removeLast()
    }
    
    // property to check if stack is Empty.
    var isEmpty:Bool {
        return elements.isEmpty
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /* Pre order traverse the tree in <root><left node><right node> order.
    */
    func preorderTraversal(root:TreeNode?) -> [Int] {
        
        var treeElements = [Int]()
        
        // Verify if root has data. If doesn't early exit from the function.
        guard let rootValue = root else {
            return treeElements
        }
        
        // Define stack to store tree Nodes.
        var myStack = Stack<TreeNode>()
        
        //Push root elelment to stack.
        myStack.push(rootValue)
        
        while !myStack.isEmpty {
            // Pop the element from the stack and assign it to variable,
            guard let currentNode = myStack.pop() else {
                  return treeElements
            }
            
            // Append the current node value to result array.
            treeElements.append(currentNode.value)
            
            // Check if the last popped node has right node, If yes, push that node to Stack.
            if let rightNode = currentNode.right {
                myStack.push(rightNode)
            }
            
            // Check if the last popped node has left node, If yes, push that node to Stack.
            if let leftNode = currentNode.left {
                myStack.push(leftNode)
            }
        }
        return treeElements
    }
}

