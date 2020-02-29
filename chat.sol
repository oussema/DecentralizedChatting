pragma solidity  ^0.4.17;

contract chat {
    
    address public manager;
    
    struct Message {
        string value;
        address sender;
    }
    
    mapping(address => Message) private messages;
    
    function chat() public{
        manager=msg.sender;
    }
    
    function sendMessage(address _receiver,string _value) public {
        Message memory newMessage= Message({value:_value,sender:msg.sender});
        messages[_receiver]=newMessage;
    }
    
    function receiveMessage(address _receiver) public view returns(string,address) {
        require(_receiver==msg.sender);
        Message memory newMessage= messages[_receiver];
        return (newMessage.value,newMessage.sender);
    }
    
}
