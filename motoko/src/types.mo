/**
 * Module     : types.mo
 * Copyright  : 2021 DFinance Team
 * License    : Apache 2.0 with LLVM Exception
 * Maintainer : DFinance Team <hello@dfinance.ai>
 * Stability  : Experimental
 */

import Time "mo:base/Time";
import TrieSet "mo:base/TrieSet";

module {
    // e.g. IPFS => ipfshash; URL => https://xxx; ...
    public type Metadata = {
        name: Text;
        desc: Text;
        totalSupply: Nat;
        owner: Principal;
    };

	public type KV = {
		key: Text;
		value: Text;
	};

	public type TokenMetadata = [KV];

    public type TokenInfo = {
        index: Nat;
        var owner: Principal;
        var name: Text;
		var tokenMetadata: TokenMetadata;
        var desc: Text;
        var approval: ?Principal;
        timestamp: Time.Time;
    };

    public type TokenInfoExt = {
        index: Nat;
        owner: Principal;
        tokenMetadata: TokenMetadata;
        name: Text;
        desc: Text;
        approval: ?Principal;
        timestamp: Time.Time;
    };

    public type UserInfo = {
        var allows: TrieSet.Set<Principal>;         // principals allowed to operate on owner's behalf
        var allowedBy: TrieSet.Set<Principal>;      // principals approved owner
        var allowedIds: TrieSet.Set<Nat>;           // tokens controlled by owner
        var tokens: TrieSet.Set<Nat>;               // owner's tokens
    };

    public type UserInfoExt = {
        allows: [Principal];
        allowedBy: [Principal];
        allowedIds: [Nat];
        tokens: [Nat];
    };
    /// Update call operations
    public type Operation = {
        #mint;  
        #burn;
        #transfer;
        #approve;
        #approveAll;
        #unapproveAll; 
    };
    /// Update call operation record fields
    public type OpRecord = {
        caller: Principal;
        op: Operation;
        index: Nat;
		tokenIndex: ?Nat;
		from: Principal;
		to: Principal;
		timestamp: Time.Time;
    };
};