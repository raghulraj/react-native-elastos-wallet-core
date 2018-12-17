'use strict';
const React = require('react');
const ReactNative = require('react-native');
const {Text, View, StyleSheet} = ReactNative;
const {TestModule} = ReactNative.NativeModules;

// Adem, Need help here in getting RNElastosMainchain native module. can you please check, in your local 
// working repo, are you able to get the native module?

React.PropTypes=require('prop-types');
React.createClass=require('create-react-class');

var Tests = React.createClass({
  shouldResolve: false,
  shouldReject: false,
  getInitialState() {
    return {
      done: false,
    };
  },
  componentDidMount() {
    if(this.props.TestName === "testElaWallet"){
      Promise.all([this.testSomeTest()]).then(()=>
      {
        TestModule.markTestPassed(this.shouldResolve);
      });
      return;
    }
  },
  async testElaWallet(){
  var one = 1;
  var two = 2;
  var three = one + two;
    if(three === 3){
      this.shouldResolve = true;
    }else{
      this.shouldResolve = false;
    }
  },
  render() : ReactElement<any> {
    return <View />;
  }
});

Tests.displayName = 'WalletTests';

module.exports = WalletTests;
