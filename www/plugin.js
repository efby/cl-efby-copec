
var exec = require('cordova/exec');

var PLUGIN_NAME = 'EfbyPlugin';

var EfbyPlugin = {
  getVersionNumber: function (successCallback, errorCallback) {
    exec(successCallback, errorCallback, PLUGIN_NAME, "getVersionNumber", []);
  },
  getAppName: function (successCallback, errorCallback) {
    exec(successCallback, errorCallback, PLUGIN_NAME, "getAppName", []);
  },
  getVersionCode: function (successCallback, errorCallback) {
    exec(successCallback, errorCallback, PLUGIN_NAME, "getVersionCode", []);
  },
  getInfoApp: function (successCallback, errorCallback) {
    exec(successCallback, errorCallback, PLUGIN_NAME, "getInfoApp", []);
  },
};

module.exports = EfbyPlugin;
