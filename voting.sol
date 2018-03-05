pragma solidity ^0.4.0;
contract voting{
    uint256 t;
   struct voters{
       bytes7 name;
       uint count;
       uint256 num;
   }
   modifier vot(){
       require(t>now);
       _;
   }
    function voting()public{
        t=now+50 seconds;
    }
    
     mapping(uint=>voters) voter;
     

    function votemem(uint256 id,bytes7 _name)public{
        
        voter[id].name=_name;
        voter[id].count;
        
    }
    function vote(uint number)public vot() returns(bytes7,uint){
        voter[number].count++;
        
     return(voter[number].name,voter[number].count);
        
    
    }
  function wining()public view  returns(string){
      if(voter[0].count>voter[1].count)
      {
          if(voter[0].count>voter[2].count)
      {
      return "zero";
      
     
  }
      }
      if(voter[1].count>voter[2].count){
          if(voter[1].count>voter[0].count){
              return "one";
          }
      }
      if(voter[2].count>voter[0].count){
          if(voter[2].count>voter[1].count){
              return "second";
          }
      }
  
}

}                   
