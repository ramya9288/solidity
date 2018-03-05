pragma solidity ^0.4.16;

contract Token{
    function deposit(uint256 value)public  returns(uint256 ){}
    function withdraw(uint256 value)public   returns(uint256){}
    function balanceOf(address _owner) constant returns (uint256 balance) {}
    function transfer(address _to, uint256 _value) returns (bool success) {}
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {}
    function approve(address _spender, uint256 _value) returns (bool success) {}
    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {}
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract StandardToken is Token{
    address owner;
     mapping (address => uint256) balances;
     mapping(address => mapping(address => uint256)) alowed;
     uint256 public totalSupply;
     
     modifier check(){
         require(msg.sender==owner);
         _;
     }
     
     function deposit(uint256 _value)public  check() returns(uint256 ){
         balances[msg.sender] += _value;
         return balances[msg.sender];
     } 
     
     function transfer(address _to,uint256 _value) returns(bool success) {
         require(balances[msg.sender] >= _value && _value > 0 );
             
             balances[msg.sender] -= _value;
             balances[_to] += _value;
             Transfer(msg.sender,_to,_value);
             return true;
       }
     
      function withdraw(uint256 _value)public check()  returns(uint256){
        balances[msg.sender]-=_value;
        return balances[msg.sender];
      }
     
     function transferFrom(address _from,address _to,uint256 _value) returns(bool success) {
        require (balances[_from] >= _value && _value > 0 && alowed[_from][_to] >= _value);
             
             balances[_from] -= _value;
             balances[_to] += _value;
             alowed[_from][_to] -= _value;
             Transfer(_from,_to,_value);
             return true;
     }
     
     function balanceOf(address _owner) constant returns(uint256 balance){
         return balances[_owner];
     }
     
     function approve(address _spender,uint256 _value) returns(bool success){
         alowed[msg.sender][_spender] = _value;
         Approval(msg.sender,_spender,_value);
         return true;
     }
     
     
     function allowance(address _owner,address _spender) constant returns(uint256 remaining){
         return alowed[_owner][_spender];
     }
     
}

contract TestCoin is StandardToken{
    
    string public name;
    uint8 public decimals;
    string public symbol;
    
     function TestCoin(){
        totalSupply = 5000;
        balances[msg.sender]=totalSupply;
        name = "MNW Token";
        symbol = "MNW";
        decimals = 18;
        
    }
  
}
