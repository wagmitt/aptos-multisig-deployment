module multisig_code::hello_world {
    use std::string;
    use std::signer;
    use std::error;

    /// Error codes
    const ENOT_INITIALIZED: u64 = 1;

    const ENOT_ALLOWED: u64 = 2;

    /// Stores the greeting message
    struct Message has key {
        text: string::String,
    }

    /// Initialize the module with default greeting
    fun init_module(admin: &signer) {
        let admin_addr = signer::address_of(admin);
        assert!(admin_addr == @multisig_code, error::permission_denied(ENOT_ALLOWED));

        let message = Message {
            text: string::utf8(b"Hello World!")
        };
        move_to(admin, message);
    }

    /// Update the greeting message
    public entry fun set_message(new_message: string::String) 
    acquires Message {
        let message = borrow_global_mut<Message>(@multisig_code);
        message.text = new_message;
    }

    /// Get the current greeting message
    #[view]
    public fun get_message(): string::String
    acquires Message {
        let message = borrow_global<Message>(@multisig_code);
        message.text
    }
}