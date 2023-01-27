const TrieNode = require("./TrieNode");

class Trie {
    constructor() {
        this.root = new TrieNode();
    }

    insert(word, root = this.root) {

        const charArray = word.split("");

        for (let i = 0; i < charArray.length; i++) {
            const letter = charArray[i];

            if (root.children.hasOwnProperty(letter)) {
                root = root.children[letter];
            } else {
                let node = new TrieNode(letter);
                root.children[letter] = node;
                root = node;
            }
        }

        root.isWord = true;
    }
    contains (word, root = this.root){
        const charArray = word.split("");

        if(charArray.length == 0){
            return false;
        }
        let contains = true; 

        for(let i = 0 ; i < charArray.length ; i++){
            const letter = charArray[i];

            if(!root.isWord && root.children.hasOwnProperty(letter)){
                root = root.children[letter];
            }else{
                return false; 
            }

        }
        if(!root.isWord){
            return false; 
        }

        return contains;
    }
}

module.exports = Trie;
