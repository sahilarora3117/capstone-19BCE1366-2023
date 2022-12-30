// SPDX LIS necessary 0.6.8 onwards
// SPDX-License-Identifier: MIT
// define solidity version at top always. ^0.60 means all 0.6 versions. 0.6 means just 0.6.
pragma solidity >= 0.6.0 <0.9.0;
// define contract-- like a class in OOP
pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;
contract SimpleStorage {
    // uint256 favoriteNumber;

    uint256 public logCount = 0;
    struct LogisticLog {
        uint256 itemID;
        string itemName;
        string itemICAO;
        uint256 stepID;
    }


    // This is a comment!
    // struct People {
    //     uint256 favoriteNumber;
    //     string name;
    // }

    // People[] public people;
    LogisticLog[] public logisticlog;

    // mapping(string => uint256) public nameToFavoriteNumber;
    mapping(uint256 => LogisticLog) public logisticlogger;
    // function store(uint256 _favoriteNumber) public {
    //     // default scope for state variables is internal
    //     // internal - inside contract only
    //     // external - outside contraxt only
    //     // public - both, by anyone
    //     // private - restricive, only current contract not derived
    //     favoriteNumber = _favoriteNumber;
    // }

    function create_store_event(uint256 _itemID, string memory _itemName, string memory _itemICAO, uint256 _stepID) public {
        logisticlogger[logCount] = LogisticLog (
            _itemID,
            _itemName,
            _itemICAO,
            _stepID 
        );
        logCount++;


    } 

    function retrieveLog () public view returns (LogisticLog[] memory) {
        LogisticLog[] memory _torets = new LogisticLog[](logCount);
        for (uint i = 0; i < logCount; i++) {
            LogisticLog storage _toret = logisticlogger[i];
            _torets[i] = _toret;
        }
        return _torets;
    }
    
    function retrieveLogID (uint256 _itemID) public view returns (LogisticLog[] memory) {
        LogisticLog[] memory _torets = new LogisticLog[](logCount);
        uint j = 0;
        for (uint i = 0; i < logCount; i++) {
            if (logisticlogger[i].itemID == _itemID) {
            LogisticLog storage _toret = logisticlogger[i];
            _torets[j] = _toret;
            j += 1;
            }
            
        }
        return _torets;
    }
    function retrieve_logCount() public view returns (uint256) {
        return logCount;
    }

    // function addPerson(string memory _name, uint256 _favoriteNumber) public {
    //     people.push(People(_favoriteNumber, _name));
    //     nameToFavoriteNumber[_name] = _favoriteNumber;
    // }
}
