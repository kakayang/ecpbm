package com.ecpbm.util;

import com.ecpbm.pojo.TreeNode;

import java.util.ArrayList;
import java.util.List;

public class JsonFactory {
    public static List<TreeNode> buildTree(List<TreeNode> nodes,int id){
        List<TreeNode> treeNodes = new ArrayList<TreeNode>();
        for(TreeNode treeNode:treeNodes){
            TreeNode node = new TreeNode();
            node.setId(treeNode.getId());
            node.setText(treeNode.getText());
            if(id == treeNode.getFid()){
                node.setChildren(buildTree(nodes,node.getId()));
                treeNodes.add(node);
            }
        }
        return treeNodes;
    }
}
