pragma solidity >=0.7.0 <0.9.0;


contract coin_ico {
    
    // max number of coins
    uint public max_coin = 1000000;
    
    // rate
    uint public usd_to_coin_rate = 1000;
    
    // total number being bought
    uint public total_bought = 0;
    
    // similar to hashmap?
    mapping(address => uint) equity_coins;
    
    mapping(address => uint) equity_usd;
    
    // checking if an investor can buy coins
    
    modifier can_buy_coins(uint usd_invested) {
        require(usd_invested * usd_to_coin_rate + total_bought <= max_coin);
        _;
    }
    
    function equity_in_coins(address investor) external view returns(uint) {
        return equity_coins[investor];
    }
    
    function equity_in_usd(address investor) external view returns(uint) {
        return equity_usd[investor];
    }
    
    function buy_coins(address investor, uint usd_invested) external 
    can_buy_coins(usd_invested) {
        uint coins_bought = usd_invested * usd_to_coin_rate;
        equity_coins[investor] += coins_bought;
        equity_usd[investor] = equity_coins[investor] / usd_to_coin_rate;
        total_bought += coins_bought;
    }
    
    function sell_coins(address investor, uint coins_sold) external {
        equity_coins[investor] -= coins_sold;
        equity_usd[investor] = equity_coins[investor] / usd_to_coin_rate;
        total_bought -= coins_sold;
    }
    
}