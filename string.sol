pragma solidity^0.4.0;
contract str{
    function compare (bytes a,bytes b)public constant returns(bool){
         if(a.length !=b.length){
             return (false);
         }
        for(uint256 i=0;i<a.length;i++) {
            if(a[i]!=b[i]) {
                return false;
            }
        }
        return true;
         
    }
 }
