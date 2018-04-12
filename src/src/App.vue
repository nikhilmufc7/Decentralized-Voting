<template>
  <div id="app">
      <router-view @vote='register'></router-view>
  </div>
</template>

<script>
import Web3 from "web3";
import TruffleContract from "truffle-contract";
import ContractArtifact from "../../build/contracts/Voting.json";

export default {
  name: "app",
  mounted() {
    // connect the network using web3
    Web3.providers.HttpProvider.prototype.sendAsync =
      Web3.providers.HttpProvider.prototype.send;
    if (this.web3) {
      this.provider = this.web3.currentProvider;
    } else {
      this.provider = new Web3.providers.HttpProvider("http://localhost:8545");
    }
    this.web3 = new Web3(this.provider);

    // Initialize a contract
    this.voteContract = TruffleContract(ContractArtifact);
    this.voteContract.setProvider(this.provider);
  },
  data() {
    return {
      web3: null,
      provider: null,
      voteContract: {}
    };
  },
  methods: {
    register(candidate) {
      this.web3.eth.getAccounts((error, accounts) => {
        console.log(`Try to vote on ${candidate}`);

        if (error) {
          console.error("Error: ", error);
        }

        const account = accounts[0];

        this.voteContract
          .deployed()
          .then(instance => {
            return instance.voteForCandidate(candidate, {
              from: account,
              gas: 6721975
            });
          })
          .then(() => {
            this.$swal({
              type: "success",
              title: "Your vote has been recorded on a secure network"
            });
          })
          .catch(err => {
            if (err.message.search("revert")) {
              this.$swal({
                type: "error",
                title: "Oops",
                text: "Ayyy! you have already voted"
              });
            } else {
              console.error("Error: ", err);
            }
          });
      });
    }
  }
};
</script>

<style>

</style>
