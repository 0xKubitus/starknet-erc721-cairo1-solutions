#[contract]

mod MyContract {

    ////////////////////////////////
    // Core Library imports
    // These are syscalls and functionalities that allow you to write Starknet contracts
    // use starknet::get_caller_address;
    // use starknet::ContractAddress;
    // use array::ArrayTrait;
    // use option::OptionTrait;
    ////////////////////////////////



    ////////////////////////////////
    // Internal imports
    // These functions become part of the set of functions of the contract
    // use folder_name::other_folder::file::module::function;
    ////////////////////////////////



    ////////////////////////////////
    // Storage
    // struct Storage {  }
    ////////////////////////////////



    ////////////////////////////////
    // Constructor

    #[constructor]
    // fn constructor() {  }
    ////////////////////////////////



    ////////////////////////////////
    // Events
    // Events are a useful tool for logging and notifying external entities about specific occurrences within a contract.
    // They emit data that can be accessed by clients.

    #[event]
    // fn EventName(: felt252) {}
    ////////////////////////////////



    ////////////////////////////////
    // Getter functions (view)
    // => read-only functions that allow you to access data from the contract’s storage without modifying it.
    // They can be called by other contracts or externally, and they do not require gas fees as they do not alter the contract’s state.

    #[view]
    // fn view_function_name(: felt252) -> felt252 {  }
    ////////////////////////////////



    ////////////////////////////////
    // External functions
    // => functions that can be called by other contracts or externally by users through a transaction on the blockchain. 
    // They can write to the contract’s storage using the write function. This means that they can change the contract’s state, and therefore, require gas fees for execution.

    #[external]
    // fn external_function_name(: felt252) {  }
    ////////////////////////////////



    ////////////////////////////////
    // Internal functions (they can only be called by other functions within the same contract)

    // fn internal_function_name() {  }
    ////////////////////////////////

}
