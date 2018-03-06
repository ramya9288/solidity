pragma solidity ^0.4.0;
contract simple{
    
    modifier ex(uint256 a,uint256 b){
        require(a>0 && b>0);
         _;
    }
 function add(uint256 a,uint256 b)public ex(a,b) constant returns(uint256){
     return a+b;
 }
 function sub(uint256 a,uint256 b)public ex(a,b) constant returns(uint256){
     return a-b;
}
function mul(uint256 a,uint256 b)public ex(a,b) constant returns(uint256){
     return a*b;
}
}
