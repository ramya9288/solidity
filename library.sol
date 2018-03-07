pragma solidity^0.4.0;
contract book{
    struct libbk{
        string bname; 
        uint256 bid;
        uint256 stock;
        uint256 count;
        
        }
    struct pubbk{
        string name;
        uint256 id;
    }
    mapping (uint256=>libbk)lbk;
    mapping (uint256=>pubbk)pbk;
    
     function lib(uint256 bid,string bname,uint256 stock)public {
         lbk[bid].bid=bid;
         lbk[bid].bname=bname;
         lbk[bid].stock=stock;
          lbk[bid].count++;
        // lbk[bid].stock=lbk[bid].stock-1;
    }
    function stu(uint256 id,string name)public {
         pbk[id].id=id;
         pbk[id].name=name;
    }
     function display(uint256 bid,uint256 id)public constant returns(uint256,string,uint256){
               
                   return(lbk[bid].count, lbk[bid].bname,lbk[bid].bid);
     }
             

   function bookre(uint256 bid,uint256 id)public  {
     require(lbk[bid].count!=0);
      // lbk[bid].stock=lbk[bid].stock+lbk[bid].count;
        lbk[bid].count--;
         lbk[bid].stock=lbk[bid].stock+lbk[bid].count;
        
          // return(lbk[bid].stock);
    }
   function balance(uint256 bid,uint256 id)public constant  returns(uint256){
        
        require(lbk[bid].stock>0);
       lbk[bid].stock=lbk[bid].stock-lbk[bid].count;
        return(lbk[bid].stock);
    }
                   
    }
    
