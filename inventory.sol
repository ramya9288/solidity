pragma solidity^0.4.0;
contract shop{
    uint256 t;
    struct pro{
        uint256 pid;
        uint256 price;
        uint256 pcount;
       string name;
    }
    struct cus{
        uint256 quantity;
     }
    mapping(uint256=>pro)vpro;
    mapping(uint256=>cus)vcus;
    
    function shop(){
        t=now+1 hours;
    }
     function product(uint256 _price,uint256 pcount,uint256 pid,string name)public  time() {
       vpro[pid].price=_price;
       vpro[pid].pcount=pcount;
       vpro[pid].name=name;
      
    }
    
   
   modifier time(){
        require(t>now);
        _;
    }
    function customer(uint256 quan,uint256 pid)public  time() constant returns(uint256,string){
      if(vpro[pid].pcount>=quan){
          
          vcus[pid].quantity=quan;
          uint256 a= vpro[pid].pcount- vcus[pid].quantity;
          require(!(a<vcus[pid].quantity));
        return ( vpro[pid].price* vcus[pid].quantity,"come again");
        
        }
        else{
            return (0,"not available");
        }
    }
 }
