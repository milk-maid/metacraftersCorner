import {useState, useEffect} from "react";
import {ethers} from "ethers";
import atm_abi from "../artifacts/contracts/Assessment.sol/SimpleWallet.json";

export default function HomePage() {
  const [ethWallet, setEthWallet] = useState(undefined);
  const [account, setAccount] = useState(undefined);
  const [atm, setATM] = useState(undefined);
  const [balance, setBalance] = useState(undefined);
  const [owner, setOwner] = useState(undefined); // here

  const contractAddress = "0x4F7A7fd160fB11FDf4B1A6C5Fba1Fa3AceF6618d";
  const atmABI = atm_abi.abi;

  const getWallet = async() => {
    if (window.ethereum) {
      setEthWallet(window.ethereum);
    }

    if (ethWallet) {
      const account = await ethWallet.request({method: "eth_accounts"});
      handleAccount(account);
    }
  }

  const handleAccount = (account) => {
    if (account) {
      console.log ("Account connected: ", account);
      setAccount(account);
    }
    else {
      console.log("No account found");
    }
  }

  const connectAccount = async() => {
    if (!ethWallet) {
      alert('MetaMask wallet is required to connect');
      return;
    }
  
    const accounts = await ethWallet.request({ method: 'eth_requestAccounts' });
    handleAccount(accounts);
    
    // once wallet is set we can get a reference to our deployed contract
    getATMContract();
  };

  const getATMContract = () => {
    const provider = new ethers.providers.Web3Provider(ethWallet);
    const signer = provider.getSigner();
    const atmContract = new ethers.Contract(contractAddress, atmABI, signer);
 
    setATM(atmContract);
   
  }

  const getBalance = async() => {
    if (atm) {
      const provider = new ethers.providers.JsonRpcProvider('https://eth-sepolia.g.alchemy.com/v2/9FqEbGq7FnPewUll5oDHuLm7-TbZCOMT');
      const Contract = new ethers.Contract(contractAddress, atmABI, provider); 
      setBalance((await Contract.getBalance()).toNumber());
    }
  }

  const getOwnerAddr = async() => {
    if (atm) {
      const provider = new ethers.providers.JsonRpcProvider('https://eth-sepolia.g.alchemy.com/v2/9FqEbGq7FnPewUll5oDHuLm7-TbZCOMT');
      const Contract = new ethers.Contract(contractAddress, atmABI, provider);
      setOwner((await Contract.getOwner()));
    }
  }

  const deposit = async() => {
    if (atm) {
      let tx = await atm.saveKudi({value: 1 });
      await tx.wait()
      getBalance();
    }
  }

  const withdraw = async() => {
    if (atm) {
      let tx = await atm.comotKudi({value: 1 });
      await tx.wait()
      getBalance();
    }
  }

  const transfer = async() => {
    if (atm) {
      console.log(atm)
      let tx = await atm.transfer("0x39957680007082AF64C821c78dA333d12EB66D6B", 2);
      await tx.wait()
      getBalance();
    }
  }

  const changeOwner = async() => {
    if (atm) {
      console.log(atm)
      let tx = await atm.changeOwner("0x39957680007082AF64C821c78dA333d12EB66D6B");
      await tx.wait()
      getBalance();
    }
  }

  const initUser = () => {
    // Check to see if user has Metamask
    if (!ethWallet) {
      return <p>Please install Metamask in order to use this ATM.</p>
    }

    // Check to see if user is connected. If not, connect to their account
    if (!account) {
      return <button onClick={connectAccount}>Please connect your Metamask wallet</button>
    }

    if (balance == undefined) {
      getBalance();
    }

    // if(owner == undefined){
    //   getOwnerAddr();
    // }

    return (
      <div>
        <p>Your Account: {account}</p>
        {/* <p>Your Balance: {balance}</p> */}
        <button onClick={transfer}>Transfer some funds</button>
        <button onClick={deposit}>Deposit ETH</button>
        <button onClick={withdraw}>Withdraw ETH</button>
        <button onClick={changeOwner}>Change The Owner: 0x3995...</button>
        {/* <p>This is the Contract Owner: {owner}</p> */}
      </div>
    )
  }

  useEffect(() => {getWallet();}, []);

  return (
    <main className="container">
      <header><h1>Welcome to the Metacrafters ATM! ROQBELL On The Wheel</h1></header>
      {initUser()}
      <style jsx>{`
        .container {
          text-align: center
        }
      `}
      </style>
    </main>
  )
}
