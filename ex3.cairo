#[contract]
mod Ex3ERC721byKubi {

    ////////////////////////////////
    // Core Library imports
    // These are syscalls and functionalities that allow you to write Starknet contracts
    // use starknet::get_caller_address;
    use starknet::ContractAddress;
    use starknet::contract_address_const; // built-in function that allows to initiate a dummy contract address
    use starknet::contract_address_to_felt252;
    use array::ArrayTrait;
    use option::OptionTrait;
    ////////////////////////////////



    ////////////////////////////////
    // Internal imports
    // These functions become part of the set of functions of the contract
    // for example: `use folder_name::other_folder::file::module::function`;
    ////////////////////////////////



    #[derive(Copy, Drop)]
    struct Ex3Token {
        owner: ContractAddress,
        id: u256,
    }



    ////////////////////////////////
    // Storage
    struct Storage {
        my_ERC721_name: felt252,
        my_ERC721_symbol: felt252,
        token_owner: LegacyMap::<u256, ContractAddress>,
        balances: LegacyMap::<ContractAddress, u256>,
    }
    ////////////////////////////////



    ////////////////////////////////
    // Constructor

    #[constructor]
    fn constructor(name: felt252, symbol: felt252) {
        my_ERC721_name::write(name);
        my_ERC721_symbol::write(symbol);
    }
    ////////////////////////////////



    ////////////////////////////////
    // Events
    // Events are a useful tool for logging and notifying external entities about specific occurrences within a contract.
    // They emit data that can be accessed by clients.

    // #[event]
    // fn EventName(: felt252) {}
    ////////////////////////////////



    ////////////////////////////////
    // Getter functions (view)
    // => read-only functions that allow you to access data from the contract’s storage without modifying it.
    // They can be called by other contracts or externally, and they do not require gas fees as they do not alter the contract’s state.

    #[view]
    fn get_name() -> felt252 {
        return my_ERC721_name::read();
    }

    #[view]
    fn get_symbol() -> felt252 {
        return my_ERC721_symbol::read();
    }

    #[view]
    fn owner_of(token_id: u256) -> ContractAddress {
        return token_owner::read(token_id);
    }

    #[view]
    fn balance_of(user_address: ContractAddress) -> u256 {
        return balances::read(user_address);
    }
    ////////////////////////////////



    ////////////////////////////////
    // External functions
    // => functions that can be called by other contracts or externally by users through a transaction on the blockchain. 
    // They can write to the contract’s storage using the write function. This means that they can change the contract’s state, and therefore, require gas fees for execution.

    #[external]
    fn mint(owner_address: ContractAddress, token_id: u256) {
        // Ensuring token_id is unique
        let exists = _exists(token_id);
        assert(exists == 1, 'token_id already minted');

        // Create a new token
        let new_token = Ex3Token {
            owner: owner_address,
            id: token_id,
        };

        // Updating the 'token_owner' list
        token_owner::write(token_id, owner_address);
        
        // Updating owner's balance
        let balance = balances::read(owner_address);
        let new_balance: u256 = balance + 1_u256; 
        balances::write(owner_address, new_balance);

        // TODO: Create a 'Transfer' event to be used here (not required to validate the exercise, though)

    }

    #[external]
    fn burn(token_id: u256) {
        let owner = owner_of(token_id);

        // Updating owner's balance
        let balance = balances::read(owner);
        let new_balance: u256 = balance - 1_u256; 
        balances::write(owner, new_balance);

        // Removing ownership of the token by returning it to a null contract address
        let null_address: ContractAddress = contract_address_const::<0>(); 
        token_owner::write(token_id, null_address);

        // TODO: Create a 'Transfer' event to be used here (not required to validate the exercise, though)

    }
    ////////////////////////////////



    ////////////////////////////////
    // Internal functions (they can only be called by other functions within the same contract)

    fn _exists(token_id: u256) -> u256 {
        let check_token = token_owner::read(token_id);
        let felt_address = contract_address_to_felt252(check_token);

        // Checking if the token_id has a matching contract address
        if felt_address != 0 { 
            return 1;
        }

        return 0;
    }
    ////////////////////////////////

}




