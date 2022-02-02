const {expect} = require("chai");
const {ether} = require("hardhat");

/** Describe used for testing takes two arguments name of test group
and second a callback function*/
describe("Token contracts",  () => {
  it("Deployment should assign total supply of tokens to the owner",
     async () => {
       const [owner] = await ethers.getSigners();
       const Token = await ethers.getContractFactory("Token");
       const hardhatToken = await Token.deploy();

       const ownerBalance = await hardhatToken.getBalance(owner.address);
       expect(await hardhatToken.totalSupply()).to.equal(ownerBalance);
     });
});
